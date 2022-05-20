--Submodule.include('Cameras.lua')

--Submodule.include('Channels.lua')

function init()
  local cameraMix
  local cameraCanvas
  local channel
  for i = 1, #self.children do
    cameraMix = self.children[i]
    --self.children[i].children['CameraBackground'].color = cameraData[i].background
    --self.children[i].children['CameraColor'].color = cameraData[i].color
    --self.children[i].children['CameraLabel'].values.text = cameraData[i].name
    
    self.notify(cameraMix.children['CameraSelect'], self.name, cameraData)
    
    cameraCanvas = cameraMix.children['CameraCanvas']
    for ch = 1, #cameraCanvas.children - 1 do
      channel = cameraCanvas.children[ch]
      channel.children['Button'].color = channelData[ch].color
      channel.children['Text'].values.text = channelData[ch].name
      channel.tag = string.format('%.2d', channelData[ch].channel)
      channel.midiChannel = channelData[ch].midiChannel
      channel.midiController = channelData[ch].midiController
      
      -- todo: cache and copy positional data of each button
    end
  end
end