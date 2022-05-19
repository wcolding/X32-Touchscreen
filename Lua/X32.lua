ACam = {}
ACam.name       = 'A CAM'
ACam.color      = Color.fromHexString('cc0000ff')
ACam.background = Color.fromHexString('e06666ff')
ACam.bus        = 3

BCam = {}
BCam.name       = 'B CAM'
BCam.color      = Color.fromHexString('38761dff')
BCam.background = Color.fromHexString('b6d7a8ff')
BCam.bus        = 4

CCam = {}
CCam.name       = 'C CAM'
CCam.color      = Color.fromHexString('0b5394ff')
CCam.background = Color.fromHexString('a4c2f4ff')
CCam.bus        = 5

DCam = {}
DCam.name       = 'D CAM'
DCam.color      = Color.fromHexString('666666ff')
DCam.background = Color.fromHexString('b7b7b7ff')
DCam.bus        = 6

ECam = {}
ECam.name       = 'E CAM'
ECam.color      = Color.fromHexString('bf9000ff')
ECam.background = Color.fromHexString('ffe599ff')
ECam.bus        = 7

FCam = {}
FCam.name       = 'F CAM'
FCam.color      = Color.fromHexString('a54f79ff')
FCam.background = Color.fromHexString('ff7dbcff')
FCam.bus        = 8

GCam = {}
GCam.name       = 'G CAM'
GCam.color      = Color.fromHexString('b45f06ff')
GCam.background = Color.fromHexString('f6b26bff')
GCam.bus        = 9

HCam = {}
HCam.name       = 'H CAM'
HCam.color      = Color.fromHexString('351c75ff')
HCam.background = Color.fromHexString('8e7cc3ff')
HCam.bus        = 10

PGM = {}
PGM.name        = 'Program Mix'
PGM.color       = Color.fromHexString('000000FF')
PGM.background  = Color.fromHexString('666666ff')
PGM.bus         = 11

local cameraData = {}
table.insert(cameraData, ACam)
table.insert(cameraData, BCam)
table.insert(cameraData, CCam)
table.insert(cameraData, DCam)
table.insert(cameraData, ECam)
table.insert(cameraData, FCam)
--table.insert(cameraData, GCam)
--table.insert(cameraData, HCam)
table.insert(cameraData, PGM)


Ch01 = {}
Ch01.name           = 'Red'
Ch01.color          = Colors.red
Ch01.channel        = 1
Ch01.midiChannel    = 1
Ch01.midiController = 21

Ch02 = {}
Ch02.name           = 'Blue'
Ch02.color          = Colors.blue
Ch02.channel        = 2
Ch02.midiChannel    = 1
Ch02.midiController = 41


local channelData = {}
table.insert(channelData, Ch01)
table.insert(channelData, Ch02)


function init()
  local cameraMix
  local cameraCanvas
  local channel
  for i = 1, #self.children do
    cameraMix = self.children[i]
    --self.children[i].children['CameraBackground'].color = cameraData[i].background
    --self.children[i].children['CameraColor'].color = cameraData[i].color
    --self.children[i].children['CameraLabel'].values.text = cameraData[i].name
    
    self.notify(cameraMix.children['CameraSelect'], self.name, cameraData)
    
    cameraCanvas = cameraMix.children['CameraCanvas']
    for ch = 1, #cameraCanvas.children - 1 do
      channel = cameraCanvas.children[ch]
      channel.children['Button'].color = channelData[ch].color
      channel.children['Text'].values.text = channelData[ch].name
      channel.tag = string.format('%.2d', channelData[ch].channel)
      channel.midiChannel = channelData[ch].midiChannel
      channel.midiController = channelData[ch].midiController
      
      -- todo: cache and copy positional data of each button
    end
  end
end