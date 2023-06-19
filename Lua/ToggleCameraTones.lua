local cameraObjs

function init()
  cameraObjs = {}
  local cameras = self.parent.parent.children['Cameras'].children
  for i = 1, #cameras do
    if cameras[i].tag ~= 'ignore' then
      table.insert(cameraObjs, cameras[i])
    end
  end
end

function onValueChanged(key)
  if key == 'x' then 
    for i = 1, #cameraObjs do
        cameraObjs[i].children['CameraTone'].visible = self.values.x
    end
  end
end