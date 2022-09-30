local camera
local x32Children
local chIndex

function init()
  camera = self.parent.parent.parent
  chIndex = self.parent.index
  x32Children = camera.parent.children
end

function onValueChanged(key)
  if key == 'x' then
    if camera.mixGroup ~= 0 then
      -- Send MixGroup, Channel Index and Toggle State to X32
      local data = {}
      data[1] = self.parent.parent.parent.mixGroup
      data[2] = self.parent.index
      data[3] = self.values.x
      self.notify(camera.parent.parent, self.name, data)
      
      for i = 1, #x32Children do
        local child = x32Children[i]
        if child.tag ~= 'ignore' and child ~= camera then
          if child.mixGroup == camera.mixGroup then
            child.children['Channels'].children[chIndex].children['ChannelButton'].values.x = self.values.x
          end
        end
      end
    end
  end
end