config = {
    laserColour = {255, 0, 0, 255}, -- RGBA
    sphereColour = {255, 0, 0, 255}, -- RGBA (only shows when laser is aimed on target)
    commandName = 'togglelase',
    commandKeybind = 'E',
    commandDesc = "Toggles the laser.",
    laserRange = 25.0,
    maxLasers = 5
}

config.supportedWeapons = {
    [`WEAPON_PISTOL`] = {
        offSet = {0.0, 0.0, 0.0},
        laserColour = {255, 0, 0, 255}, -- RGBA
        sphereColour = {255, 0, 0, 255}, -- RGBA (only shows when laser is aimed on target)
    },
    [`WEAPON_ASSAULTRIFLE`] = {
        offSet = {0.3, 0.0, 0.0},
        laserColour = {0, 255, 0, 255}, -- RGBA
        sphereColour = {0, 255, 0, 255}, -- RGBA (only shows when laser is aimed on target)
    },
}

