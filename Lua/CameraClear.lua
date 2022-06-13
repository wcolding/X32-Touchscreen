local channels

function init()
  channels = self.parent.children['Channels'].children
end

function onValueChanged(key)
  if key == 'x' and self.values.x == 1 then
    for i = 1, #channels do
      channels[i].children['ChannelButton'].values.x = 0
    end
  end
end