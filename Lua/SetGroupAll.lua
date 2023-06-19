local cameras

function init()
  cameras = self.parent.children['Cameras'].children
end

function onReceiveNotify(sender, index)
  setMixGroups(index - 1)
end

function setMixGroups(value)
  local curRadio 
  for i = 1, #cameras do
    curRadio = cameras[i].children['MixGroupSelect'].children['MixGroupSelectRadio']
    curRadio.values.x = value
  end
end