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
  if key == 'x' and self.values.x == 1 then 
    for i = 1, #cameraObjs do
        cameraObjs[i].children['CameraClear'].values.x = 1
        cameraObjs[i].children['CameraClear'].values.x = 0
    end
  end
end