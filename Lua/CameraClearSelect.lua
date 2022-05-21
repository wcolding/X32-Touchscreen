local cameraObjs

function init()
  cameraObjs = {}
  for i = 1, #self.parent.parent.children do
    if self.parent.parent.children[i].tag ~= 'ignore' then
      table.insert(cameraObjs, self.parent.parent.children[i])
    end
  end
end

function onValueChanged(key)
  if key == 'x' then
    for i = 1, #cameraObjs do
      if self.values.x == 1 then
        cameraObjs[i].children['CameraClear'].visible = true
      else
        cameraObjs[i].children['CameraClear'].visible = false
      end
    end
  end
end