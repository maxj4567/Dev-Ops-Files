local tents = {}
local tentParticles = {}
has_permission = main.defaultHasPermission

TriggerEvent('chat:addSuggestion', '/'..main.commandName, translations.commandSuggestion, {
    { name=translations.setup.."/"..translations.remove, help=translations.commandHelp },
})

local function showNotification(message)
    message = message.."."
    SetNotificationTextEntry("STRING")
	AddTextComponentString(message)
	DrawNotification(0,1)
end

AddEventHandler('Client:receiveTentsTable', function(table)
    tents = table
end)

AddEventHandler('Client:hasTentsPermission', function()
    has_permission = true
end)

AddEventHandler('Client:updateTentsTable', function(key, entry, remove)
    if remove then 
        tents[key] = nil
        return 
    end
    tents[key] = entry
end)

local function tableHas(table, key)
    for k in pairs(table) do
        if k == key then
            return true
        end
    end
    return false
end

local function tableLength(t)
    local count = 0
    for _ in pairs(t) do count = count + 1 end
    return count
end

local function net(id)
    SetNetworkIdExistsOnAllMachines(id, true)
    SetNetworkIdCanMigrate(id, false)
end

local function displayHelpText(message)
    SetTextComponentFormat('STRING')
    AddTextComponentString(message)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

RegisterNetEvent('Client:hasTentsPermission')
AddEventHandler('Client:hasTentsPermission', function()
    has_permission = true
end)

Citizen.CreateThread(function()
    while true do
        if not has_permission then
            TriggerServerEvent("Server:checkTentsPermissions")
            Wait(20000)
        else
            local ped = PlayerPedId()
            local coords = GetEntityCoords(ped)
            for k, v in pairs(tents) do
                local distance = #(coords - v[2])
                if distance < main.usageDistance then
                    displayHelpText(translations.press.." ~"..translations.keyHelp.."~ "..translations.toUse)
                    local timeout = false
                    local pressed = false
                    while not timeout do
                        DisableControlAction(main.toggleKey[1],main.toggleKey[2], true)
                        if IsDisabledControlPressed(main.toggleKey[1], main.toggleKey[2]) then
                            pressed = true
                            timeout = true
                        end
                        Wait(0)
                    end
                    if pressed then
                        TriggerServerEvent("Server:toggleWaterTents", k)
                        showNotification(translations.showerToggled)
                        Wait(main.cooldown * 1000)
                    end
                end
            end
        end
        Wait(0)
    end
end)