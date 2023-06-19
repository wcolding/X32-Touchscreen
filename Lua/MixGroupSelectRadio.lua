local channels
local x32

function init()
  channels = self.parent.parent.children['Channels'].children
  x32 = self.parent.parent.parent.parent
end

function onValueChanged(key)
  if key == 'x' then
    self.parent.parent.mixGroup = self.values.x

    if self.values.x ~= 0 then
      local data = {}
      data[1] = self.parent.parent.index
      data[2] = self.values.x
      self.notify(x32, self.name, data)
    end
  end
end

