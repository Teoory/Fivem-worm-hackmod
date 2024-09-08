-- En güncel versiyon cerulean
fx_version 'cerulean'
-- Oyun adı "gta4 - gta5 - rdr3" gibi
-- https://docs.fivem.net/docs/scripting-reference/resource-manifest/resource-manifest/#game
game 'gta5'

author 'Teory'
description 'Modun acıklaması. Bu mod sayesinde konsola "worm" yazarak mod menüsünü açabilir ve fonksiyonları kullanabilirsiniz'
-- Semantic versonlama da kullanılır. 1.2.3 gibi 1 major, 2 minor, 3 patch için kullanılır
version '1.0.0'

-- Modun dosyalarını belirtir, client kullanıcı tarafında çalışır, server sunucu tarafında çalışır
client_script 'client.lua'

-- eğer birden fazla dosya varsa
--          client_scripts {
--              'client.lua',
--              'client2.lua'
--          }
-- gibi kullanılır {} dizi olduğunu belirtmek için kullanılır


-- Başka bir mod ile birlikte çalışması gerekiyorsa bağımlılıklarını belirtir örnek olarak bir ürün satış modu yazıyorsak ekonomi moduna bağımlılık gerekir
-- dependencies {
--     'ekonomi_modu'
-- }

server_script 'server.lua'

-- UI sayfası için gerekli dosyaları belirtir
files {
    'html/index.html',
    'html/script.js',
    'html/style.css'
}

-- UI sayfasını belirtir
ui_page 'html/index.html'