local cameraObjs

function init()
  cameraObjs = {}
  local cameras = self.parent.parent.children["Cameras"].children
  for i = 1, #cameras do
    if cameras[i].tag ~= 'ignore' then
      table.insert(cameraObjs, cameras[i])
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