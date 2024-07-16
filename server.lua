RegisterCommand('worm', function(source, args, rawCommand)
    TriggerClientEvent('showHackerMenu', source)
end, false)

RegisterServerEvent('toggleLights')
AddEventHandler('toggleLights', function(state)
    TriggerClientEvent('setArtificialLightsState', -1, state)
end)

RegisterServerEvent('sendMorsCode')
AddEventHandler('sendMorsCode', function(morsCode)
    TriggerClientEvent('flashLights', -1, morsCode)
end)