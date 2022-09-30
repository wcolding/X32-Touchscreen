local cameraData
local cameraObjs

function init()
  cameraObjs = {}
  local cameras = self.parent.children['Cameras'].children
  for i = 1, #cameras do
    if cameras[i].tag ~= 'ignore' then
      table.insert(cameraObjs, cameras[i])
    end
  end
end

function onValueChanged(key)
  if key == 'x' then
    -- Float to Sends dB Mapping
    -- 0.75f = 0.0 dB
    -- 0.00f = -inf dB
    local db
  
    for i = 1, self.steps do
      db = 0.0
      if i - 1 == self.values.x then
        db = 0.75
      end
    
      oscString = string.format("/bus/%02d/mix/01/level", cameraData[i].bus)
      sendOSC(oscString, db)
    end
    setSoloButtons()
  end
end

function onReceiveNotify(sender, data)
  if sender == 'X32' then
    cameraData = data
    self.steps = #cameraData
  end
  
  if sender == 'Solo' then
    self.values.x = data - 1
    setSoloButtons()
  end
end

function setSoloButtons()
  local cameraSolo
  for i = 1, #cameraObjs do
    cameraSolo = cameraObjs[i].children['Solo'].children['Button']
    if cameraObjs[i].mixIndex == self.values.x + 1 then
      cameraSolo.values.x = 1
      cameraSolo.interactive = false
    else
      cameraSolo.values.x = 0
      cameraSolo.interactive = true
    end
  end
end