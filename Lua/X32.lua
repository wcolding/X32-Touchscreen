--Submodule.include('Cameras.lua')

--Submodule.include('Channels.lua')

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
  
  for i = 1, #self.children do
    child = self.children[i]
    
    if child.tag ~= 'ignore' then
      self.notify(child.children['CameraSelect'], self.name, cameraData)
    
      cameraChannels = child.children['Channels']
      for ch = 1, #cameraChannels.children do
        channel = cameraChannels.children[ch]
        channel.children['Button'].color = channelData[ch].color
        channel.children['Text'].values.text = channelData[ch].name
        channel.tag = string.format('%.2d', channelData[ch].channel)
        channel.midiChannel = channelData[ch].midiChannel
        channel.midiController = channelData[ch].midiController
      
        if i == 1 then 
          -- Cache this channel's display data
          table.insert(frameCache, channel.frame)
          table.insert(visibleCache, channel.visible)
        else
          -- Load the display data from the cache
          channel.frame = frameCache[ch]
          channel.visible = visibleCache[ch]
        end
      end
    else
      if child.name == 'MonitorSelect' then
        self.notify(child, self.name, cameraData)
      end
    end
  end
  
  print('Done!')
end

function onReceiveNotify(sender, data)
  if data == 'reset' then
    print('Screen reset!')
    reset()
  end
end