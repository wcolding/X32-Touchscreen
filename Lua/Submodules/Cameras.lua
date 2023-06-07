--Submodule.start('Cameras.lua')
-- This is called in the reset() function of X32
-- Camera data is set with pyTOSC from the config files
-- This adapts that data to the existing lua table structure used by other objects

local cameraData = {}

function clearCameraData()
    cameraData = {}
end

function addCameraData(camera)
    newCam = {}
    newCam.name = camera.cameraName
    newCam.color = Color.fromHexString(camera.mainColor)
    newCam.background = Color.fromHexString(camera.bgColor)
    newCam.bus = camera.mixbus
    table.insert(cameraData, newCam)
end

function populateCameraData()
    clearCameraData()
    local cameras = self.children['Cameras'].children
    
    for i = 1, #cameras do
        addCameraData(cameras[i])
    end
end

--Submodule.end()