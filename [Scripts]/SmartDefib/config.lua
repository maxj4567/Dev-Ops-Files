
main = {
	blipsEnabled = true, -- Only shows blips nearby on minimap

	defibDensity = 4, -- Increase this number to reduce the amount of defibs around the map. We recommend a number between 3-5
	chanceOfResurrection = 100, -- Out of 100%, this is the chance of a shock being advised and successful, or not advised

	defibVolumeRadius = 30, -- The sound distance
	defibVolume = 1.0, -- The sound volume. Maximum 1.0
	usageDistance = 1.0, -- Distance away from a defib case to open or close it.

	openOrCloseDefibKey = {0, 23}, -- Find this at https://docs.fivem.net/docs/game-references/controls/ (F by default)
	openOrCloseDefibKeyHelp = "INPUT_ENTER", -- For the on screen help message, found at the above documentation next to the control
	putDownOrPickupDefibKey = {0, 58}, -- Find this at https://docs.fivem.net/docs/game-references/controls/ (F by default)
	putDownOrPickupDefibKeyHelp = "INPUT_THROW_GRENADE", -- For the on screen help message, found at the above documentation next to the control
	pushToShockKey = {0, 51}, -- Find this at https://docs.fivem.net/docs/game-references/controls/ (E by default)
	pushToShockHelp = "INPUT_CONTEXT", -- For the on screen help message, found at the above documentation next to the control
	
	defibCommandName = "defib",

	resetDefibEnabled = true,
	resetDefib = 600, -- This number is in seconds.
}

-- In this section you can translate the resource to another language
translations = {
	press = "Press",
	openDefib = "to use this ~b~defibrillator",
	closeDefib = "to return this ~b~defibrillator",
	putDownDefib = "to put down this ~b~defibrillator",
	incorrectPin = "You entered the pin incorrectly",
	ShockPlayer = "to shock the player",
	ShockReasoning = "You have been ~r~shocked~w~ for being too close",
	noDefibInInv = "You didn't have a defib in your inventory",
	incorrectGroup = "You are not in the correct field of work to use the defib",
	alreadyDefibInHand = "You have a defib in your hand already",
	howToUseDefib = "to use it on a player"
}

framework = {
	itemEnabled = false, -- If true, item can be set in the framework option to have a defib on the go
	standalone = true,
	QBCore = {
		enabled = false,
		itemName = 'defib',
		groupCheck = {
			enabled = false,
			groupsToCheck = {"ambulance", "police"}
		},
	},
	vRP = {
		enabled = false,
		itemName = "defib",
		groupCheck = {
			enabled = false,
			groupsToCheck = {"EMS", "FireFighter"}
		},
	},
	ESX = {
		enabled = false,
		itemName = "defib",
		groupCheck = {
			enabled = false,
			groupsToCheck = {"ambulance", "police"}
		},
	},
}

if framework.ESX.enabled or framework.vRP.enabled or framework.QBCore.enabled then
    framework.standalone = false
end

-- These are the models used by the resource. 
--We do not recommend editing this section.
model = {
    closed = `prop_defib_closed`,
    open = `prop_defib_open`,
    defib = `prop_defib`,
}

-- These are offSets used for different traffic lights in the resource.
-- We do not recommend editing this section.
modelOffSet = {
	["prop_traffic_01d"] = 0.30,
	["prop_traffic_01b"] = 0.30,
	["prop_traffic_01a"] = 0.30,
	["prop_traffic_03a"] = 0.18,
	["prop_traffic_03b"] = 0.18,
}