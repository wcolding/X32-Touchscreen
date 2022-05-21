--Submodule.include('Cameras.lua')

--Submodule.include('Channels.lua')

function init()
  local cameraMix
  local cameraChannels
  local channel
  for i = 1, #self.children do
    child = self.children[i]
    --self.children[i].children['CameraBackground'].color = cameraData[i].background
    --self.children[i].children['CameraColor'].color = cameraData[i].color
    --self.children[i].children['CameraLabel'].values.text = cameraData[i].name
    
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
      
        -- todo: cache and copy positional data of each button
      end
    else
      if child.name == 'MonitorSelect' then
        self.notify(child, self.name, cameraData)
      end
    end
  end
end

function onReceiveNotify(sender, data)
  --if sender == 
end