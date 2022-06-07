-- Routing values for Out 1-16 on the X32
-- 0 = Off
-- 1 = L
-- 2 = R 
-- 3 = MC
-- 4 = MixBus 01...
local chOffset = 3 
local toneBus = 10
local oscTemplate = '/outputs/main/%s/src'
local oscString

function onValueChanged(key)
  if key == 'x' then
    oscString = string.format(oscTemplate, self.parent.tag)
    local newVal = self.parent.mixbus + chOffset
    
    if self.values.x == 1 then
      newVal = toneBus + chOffset
    end
    
    sendOSC({oscString, {{ tag = 'i', value = newVal }}})
  end
end

function onReceiveOSC(msg, connections)
  local receivedOutput = msg[2][1].value
  if receivedOutput == (toneBus + chOffset) then
    self.values.x = 1
  else
    self.values.x = 0
  end
end