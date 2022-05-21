local monitorSelect

function init()
  monitorSelect = self.parent.parent:findByName('MonitorSelect', true)
end

function onValueChanged(key)
  if key == 'touch' and self.values.touch == true then
    self.notify(monitorSelect, self.name, self.parent.mixIndex)
  end
end