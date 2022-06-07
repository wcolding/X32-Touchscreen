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
        cameraObjs[i].children['CameraTone'].visible = self.values.x
    end
  end
end