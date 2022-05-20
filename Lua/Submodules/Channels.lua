--Submodule.start('Channels.lua')

-- This remaps colors to better match the X32 scheme
local buttonColors = {}
buttonColors[0] = Colors.black                    -- black (placeholder; we will hide the button if it is set to this)
buttonColors[1] = Color.fromHexString('e72d2eff') -- red
buttonColors[2] = Color.fromHexString('18D200FF') -- green
buttonColors[3] = Color.fromHexString('FCFF0BFF') -- yellow
buttonColors[4] = Color.fromHexString('17B1FFFF') -- blue
buttonColors[5] = Color.fromHexString('ed27acff') -- magenta
buttonColors[6] = Color.fromHexString('2de0e7ff') -- cyan
buttonColors[7] = Colors.gray                     -- white

buttonColors.Black   = buttonColors[0]
buttonColors.Red     = buttonColors[1]
buttonColors.Green   = buttonColors[2]
buttonColors.Yellow  = buttonColors[3]
buttonColors.Blue    = buttonColors[4]
buttonColors.Magenta = buttonColors[5]
buttonColors.Cyan    = buttonColors[6]
buttonColors.White   = buttonColors[7]

local channelData = {}

function AddChannel(name, color, channel, midiChannel, midiController)
  temp = {}
  temp.name           = name
  temp.color          = color
  temp.channel        = channel
  temp.midiChannel    = midiChannel
  temp.midiController = midiController
  table.insert(channelData, temp)
end

AddChannel('Walt',   buttonColors.Red,   1,  1, 21)
AddChannel('Jesse',  buttonColors.Blue,  2,  1, 41)

AddChannel('Skyler', buttonColors.Green, 3,  1, 22)
AddChannel('Hank',   buttonColors.Green, 4,  1, 23)
AddChannel('Gus',    buttonColors.Green, 5,  1, 24)
AddChannel('Mike',   buttonColors.Green, 6,  1, 25)

AddChannel('Saul',   buttonColors.Green, 7,  1, 26)
AddChannel('Tuco',   buttonColors.Green, 8,  1, 27)
AddChannel('Hector', buttonColors.Green, 9,  1, 28)
AddChannel('Kim',    buttonColors.Green, 10, 1, 42)

AddChannel('Howard', buttonColors.Green, 11, 1, 43)
AddChannel('Cliff',  buttonColors.Green, 12, 1, 44)
AddChannel('Lalo',   buttonColors.Green, 13, 1, 45)
AddChannel('Nacho',  buttonColors.Green, 14, 1, 46)

AddChannel('Marie',  buttonColors.Green, 15, 1, 47)
AddChannel('Chuck',  buttonColors.Green, 16, 1, 48)
AddChannel('Lydia',  buttonColors.Green, 17, 1, 62)
AddChannel('Todd',   buttonColors.Green, 18, 1, 63)

AddChannel('Boom',   buttonColors.Cyan,  19, 1, 64)
--Submodule.end()