local cameraData

function init()
  self.visible = false
  setSteps()
end

function setSteps()
  local count = #cameraData
  self.children['CameraSelectRadio'].steps = count
  self.children['CameraSelectRadio'].frame.h = count * 26 + 3
  
  for i = 1, #self.children - 1 do
    if i > count then
      self.children[i].visible = false
    else
      self.children[i].visible = true
    end
  end
end

function onReceiveNotify(sender, data)
  if sender == 'X32' then
    cameraData = {}
    cameraData = data
    setSteps()
    
    self.parent.mixIndex = self.children['CameraSelectRadio'].values.x + 1
    if self.parent.mixIndex > #cameraData then
      self.parent.mixIndex = 1
    end
    
    self.parent.mixbus = cameraData[self.parent.mixIndex].bus
    self.parent.tag = string.format('%.2d', self.parent.mixbus)
    updateCamera(self.parent.mixIndex)
    
    for i = 1, #cameraData do
      self.children[i].children['Color'].color = cameraData[i].color
      self.children[i].children['Label'].values.text = cameraData[i].name
    end
  end
  
  if sender == 'CameraSelectRadio' then
    updateCamera(data)
  end
end

function updateCamera(data)
  self.parent.children['CameraLabel'].values.text = cameraData[data].name
  self.parent.children['CameraColor'].color = cameraData[data].color
  self.parent.children['CameraBackground'].color = cameraData[data].background
  self.parent.mixIndex = data
  self.parent.mixbus = cameraData[data].bus
  self.parent.tag = string.format('%.2d', self.parent.mixbus)

  -- Set mix group to None to avoid unwanted changes
  self.parent.children['MixGroupSelect'].children['MixGroupSelectRadio'].values.x = 0
  
  -- Request buttons status over OSC
  -- 
  -- Mute
  local oscMsg = string.format('/bus/%s/mix/on', self.parent.tag)
  sendOSC(oscMsg)
  
  -- Tone status
  oscMsg = string.format('/outputs/main/%s/src', self.parent.tag)
  sendOSC(oscMsg)
  
  -- Channel buttons
  local channels = self.parent.children['Channels'].children
  
  for i = 1, #channels do
    oscMsg = string.format('/ch/%s/mix/%s/on', channels[i].tag, self.parent.tag)
    sendOSC(oscMsg)
  end
end