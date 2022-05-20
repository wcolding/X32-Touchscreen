--Submodule.start('Cameras.lua')
ACam = {}
ACam.name       = 'A CAM'
ACam.color      = Color.fromHexString('cc0000ff')
ACam.background = Color.fromHexString('e06666ff')
ACam.bus        = 1

BCam = {}
BCam.name       = 'B CAM'
BCam.color      = Color.fromHexString('38761dff')
BCam.background = Color.fromHexString('b6d7a8ff')
BCam.bus        = 2

CCam = {}
CCam.name       = 'C CAM'
CCam.color      = Color.fromHexString('0b5394ff')
CCam.background = Color.fromHexString('a4c2f4ff')
CCam.bus        = 3

DCam = {}
DCam.name       = 'D CAM'
DCam.color      = Color.fromHexString('666666ff')
DCam.background = Color.fromHexString('b7b7b7ff')
DCam.bus        = 4

ECam = {}
ECam.name       = 'E CAM'
ECam.color      = Color.fromHexString('bf9000ff')
ECam.background = Color.fromHexString('ffe599ff')
ECam.bus        = 5

FCam = {}
FCam.name       = 'F CAM'
FCam.color      = Color.fromHexString('a54f79ff')
FCam.background = Color.fromHexString('ff7dbcff')
FCam.bus        = 6

GCam = {}
GCam.name       = 'G CAM'
GCam.color      = Color.fromHexString('b45f06ff')
GCam.background = Color.fromHexString('f6b26bff')
GCam.bus        = 7

HCam = {}
HCam.name       = 'H CAM'
HCam.color      = Color.fromHexString('351c75ff')
HCam.background = Color.fromHexString('8e7cc3ff')
HCam.bus        = 8

PGM = {}
PGM.name        = 'Program Mix'
PGM.color       = Color.fromHexString('000000FF')
PGM.background  = Color.fromHexString('666666ff')
PGM.bus         = 9

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
--Submodule.end()