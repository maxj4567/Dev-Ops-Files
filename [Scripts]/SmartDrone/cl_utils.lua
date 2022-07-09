function showNotification(message)
    SetNotificationTextEntry("STRING")
	AddTextComponentString(message)
	DrawNotification(0,1)
end

function topNotification(text)
    SetTextComponentFormat('STRING')
    AddTextComponentString(text)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

RegisterNetEvent("Client:droneNotification")
AddEventHandler("Client:droneNotification", function(message)
    notify(message)
end)

function loadModel(model)
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(0)
    end
end

function notify(message)
    if main.useTopNotifications then
        topNotification(message)
    else
        showNotification(message)
    end
end