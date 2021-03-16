ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterServerEvent('hotdogs')
AddEventHandler('hotdogs', function()
    _source = source
    xPlayer = ESX.GetPlayerFromId(_source)
    hotdog = xPlayer.getInventoryItem('hotdog')
        
    if hotdog.limit ~= -1 and (hotdog.count + 1) > hotdog.limit then
		TriggerClientEvent('mythic_notify:client:SendAlert', _source, {type = 'error', text = ('Inventory Full'), length = 5500})
	else
        if xPlayer.getMoney() >= 200 then
			xPlayer.removeMoney(200)
			xPlayer.addInventoryItem("hotdog", 1)
			TriggerClientEvent('mythic_notify:client:SendAlert', _source, {type = 'error', text = ('Successfully Buyed!'), length = 5500})
		    else			
		    TriggerClientEvent('mythic_notify:client:SendAlert', _source, {type = 'error', text = ('You dont have enough money!'), length = 5500})
	    end       
	end 
end)


RegisterServerEvent('cocacola')
AddEventHandler('cocacola', function()
    _source = source
    xPlayer = ESX.GetPlayerFromId(_source)
    cocacola = xPlayer.getInventoryItem('cocacola')
       
    if cocacola.limit ~= -1 and (cocacola.count + 1) > cocacola.limit then
		TriggerClientEvent('mythic_notify:client:SendAlert', _source, {type = 'error', text = ('Inventory Full'), length = 5500})
	else
        if xPlayer.getMoney() >= 200 then
			xPlayer.removeMoney(200)
			xPlayer.addInventoryItem("cocacola", 1)
			TriggerClientEvent('mythic_notify:client:SendAlert', _source, {type = 'error', text = ('Successfully Buyed!'), length = 5500})
		    else			
		    TriggerClientEvent('mythic_notify:client:SendAlert', _source, {type = 'error', text = ('You dont have enough money!'), length = 5500})
	    end       
	end 
end)
