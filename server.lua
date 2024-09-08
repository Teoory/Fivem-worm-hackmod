-- RegisterCommand fonksiyonu ile worm komutunu oluşturuyoruz. Bu komutu yazan kişiye hacker menüsünü açıyoruz. 

RegisterCommand('worm', function(source, args, rawCommand)          -- worm komutu yazılırsa bu fonksiyon çalışır | source: komutu yazan kişinin id'si | args: komutun argümanları | rawCommand: komutun tam hali (örn: /worm 1 2 3)
    TriggerClientEvent('showHackerMenu', source)                    -- Client tarafında showHackerMenu eventini tetikliyoruz ve source parametresi ile komutu yazan kişinin id'sini gönderiyoruz.
end, false)                                                         -- Komutun konsolda gözükmesini istemiyorsak false, gözükmesini istiyorsak true yazmalıyız.

RegisterServerEvent('toggleLights')                                 -- toggleLights eventini oluşturuyoruz. Bu eventi tetikleyerek tüm oyuncularda şehirdeki ışıkların açık veya kapalı olmasını sağlayacağız.
AddEventHandler('toggleLights', function(state)                     -- toggleLights eventi tetiklendiğinde bu fonksiyon çalışır. state parametresi ile ışıkların açık mı kapalı mı olacağını belirliyoruz.
    TriggerClientEvent('setArtificialLightsState', -1, state)       -- client tarafında setArtificialLightsState eventini tetikliyoruz ve state parametresi ile ışıkların açık mı kapalı mı olacağını gönderiyoruz. (-1: tüm oyuncular)
end)                                                                -- fonksiyonun sonu

RegisterServerEvent('sendMorsCode')                                 -- sendMorsCode eventini oluşturuyoruz. Bu eventi tetikleyerek tüm oyuncularda mors kodu gösterimi yapacağız.
AddEventHandler('sendMorsCode', function(morsCode)                  -- sendMorsCode eventi tetiklendiğinde bu fonksiyon çalışır. morsCode parametresi ile gönderilen mors kodunu alıyoruz.
    TriggerClientEvent('flashLights', -1, morsCode)                 -- client tarafında flashLights eventini tetikliyoruz ve morsCode parametresi ile mors kodunu gönderiyoruz. (-1: tüm oyuncular)
end)                                                                -- fonksiyonun sonu