ESX = nil
cars = 'veto2'

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
    end
end)

Citizen.CreateThread(function()
	while true do
		local coords = GetEntityCoords(GetPlayerPed(-1))
		Citizen.Wait(0)
		if GetDistanceBetweenCoords(coords, -161.89416503906, -2134.3852539062, 16.705030441284, true) < 10 then 
			DrawMarker(5, -161.89416503906, -2134.3852539062, 16.705030441284, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.7, 0.7, 0.7, 255, 0, 0, 255, false, true, 2, false, false, false, false)
			if GetDistanceBetweenCoords(coords, -161.89416503906, -2134.3852539062, 16.705030441284, true) < 1.5 then
				ESX.ShowHelpNotification('Premi ~INPUT_CONTEXT~ Per aprire il menu')
				if IsControlJustReleased(0, 38) then 
					spawnCar(cars)
				end 
			end 
		end

		if GetDistanceBetweenCoords(coords, -153.29425048828, -2125.4870605469, 16.705017089844, true) < 10 then 
			DrawMarker(2, -153.29425048828, -2125.4870605469, 16.705017089844, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.3, 0.3, 0.3, 255, 0, 0, 255, true, true, 2, false, false, false, false)
			if GetDistanceBetweenCoords(coords, -153.29425048828, -2125.4870605469, 16.705017089844, true) < 1.5 then
				ESX.ShowHelpNotification('Premi ~INPUT_CONTEXT~ Per aprire il menu')
				if IsControlJustReleased(0, 38) then 
					OpenShopsMenu()
				end 
			end 
		end

		if GetDistanceBetweenCoords(coords, -160.38623046875, -2137.6467285156, 16.705018997192, true) < 1.5 then
			ESX.ShowHelpNotification('Premi ~INPUT_CONTEXT~ per posare il veicolo')
			if IsControlJustReleased(0, 38) then 
				ESX.Game.DeleteVehicle(GetVehiclePedIsIn(PlayerPedId()))
			end
		end

	end
end)



-----------------
----Functions----
-----------------
function spawnCar(car)
    local car = GetHashKey(car)

    RequestModel(car)
    while not HasModelLoaded(car) do
        RequestModel(car)
        Citizen.Wait(0)
    end

    local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
    local vehicle = CreateVehicle(car, x, y, z, 0.0, true, false)
    SetEntityAsMissionEntity(vehicle, true, true)
end

function OpenShopsMenu()
	local tabella = {
		{label = 'HotDogs - 200$', value = '1'},
		{label = 'CocaCola - 200$', value = '2'}
	}
	ESX.UI.Menu.CloseAll()
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'menumain', {
		title = 'Menu Accessorio',
		align = 'top-left',
		elements = tabella
		},
	function(data, menu)
		local v = data.current.value
		if v == '1' then
			Give(true, nil)
		elseif v == '2' then
			Give(nil, true)
		end
	end,
	function(data, menu)
		menu.close()
	end)
end

function Give(heavy, med)
    if heavy ~= nil then
        TriggerServerEvent('hotdogs')
    elseif med ~= nil then 
        TriggerServerEvent('cocacola')
    end
end
