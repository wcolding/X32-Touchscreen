function onValueChanged(key)
  if key == 'touch' and self.values.touch == true then
    self.parent.children['CameraSelect'].visible = true
    self.parent.children['CameraColor'].color = Colors.black
    self.parent.children['CameraLabel'].values.text = 'Select mix'
  end
end