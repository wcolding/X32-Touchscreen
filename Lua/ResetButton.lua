local x32

function init()
  x32 = root:findByName('X32', true)
end

function onValueChanged(key)
  if key == 'x' and self.values.x == 1 then
    self.notify(x32, self.name, 'reset')
  end
end