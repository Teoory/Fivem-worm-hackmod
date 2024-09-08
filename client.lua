local lightsOff = false 
-- Başlatıldığında lightsOff değişkenini oluşturulur ve değerini false yapar.

-- "=" atama yapar |  "==" karşılaştırma yapar |  "===" karşılaştırma ve tür kontrolü yapar  |  "!=" eşit değilse |  "!==" tür kontrolü yapar
-- "&&" ve anlamına gelir |  "||" veya anlamına gelir

-- "=" için örnek:
-- local x;                                 | x değişkeni tanımlanır
-- x = 5;                                   | x değişkenine 5 değeri atanır
-- x = x + 1;                               | x değişkenine x değeri + 1 değeri atanır

-- "==" için örnek:
-- local x = 5;                             | x değişkeni tanımlanır ve 5 değeri atanır
-- if x == 5 then                           | x değişkeni 5 değerine eşitse
--     print('x 5 değerine eşit')           | x 5 değerine eşitse bu mesajı yazdı


-- RegisterNetEvent: Sunucudan tetiklenen bir olayı dinler

-- AddEventHandler: Olay tetiklendiğinde çalışacak fonksiyonu belirtir



-- SendNUIMessage: NUI mesajı gönderir. NUI mesajı, NUI tarafından dinlenen bir olayı tetikler ve veri gönderir (data: gönderilecek veri) (action: tetiklenecek olay) 

-- SetNuiFocus: NUI odaklanma durumunu ayarlar (true: odaklanır, false: odaklanmaz) (true, true: fare ve klavye etkileşimi sağlar)

-- RegisterNUICallback: NUI geri çağrılarını dinler ve işler (cb: callback fonksiyonu) (data: callbackden gelen veri)



-- TriggerServerEvent: Sunucuya olay gönderir (event: gönderilecek olay) (data: gönderilecek veri)
-- Citizen.CreateThread: Thread oluşturur ve belirtilen işlemleri gerçekleştirir (function: işlemler) (while: döngü oluşturur) (Wait: belirli bir süre bekler) (0: milisaniye) (true: döngüyü sürekli çalıştırır)
-- Thread oluşturulduğunda işlemler sırasıyla gerçekleştirilir ve döngü oluşturulduğunda belirtilen süre boyunca işlemler tekrarlanır



-- SetArtificialLightsState: Gta5 kodu, (true ise şehirdeki tüm ışıkları kapatır) (false ise şehirdeki tüm ışıkları açar)  | https://docs.fivem.net/natives/?_0x1268615ACE24D504
-- Wait: Belirli bir süre bekler (milisaniye) | (0: milisaniye) (1000: 1 saniye) (10000: 10 saniye) (60000: 1 dakika)



-- () kullanımı: Fonksiyonları belirtir ve parametreleri alır  |örnek: RegisterNetEvent('showHackerMenu') fonksiyonunu belirtir ve 'showHackerMenu' parametresini alır ' ' kullanımı: String(metin) belirtir ve içerisine metin türünde veri ekler

-- {} kullanımı: Dizi oluşturur ve içerisine veriler ekler |örnek: local morsTable = { ['A'] = '1', ['B'] = '2' } morsTable adında bir dizi oluşturur ve içerisine 'A' ve 'B' verilerini ekler ['A'] = '1' 'A' verisine '1' değerini ekler yani A=1 olur
-- [ ] kullanmamızın sebebi: Dizi oluşturduğumuzda içerisine veri eklerken verileri belirtmek için kullanırız |örnek: ['A'] = '1' 'A' verisine '1' değerini ekler yani A=1 olur

-- .. kullanımı: String birleştirme işlemi yapar



RegisterNetEvent('showHackerMenu')                          -- Sunucudan tetiklenen 'showHackerMenu' olayını dinler
AddEventHandler('showHackerMenu', function()                -- 'showHackerMenu' olayı tetiklendiğinde çalışacak fonksiyonu belirtir
    SendNUIMessage({
        action = 'showMenu'
    })                                                      -- NUI mesajı gönderir ve 'showMenu' olayını tetikler
    SetNuiFocus(true, true)                                 -- NUI odaklanma durumunu ayarlar ve fare ve klavye etkileşimi sağlar
end)                                                        -- Fonksiyonu sonlandırır

RegisterNUICallback('closeMenu', function(data, cb)         -- closeMenu callbackini dinler ve işler function dan sonra () koyma nedenimiz geri çağrıdan gelen veriyi almak için 
    SetNuiFocus(false, false)                               -- NUI odaklanma durumunu ayarlar ve odaklanmaz (fare ve klavye etkileşimi sağlamaz)
    cb('ok')                                                -- Callback fonksiyonunu çalıştırır
end)

RegisterNUICallback('selectOption', function(data, cb)      -- selectOption callbackini dinler ve işler function dan sonra () koymazsak geri çağrıdan gelen veriyi alamayız
    if data.action == 'mors' then                           -- Eğer data.action 'mors' ise | data.action: Callbackdan gelen veri 'mors' stringine eşit ise SendNUIMessage fonksiyonunu çalıştırır
        SendNUIMessage({
            action = 'showMorsInput'
        })                                                  -- NUI mesajı gönderir ve 'showMorsInput' olayını tetikler

                                                            -- Eğer üsttesağlanmazsa alttaki kodlar çalışır (yani data.action 'mors' stringine eşit değilse) (farklı bir kullanım eğer üstteki if koşulu : data.action != 'mors' olsaydı data.action 'mors' stringine eşit olmadığında çalışırdı)
                                                        
    elseif data.action == 'lights_off' then                 -- Eğer data.action 'lights_off' ise | data.action: Callbackdan gelen veri 'lights_off' stringine eşit ise lightsOff değişkenini true yapar ve TriggerServerEvent fonksiyonunu çalıştırır
        lightsOff = true                                    -- lightsOff değişkenini true yapar
        TriggerServerEvent('toggleLights', true)            -- Sunucuya 'toggleLights' olayını gönderir ve true değerini gönderir | Sunucuda bu olay tetiklendiğinde şehirdeki tüm ışıkları kapatır
        Citizen.CreateThread(function()                     -- Thread oluşturur ve belirtilen işlemleri gerçekleştirir (döngü oluşturur)
            while lightsOff do                              -- while döngüsü oluşturur ve lightsOff değişkeni true olduğu sürece döngüyü çalıştırır
                SetArtificialLightsState(true)
                Citizen.Wait(0)                             -- Belirli bir süre bekler (milisaniye)
            end
        end)                                                -- Thread'i sonlandırır

                                                            -- Eğer üsttesağlanmazsa alttaki kodlar çalışır
    elseif data.action == 'lights_on' then                  -- Eğer data.action 'lights_on' ise | data.action: gCallbackdan gelen veri 'lights_on' stringine eşit ise lightsOff değişkenini false yapar ve TriggerServerEvent fonksiyonunu çalıştırır
        lightsOff = false                                   -- lightsOff değişkenini false yapar
        TriggerServerEvent('toggleLights', false)           -- Sunucuya 'toggleLights' olayını gönderir ve false değerini gönderir | Sunucuda bu olay tetiklendiğinde şehirdeki tüm ışıkları açar
    end
    cb('ok')                                                -- Callback fonksiyonunu çalıştırır 
end)                                                        -- Fonksiyonu sonlandırır

RegisterNUICallback('submitMorsCode', function(data, cb)    -- SEN DOLDUR
    if data.morsCode then                                   -- SEN DOLDUR
        TriggerServerEvent('sendMorsCode', data.morsCode)   -- SEN DOLDUR
    end                                                     -- SEN DOLDUR
    cb('ok')                                                -- SEN DOLDUR
end)                                                        -- SEN DOLDUR

RegisterNetEvent('flashLights')                             -- Sunucudan tetiklenen 'flashLights' olayını dinler
AddEventHandler('flashLights', function(morsCode)           -- 'flashLights' olayı tetiklendiğinde çalışacak fonksiyonu belirtir ve morsCode parametresini alır
    local morsTable = {
        ['A'] = '.-', ['B'] = '-...', ['C'] = '-.-.', ['D'] = '-..', ['E'] = '.', ['F'] = '..-.', ['G'] = '--.', ['H'] = '....', ['I'] = '..', ['J'] = '.---', ['K'] = '-.-', ['L'] = '.-..', ['M'] = '--', ['N'] = '-.', ['O'] = '---', ['P'] = '.--.', ['Q'] = '--.-', ['R'] = '.-.', ['S'] = '...', ['T'] = '-', ['U'] = '..-', ['V'] = '...-', ['W'] = '.--', ['X'] = '-..-', ['Y'] = '-.--', ['Z'] = '--..',
        ['1'] = '.----', ['2'] = '..---', ['3'] = '...--', ['4'] = '....-', ['5'] = '.....', ['6'] = '-....', ['7'] = '--...', ['8'] = '---..', ['9'] = '----.', ['0'] = '-----',
        [' '] = ' '
    }                                                       -- morsTable adında bir dizi oluşturur ve içerisine değerleri ekler | ['A'] = '.-' 'A' verisine '.-' değerini ekler yani A=.- olur

    local function flashMorseCode(code)                     -- flashMorseCode fonksiyonunu oluşturur ve code parametresini alır
        for char in code:gmatch(".") do                     -- code değişkenindeki her bir karakteri alır ve döngü oluşturur (code değişkeni flashMorseCode(code) kısmından gelmekte) | gmatch: string içerisindeki karakterleri alır | gmatch(".") her bir karakteri alır
            if lightsOff then                               -- Eğer lightsOff değişkeni true ise
                break                                       -- Döngüyü sonlandırır (fonksiyondan çıkar)
            end                                             -- Koşulu sonlandırır (if döngüsünden çıkış yapar)

            if char == "." then                            -- Eğer char '.' ise
                SetArtificialLightsState(false)            -- Şehirdeki tüm ışıkları kapatır
                Wait(500)                                  -- 500ms ışıkları kapalı tutar
                SetArtificialLightsState(true)             -- Şehirdeki tüm ışıkları açar

                                                           -- Eğer char '.' değilse ve char '-' ise
            elseif char == "-" then
                SetArtificialLightsState(false)            -- Şehirdeki tüm ışıkları kapatır
                Wait(1500)                                 -- 1500ms ışıkları kapalı tutar ( 1.5 saniye )
                SetArtificialLightsState(true)             -- Şehirdeki tüm ışıkları açar

                                                           -- Eğer if ve elseif koşulları sağlanmazsa alttaki kodlar çalışır
            else
                SetArtificialLightsState(true)
                Wait(1500)                                 -- 1500ms bekler ( 1.5 saniye ) (boşluk karakteri için)
            end                                            -- Koşulu sonlandırır (if döngüsünden çıkış yapar)
        end                                                -- Döngüyü sonlandırır (for döngüsünden çıkış yapar)
    end                                                    -- Fonksiyonu sonlandırır

    local function convertToMorse(text)                                 -- convertToMorse fonksiyonunu oluşturur ve text parametresini alır | parametre olarak text yerine başka bir şey de yazılabilir ne yazmak istediğinize bağlı
        local morseCode = ''                                            -- morseCode değişkenini tanımlar ve içerisine boş bir değer atar
        for char in text:upper():gmatch(".") do                         -- text değişkenindeki her bir karakteri alır ve döngü oluşturur (text değişkeni convertToMorse(text) kısmından gelmekte) | gmatch: string içerisindeki karakterleri alır | gmatch(".") her bir karakteri alır | upper: string içerisindeki karakterleri büyük harfe çevirir
            morseCode = morseCode .. (morsTable[char] or '') .. ' '     -- morseCode değişkenine morsTable dizisindeki karakterleri ekler ve aralarına boşluk ekler | morsTable[char] dizisindeki karakterleri alır ve morseCode değişkenine ekler | or: eğer morsTable[char] dizisindeki karakter yoksa boş bir değer ekler
        end                                                             -- Döngüyü sonlandırır (for döngüsünden çıkış yapar)
        return morseCode                                                -- morseCode değişkenini döndürür
    end                                                                 -- Fonksiyonu sonlandırır

    local morseCode = convertToMorse(morsCode)                          -- morseCode değişkenine convertToMorse fonksiyonunu çalıştırır ve morsCode parametresini ekler
    flashMorseCode(morseCode)                                           -- flashMorseCode fonksiyonunu çalıştırır ve morseCode parametresini ekler
end)                                                                    -- AddEventHandler('flashLights', function(morsCode) Fonksiyonu sonlandırır

RegisterNetEvent('setArtificialLightsState')                            -- Sunucudan tetiklenen 'setArtificialLightsState' olayını dinler
AddEventHandler('setArtificialLightsState', function(state)             -- 'setArtificialLightsState' olayı tetiklendiğinde çalışacak fonksiyonu belirtir ve state parametresini alır
    SetArtificialLightsState(state)                                     -- Gta5 kodu, (true ise şehirdeki tüm ışıkları kapatır) (false ise şehirdeki tüm ışıkları açar) (state: gönderilen değer) ( state değeri sunucudan gelecek olan değerdir )
end)
