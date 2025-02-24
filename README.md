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
