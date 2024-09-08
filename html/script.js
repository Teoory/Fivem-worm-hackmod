// Bu dosya, HTML dosyası için client tarafındaki JavaScript fonksiyonlarını çağırmak için kullanılır

window.addEventListener('message', function(event) { // Bu fonksiyon, HTML dosyası ve Lua tarafı arasındaki iletişimi sağlar | addEventListener, bir olay gerçekleştiğinde belirli bir işlevi çağırmak için kullanılır
    // bu kodda açık sayfada addEventListener('message', function(event) kodu sayesinde 'message' adında bir olay oluştuğunda function(event) fonksiyonu çalışır

    if (event.data.action == 'showMenu') {                              // Eğer event.data.action 'showMenu' ise aşağıdaki kodları çalıştır | event.data.action, Lua tarafından gönderilen verinin içindeki action verisini alır
        document.getElementById('menu').style.display = 'block';        // HTML dosyasındaki menu id'li div'in görünürlüğünü block yapar (görünür yapar)
        document.getElementById('morsInput').style.display = 'none';    // HTML dosyasındaki morsInput id'li div'in görünürlüğünü none yapar (görünmez yapar)

    } else if (event.data.action == 'showMorsInput') {                  // Eğer event.data.action 'showMorsInput' ise aşağıdaki kodları çalıştır
        document.getElementById('menu').style.display = 'none';         // HTML dosyasındaki menu id'li div'in görünürlüğünü none yapar (görünmez yapar)
        document.getElementById('morsInput').style.display = 'block';   // HTML dosyasındaki morsInput id'li div'in görünürlüğünü block yapar (görünür yapar)
    }
});                                                                     // addEventListener fonksiyonu burada biter

function closeMenu() {                                                  // closeMenu fonksiyonu oluşturulur
    fetch(`https://${GetParentResourceName()}/closeMenu`, {             // client.lua dosyasındaki closeMenu fonksiyonunu çağırır | GetParentResourceName(), Lua tarafındaki resource adını alır ve çağırır | fetch, belirtilen URL'ye bir istek gönderir
        method: 'POST',                                                 // istek gönderilen url'nin methodunu belirler | post: veri gönderir, get: veri çeker, put: veri günceller, delete: veri siler
        headers: {
            'Content-Type': 'application/json; charset=UTF-8'           // istek gönderilen url'nin başlığını belirler | 'Content-Type': 'application/json; charset=UTF-8', gönderilen verinin türünü belirler
        },
        body: JSON.stringify({})                                        // gönderilen verinin içeriğinin bununla değiştirir. | JSON.stringify({}), gönderilen veriyi JSON formatına çevirir
    }).then(resp => resp.json()).then(resp => {                         // fetch fonksiyonun düzgün çalışırsan hemen sonrasında çalışacak fonksiyonu belirler | resp.json(), gelen veriyi JSON formatına çevirir | resp: gelen veriyi belirler
        document.getElementById('menu').style.display = 'none';
        document.getElementById('morsInput').style.display = 'none';
    });
}

function selectOption(action) {                                         //  SEN DOLDUR
    fetch(`https://${GetParentResourceName()}/selectOption`, {          //  SEN DOLDUR
        method: 'POST',                                                 //  SEN DOLDUR
        headers: {
            'Content-Type': 'application/json; charset=UTF-8'           // SEN DOLDUR
        },
        body: JSON.stringify({action: action})                          // SEN DOLDUR
    }).then(resp => resp.json());                                       // SEN DOLDUR
}

function submitMorsCode() {                                             // submitMorsCode fonksiyonu oluşturulur
    const morsCode = document.getElementById('morsCode').value;         // submitMorsCode fonksiyonunun içinde morsCode adında yeni bir veri oluşturur ve HTML dosyasındaki morsCode id'li input'un değerini alır
    fetch(`https://${GetParentResourceName()}/submitMorsCode`, {        // client.lua dosyasındaki submitMorsCode fonksiyonunu çağırır
        method: 'POST',
        headers: {
            'Content-Type': 'application/json; charset=UTF-8'
        },
        body: JSON.stringify({morsCode: morsCode})                      // gönderilen verinin içeriğinin bununla değiştirir. | JSON.stringify({morsCode: morsCode}) gönderilen veriyi JSON formatına çevirir yani morsCode adında bir veri oluşturur ve içine morsCode verisini atar
    }).then(resp => resp.json());                                       // fetch fonksiyonun düzgün çalışırsan hemen sonrasında çalışacak fonksiyonu belirler | resp.json(), gelen veriyi JSON formatına çevirir
}                                                                       // submitMorsCode fonksiyonu burada biter
