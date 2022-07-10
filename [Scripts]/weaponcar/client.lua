local duffle = true 

local dbtxterr = "Hey - This weapon can only be taken out of a car or a dufflebag."
local bwtxterr = "Hey - This weapon can only be taken out of a car."
local sling = "You have slinged your weapon."
smgsling = false

smgs = {
	"WEAPON_MICROSMG",
	"WEAPON_MINISMG",
	"WEAPON_SMG",
	"WEAPON_SMG_MK2",
	"WEAPON_ASSAULTSMG",
	"WEAPON_COMBATPDW",
	"WEAPON_GUSENBERG",
	"WEAPON_SNIPERRIFLE",
	"WEAPON_HEAVYSNIPER",
	"WEAPON_HEAVYSNIPER_MK2",
	"WEAPON_MARKSMANRIFLE",
	"WEAPON_MARKSMANRIFLE_MK2",
	"WEAPON_PUMPSHOTGUN",
	"WEAPON_SWEEPERSHOTGUN",
	"WEAPON_SAWNOFFSHOTGUN",
	"WEAPON_BULLPUPSHOTGUN",
	"WEAPON_ASSAULTSHOTGUN",
	"WEAPON_HEAVYSHOTGUN",
	"WEAPON_DBSHOTGUN",
	"WEAPON_PUMPSHOTGUN_MK2",
	"WEAPON_ASSAULTRIFLE",
	"WEAPON_ASSAULTRIFLE_MK2",
	"WEAPON_CARBINERIFLE",
	"WEAPON_CARBINERIFLE_MK2",
	"WEAPON_ADVANCEDRIFLE",
	"WEAPON_SPECIALCARBINE",
	"WEAPON_BULLPUPRIFLE",
	"WEAPON_COMPACTRIFLE",
	"WEAPON_SPECIALCARBINE_MK2",
	"WEAPON_BULLPUPRIFLE_MK2",
	"WEAPON_MG",
	"WEAPON_MUSKET",
	"WEAPON_COMBATMG",
	"WEAPON_COMBATMG_MK2",
}

currWeapon = GetHashKey("WEAPON_UNARMED")

Citizen.CreateThread(function()
	while true do
		Wait(250)
		playerPed = GetPlayerPed(-1)
		if playerPed then
			local weapon = GetSelectedPedWeapon(playerPed, true)
			if currWeapon ~= weapon then
				if isWeaponSMG(weapon) then
					local vehicle = VehicleInFront()
					if GetVehiclePedIsIn(playerPed, false) == 0 and DoesEntityExist(vehicle) and IsEntityAVehicle(vehicle) then
						currWeapon = weapon
						SetVehicleDoorOpen(vehicle, 5, false, false)
						Citizen.Wait(2000)
						SetVehicleDoorShut(vehicle, 5, false)
					else
						if IsPedModel(playerPed,1885233650) and GetVehiclePedIsIn(playerPed, false) == 0 then
							if GetPedDrawableVariation(playerPed,5) == 45 and GetPedTextureVariation(playerPed,5) == 0 and GetPedPaletteVariation(playerPed,5) == 0 then
								currWeapon = weapon
							else
								Wait(1)
								drawNotification("~r~[CaliVice]~c~ "..dbtxterr.."")
								SetCurrentPedWeapon(playerPed, -1569615261)
							end
						else	
							if IsPedModel(playerPed,-1667301416) and GetVehiclePedIsIn(playerPed, false) == 0 then
								if GetPedDrawableVariation(playerPed,5) == 45 and GetPedTextureVariation(playerPed,5) == 0 and GetPedPaletteVariation(playerPed,5) == 0 then
									currWeapon = weapon
								else									
									Wait(1)
									drawNotification("~r~[CaliVice]~c~ "..dbtxterr.."")
									SetCurrentPedWeapon(playerPed, -1569615261)
								end
							end
						end
					end
				end
			end
		end
	end
end) 

Citizen.CreateThread(function()
	while true do
		Wait(500)
		
		playerPed = GetPlayerPed(-1)
		if playerPed then
				local weapon = GetSelectedPedWeapon(playerPed, true)
			if  currWeapon ~= weapon then
				if not isWeaponSMG(weapon) and smgsling == false then
					local vehicle = VehicleInFront()
					if GetVehiclePedIsIn(playerPed, false) == 0 and DoesEntityExist(vehicle) and IsEntityAVehicle(vehicle) then
						currWeapon = GetHashKey("WEAPON_UNARMED")
						SetVehicleDoorOpen(vehicle, 5, false, false)
						Citizen.Wait(2000)
						SetVehicleDoorShut(vehicle, 5, false)
					else
						if IsPedModel(playerPed,1885233650) and currWeapon == weapon and GetVehiclePedIsIn(playerPed, false) == 0 then
							if GetPedDrawableVariation(playerPed,5) == 45 and GetPedTextureVariation(playerPed,5) == 0 and GetPedPaletteVariation(playerPed,5) == 0 then
								currWeapon = weapon
							end
						elseif IsPedModel(playerPed,-1667301416) and currWeapon == weapon and GetVehiclePedIsIn(playerPed, false) == 0 then
							if GetPedDrawableVariation(playerPed,5) == 45 and GetPedTextureVariation(playerPed,5) == 0 and GetPedPaletteVariation(playerPed,5) == 0 then
								currWeapon = weapon
							end
							
						else
							Wait(1)
							drawNotification("~r~[CaliVice]~c~ "..sling.."")
							smgsling = true
						end
					end
				end
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Wait(500)
		
		playerPed = GetPlayerPed(-1)
		if playerPed then
			local weapon = GetSelectedPedWeapon(playerPed, true)
			if isWeaponSMG(weapon) and smgsling == true and currWeapon == weapon then
					smgsling = false
			end
		end
	end
end)

function VehicleInFront()
	local player = PlayerPedId()
    local pos = GetEntityCoords(player)
    local entityWorld = GetOffsetFromEntityInWorldCoords(player, 0.0, 2.0, 0.0)
    local rayHandle = CastRayPointToPoint(pos.x, pos.y, pos.z, entityWorld.x, entityWorld.y, entityWorld.z, 30, player, 0)
    local _, _, _, _, result = GetRaycastResult(rayHandle)
    return result
end

function isWeaponSMG(model)
	for _, smg in pairs(smgs) do
		if model == GetHashKey(smg) then
			return true
		end
	end

	return false
end

function drawNotification(Notification)
	SetNotificationTextEntry('STRING')
	AddTextComponentString(Notification)
	DrawNotification(false, false)
end

