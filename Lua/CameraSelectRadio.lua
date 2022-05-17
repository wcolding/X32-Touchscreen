function onValueChanged(key)
  if key == 'touch' and self.values.touch == false then
    self.notify(self.parent, self.name, self.values.x + 1)
    self.parent.visible = false
  end
end