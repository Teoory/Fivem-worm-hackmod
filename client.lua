local lightsOff = false

RegisterNetEvent('showHackerMenu')
AddEventHandler('showHackerMenu', function()
    SendNUIMessage({
        action = 'showMenu'
    })
    SetNuiFocus(true, true)
end)

RegisterNUICallback('closeMenu', function(data, cb)
    SetNuiFocus(false, false)
    cb('ok')
end)

RegisterNUICallback('selectOption', function(data, cb)
    if data.action == 'mors' then
        SendNUIMessage({
            action = 'showMorsInput'
        })
    elseif data.action == 'lights_off' then
        lightsOff = true
        TriggerServerEvent('toggleLights', true)
        Citizen.CreateThread(function()
            while lightsOff do
                SetArtificialLightsState(true)
                Citizen.Wait(0)
            end
        end)
    elseif data.action == 'lights_on' then
        lightsOff = false
        TriggerServerEvent('toggleLights', false)
    end
    cb('ok')
end)

RegisterNUICallback('submitMorsCode', function(data, cb)
    if data.morsCode then
        TriggerServerEvent('sendMorsCode', data.morsCode)
    end
    cb('ok')
end)

RegisterNetEvent('flashLights')
AddEventHandler('flashLights', function(morsCode)
    local morsTable = {
        ['A'] = '.-', ['B'] = '-...', ['C'] = '-.-.', ['D'] = '-..', ['E'] = '.', 
        ['F'] = '..-.', ['G'] = '--.', ['H'] = '....', ['I'] = '..', ['J'] = '.---',
        ['K'] = '-.-', ['L'] = '.-..', ['M'] = '--', ['N'] = '-.', ['O'] = '---', 
        ['P'] = '.--.', ['Q'] = '--.-', ['R'] = '.-.', ['S'] = '...', ['T'] = '-',
        ['U'] = '..-', ['V'] = '...-', ['W'] = '.--', ['X'] = '-..-', ['Y'] = '-.--', 
        ['Z'] = '--..',
        ['1'] = '.----', ['2'] = '..---', ['3'] = '...--', ['4'] = '....-', 
        ['5'] = '.....', ['6'] = '-....', ['7'] = '--...', ['8'] = '---..', 
        ['9'] = '----.', ['0'] = '-----',
        [' '] = ' '
    }

    local function flashMorseCode(code)
        for char in code:gmatch(".") do
            if lightsOff then
                break
            end

            if char == "." then
                SetArtificialLightsState(false)
                Wait(500)
                SetArtificialLightsState(true)
                Wait(500)
            elseif char == "-" then
                SetArtificialLightsState(false)
                Wait(1500)
                SetArtificialLightsState(true)
                Wait(500)
            else
                Wait(1500)
            end
        end
    end

    local function convertToMorse(text)
        local morseCode = ''
        for char in text:upper():gmatch(".") do
            morseCode = morseCode .. (morsTable[char] or '') .. ' '
        end
        return morseCode
    end

    local morseCode = convertToMorse(morsCode)
    flashMorseCode(morseCode)
end)

RegisterNetEvent('setArtificialLightsState')
AddEventHandler('setArtificialLightsState', function(state)
    SetArtificialLightsState(state)
end)
