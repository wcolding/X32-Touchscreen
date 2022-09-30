local channels

function init()
  channels = self.parent.children['Channels'].children
end

function onValueChanged(key)
  if key == 'x' and self.values.x == 1 then
    self.parent.children['MixGroupSelect'].children['MixGroupSelectRadio'].values.x = 0
    for i = 1, #channels do
      channels[i].children['ChannelButton'].values.x = 0
    end
  end
end