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
    
    for i = 1, #cameraData do
      self.children[i].children['Color'].color = cameraData[i].color
      self.children[i].children['Label'].values.text = cameraData[i].name
    end
  end
  
  if sender == 'CameraSelectRadio' then
    self.parent.children['CameraLabel'].values.text = cameraData[data].name
    self.parent.children['CameraColor'].color = cameraData[data].color
    self.parent.children['CameraBackground'].color = cameraData[data].background
    self.parent.tag = string.format('%.2d', cameraData[data].bus)
    
    -- Request buttons status over OSC
    -- 
    -- Mute
    local oscMsg = string.format('/bus/%s/mix/on', self.parent.tag)
    sendOSC(oscMsg)
    
    -- todo: add channel buttons
  end
end