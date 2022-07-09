
RegisterNetEvent('cu:togglecuffentity')
AddEventHandler('cu:togglecuffentity', function(player, leo)
    TriggerClientEvent('cu:togglecuff', tonumber(player), tonumber(leo))
end)

RegisterNetEvent('cu:cuffanim')
AddEventHandler('cu:cuffanim', function(leo)
    TriggerClientEvent('cu:cuffanim', leo)
end)

RegisterNetEvent('cu:uncuffanim')
AddEventHandler('cu:uncuffanim', function(leo)
    TriggerClientEvent('cu:uncuffanim', leo)
end)

