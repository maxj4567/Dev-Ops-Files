main = {
    acePermissionsEnabled = false,
    commandName = "tripod",
    basketCommand = "basket",
    defaultPermission = true, -- Default permission to go up and down the rope (not to spawn one in), see server file for event to trigger
    usageDistance = 5.0,
    tripodModel = `prop_tripod`,
    ropeModel = `prop_cs_30m_rope`,
    basketModel = `prop_basket`,
    usageKey = {0, 23}, -- Find controls list here: https://docs.fivem.net/docs/game-references/controls/
    animDict = "missrappel",
    animName = "rappel_walk",
    upKey = {1, 32},
    downKey = {0, 33},
    speed = 0.25,
}

offSets = {
    [1] = {-2.0, 0.0, -27.61},
    [2] = {0.0, 0.0, -30.0},
    [3] = {0.1, 0.7, 0.0},
}

rotations = {
    [3] = {0.0, 0.0, 90.0},
}

translations = {
    commandSuggestion = "Setup or remove a rope rescue tripod",
    help = "setup/remove",
    setup = "setup",
    remove = "remove",
    basketCommandSuggestion = "Put nearest player in a basket, or just carry one",
    tripodRemoved = "~b~RopeRescue~w~: This tripod has been removed.",
    tripodError = "~r~RopeRescue~w~: You are unable to setup a tripod here.",
    tripodSetup = "~b~RopeRescue~w~: Tripod Setup.",
    noPerms = "~b~RopeRescue~w~: Access denied.",
    noPlayerFound = "~b~RopeRescue~w~: No nearby player found.",
    pressToRappel = "Press ~INPUT_ENTER~ to ~b~rappel~w~.",
    pressToStopRappel = "Press ~INPUT_ENTER~ to stop ~b~rappelling~w~.",
}