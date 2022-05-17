local cameraData = {}
cameraData[1] = {}
cameraData[1].name = 'A CAM'
cameraData[1].color = Color.fromHexString('cc0000ff')
cameraData[1].background = Color.fromHexString('e06666ff')
cameraData[1].bus = 3

cameraData[2] = {}
cameraData[2].name = 'B CAM'
cameraData[2].color = Color.fromHexString('38761dff')
cameraData[2].background = Color.fromHexString('b6d7a8ff')
cameraData[2].bus = 4

cameraData[3] = {}
cameraData[3].name = 'C CAM'
cameraData[3].color = Color.fromHexString('0b5394ff')
cameraData[3].background = Color.fromHexString('a4c2f4ff')
cameraData[3].bus = 5

cameraData[4] = {}
cameraData[4].name = 'D CAM'
cameraData[4].color = Color.fromHexString('666666ff')
cameraData[4].background = Color.fromHexString('b7b7b7ff')
cameraData[4].bus = 6

cameraData[5] = {}
cameraData[5].name = 'E CAM'
cameraData[5].color = Color.fromHexString('bf9000ff')
cameraData[5].background = Color.fromHexString('ffe599ff')
cameraData[5].bus = 7

cameraData[6] = {}
cameraData[6].name = 'F CAM'
cameraData[6].color = Color.fromHexString('a54f79ff')
cameraData[6].background = Color.fromHexString('ff7dbcff')
cameraData[6].bus = 8

--cameraData[7] = {}
--cameraData[7].name = 'G CAM'
--cameraData[7].color = Color.fromHexString('b45f06ff')
--cameraData[7].background = Color.fromHexString('f6b26bff')
--cameraData[7].bus = 9

--cameraData[8] = {}
--cameraData[8].name = 'H CAM'
--cameraData[8].color = Color.fromHexString('351c75ff')
--cameraData[8].background = Color.fromHexString('8e7cc3ff')
--cameraData[8].bus = 10

cameraData[7] = {}
cameraData[7].name = 'Program Mix'
cameraData[7].color = Color.fromHexString('000000FF')
cameraData[7].background = Color.fromHexString('666666ff')
cameraData[7].bus = 11

function init()
  for i = 1, #self.children do
    --self.children[i].children['CameraBackground'].color = cameraData[i].background
    --self.children[i].children['CameraColor'].color = cameraData[i].color
    --self.children[i].children['CameraLabel'].values.text = cameraData[i].name
    
    self.notify(self.children[i].children['CameraSelect'], self.name, cameraData)
  end
end