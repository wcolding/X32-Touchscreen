--Submodule.include('Cameras.lua')

--Submodule.include('Channels.lua')

local mixGroupData = {}

function init()
  reset()
end

function reset()
  print('Initializing...')
  local cameraMix
  local cameraChannels
  local channel
  
  local frameCache = {}
  local visibleCache = {}
  local camCounter = 0
  mixGroupData = {}
  mixGroupData[1] = {}
  mixGroupData[2] = {}
  mixGroupData[3] = {}
  mixGroupData[4] = {}

  populateChannelData()
  populateCameraData()

  self.notify(self.children['MonitorSelect'], self.name, cameraData)
  local cameras = self.children['Cameras'].children

  for i = 1, #cameras do
    child = cameras[i]
    
    if child.tag ~= 'ignore' then
      child.children['CameraSelect'].children['CameraSelectRadio'].values.x = camCounter
      self.notify(child.children['CameraSelect'], self.name, cameraData)
    
      cameraChannels = child.children['Channels']
      for ch = 1, #cameraChannels.children do
        channel = cameraChannels.children[ch]
      
        if i == 1 then 
          -- Cache this channel's display data
          table.insert(frameCache, channel.frame)
          table.insert(visibleCache, channel.visible)

          -- Initialize mixGroupData 
          for mixGroup = 1, 4 do
            mixGroupData[mixGroup][ch] = 0
          end
        else
          -- Load the display data from the cache
          channel.frame = frameCache[ch]
          channel.visible = visibleCache[ch]
        end
      end
      
      camCounter = camCounter + 1
    end
  end
  
  print('Done!')
end

function writeChannelDataToX32()
  local oscString

  for i = 1, #channelData do
    oscString = string.format('/ch/%s/config/name', channelData[i].channel)
    sendOSC({oscString, {{ tag = 's', value = channelData[i].name }}})

    oscString = string.format('/ch/%s/config/color', channelData[i].channel)
    for col = 0, 7 do
      if channelData[i].color == buttonColors[col] then
        sendOSC({oscString, {{ tag = 'i', value = col }}})
      end
    end
  end
end

function updateChannels(data)
  print(string.format('Updating camera %i from MixGroup %i', data[1], data[2]))
  local camera = self.children['Cameras'].children[data[1]]
  local channels = camera.children['Channels'].children

  for i = 1, #channels do
    channels[i].children['ChannelButton'].values.x = mixGroupData[data[2]][i]
  end
end

function onReceiveNotify(sender, data)
  if data == 'reset' then
    print('Screen reset!')
    reset()
  end
  
  if data == 'write' then
    print('Writing channel data to X32...')
    writeChannelDataToX32()
    print('Done!')
  end

  -- Receives MixGroup, Channel Index and Toggle State
  if sender == 'ChannelButton' then
    mixGroupData[data[1]][data[2]] = data[3]
  end

  -- Receives Camera Index and MixGroup
  if sender == 'MixGroupSelectRadio' then
    if self.children['MixGroupSync'].children['MixGroupSyncButton'].values.x == 1 then
      updateChannels(data)
    end
  end
end