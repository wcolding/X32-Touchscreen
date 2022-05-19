local oldValue = 0
local newValue = 0
local timeout = 40
local startTime = 0
local curTime = 0
local isMoving = false
local oscString = ''

function onValueChanged(key)
  if key == 'x' then
    isMoving = true
    newValue = self.values.x
  end
end

function update()
  if isMoving then
  
    if startTime == 0 then
      startTime = getMillis()
    end
    
    if oldValue == newValue then
      curTime = getMillis()
      if curTime - startTime > timeout then
        isMoving = false
        startTime = 0
        setGain()
      end
    else
      startTime = getMillis()
    end
    
    oldValue = newValue
  end
end

function setGain()
  oscString = string.format('/ch/%.2d/preamp/trim', self.parent.tag)
  sendOSC(oscString, self.values.x)
end