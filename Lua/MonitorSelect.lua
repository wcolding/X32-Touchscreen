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

  updateSolo(0)
end

function onValueChanged(key, value)
  if key == 'x' then
    updateSolo(value)
  end
end

function updateSolo(value)
  -- Float to Sends dB Mapping
    -- 0.75f = 0.0 dB
    -- 0.00f = -inf dB
    local db
    
    self.values.x = value

    for i = 1, self.steps do
      db = 0.0
      if i - 1 == value then
        db = 0.75
      end
    
      oscString = string.format("/bus/%02d/mix/01/level", cameraData[i].bus)
      sendOSC(oscString, db)
    end

    setSoloButtons()
end

function onReceiveNotify(sender, data)
  if sender == 'X32' then
    cameraData = data
    self.steps = #cameraData
  end
  
  if sender == 'SoloButton' then
    print(string.format("Msg received from Solo button: %s", data))
    updateSolo(data - 1)
  end
end

function setSoloButtons()
  local cameraSolo
  for i = 1, #cameraObjs do
    cameraSolo = cameraObjs[i].children['Solo'].children['SoloButton']
    if cameraObjs[i].mixIndex == self.values.x + 1 then
      cameraSolo.values.x = 1
      cameraSolo.interactive = false
    else
      cameraSolo.values.x = 0
      cameraSolo.interactive = true
    end
  end
end