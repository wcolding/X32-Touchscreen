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

function AddChannel(name, color, channel, textSize, midiChannel, midiController)
  temp = {}
  temp.name           = name
  temp.color          = color
  temp.channel        = channel
  temp.textSize       = textSize
  temp.midiChannel    = midiChannel
  temp.midiController = midiController
  table.insert(channelData, temp)
end

AddChannel('Host',      buttonColors.Magenta,   1,   14, 1, 17)
AddChannel('Judge 1',  buttonColors.Red,  2,   9, 1, 18)
AddChannel('Judge 2',        buttonColors.Red,  3,   9, 1, 19)

AddChannel('Homer',  buttonColors.Green,  4,  14, 1, 9)
AddChannel('Marge',     buttonColors.Green,  5,  14, 1, 10)
AddChannel('Bart',    buttonColors.Green,  6,   16, 1, 11)
AddChannel('Lisa',       buttonColors.Green,  7,   16, 1, 12)
AddChannel('Maggie',     buttonColors.Green,  8,  12, 1, 13)
AddChannel('Abe',      buttonColors.Green,  9,  16, 1, 14)
AddChannel('Patty',   buttonColors.Green,  10,   14, 1, 15)
AddChannel('Selma',      buttonColors.Green,  11,   14, 1, 16)

AddChannel('Boom',       buttonColors.Cyan,  22,  14, 1, 20)

AddChannel('Intv',     buttonColors.Blue, 16,  14, 1, 21)
--Submodule.end()