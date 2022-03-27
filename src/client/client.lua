
RegisterNetEvent('L_TopBar:SendMessage')
AddEventHandler('L_TopBar:SendMessage', function(message,color)
	SendNUIMessage({ text = message, colors = color })
end)