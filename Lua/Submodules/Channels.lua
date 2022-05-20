--Submodule.start('Channels.lua')
local buttonColors =
{
  [0] = Colors.black,                    -- black (placeholder; we will hide the button if it is set to this)
  [1] = Color.fromHexString('e72d2eff'), -- red
  [2] = Color.fromHexString('18D200FF'), -- green
  [3] = Color.fromHexString('FCFF0BFF'), -- yellow
  [4] = Color.fromHexString('17B1FFFF'), -- blue
  [5] = Color.fromHexString('ed27acff'), -- magenta
  [6] = Color.fromHexString('2de0e7ff'), -- cyan
  [7] = Colors.gray                      -- white
}

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
--Submodule.end()