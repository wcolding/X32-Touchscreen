--Submodule.start('Channels.lua')

-- This remaps colors to better match the X32 scheme
-- todo: rework this to be entirely from config
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

function clearChannelData()
  channelData = {}
end

function addChannelData(channel)
  temp = {}
  temp.name           = channel.children['Text'].values.text
  temp.color          = channel.children['ChannelButton'].color
  temp.channel        = channel.tag
  temp.textSize       = channel.children['Text'].textSize
  temp.midiChannel    = channel.midiChannel
  temp.midiController = channel.midiController
  table.insert(channelData, temp)
end

function populateChannelData()
  clearChannelData()
  local channels = self.children['Cameras'].children[1].children['Channels'].children

  for i = 1, #channels do
    addChannelData(channels[i])
  end
end

--Submodule.end()