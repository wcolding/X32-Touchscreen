local cameraData = {}
cameraData[1] = {}
cameraData[1].name = 'A CAM'
cameraData[1].color = Color.fromHexString('FF0000FF')
cameraData[1].background = Color.fromHexString('7F0000FF')
cameraData[1].bus = 3

function init()
  for i = 1, #self.children do
    self.children[i].color = cameraData[i].background
    self.children[i].children['CameraLabel'].color = cameraData[i].color
    self.children[i].children['CameraLabel'].values.text = cameraData[i].name
    print('done')
  end
end