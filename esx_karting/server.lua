ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterServerEvent('hotdogs')
AddEventHandler('hotdogs', function()
    _source = source
    xPlayer = ESX.GetPlayerFromId(_source)

    xPlayer.removeMoney(200)
    xPlayer.addInventoryItem('hotdog', 1)
    TriggerClientEvent('mythic_notify:client:SendAlert', _source, {type = 'error', text = ('Hai comprato un hotdog!'), length = 5500})

end)

RegisterServerEvent('cocacola')
AddEventHandler('cocacola', function()
    _source = source
    xPlayer = ESX.GetPlayerFromId(_source)

    xPlayer.removeMoney(200)
    xPlayer.addInventoryItem('cocacola', 1)
    TriggerClientEvent('mythic_notify:client:SendAlert', _source, {type = 'error', text = ('Hai comprato una cocacola!'), length = 5500})

end)