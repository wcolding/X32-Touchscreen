local monitorSelect

function init()
  monitorSelect = root:findByName('MonitorSelect', true)
end

function onValueChanged(key)
  if key == 'touch' and self.values.touch == true then
    self.notify(monitorSelect, self.name, self.parent.parent.mixIndex)
  end
end