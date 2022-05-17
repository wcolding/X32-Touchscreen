function onValueChanged(key)
  if key == 'touch' and self.values.touch == true then
    self.parent.children['CameraSelect'].visible = true
  end
end