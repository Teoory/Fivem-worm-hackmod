window.addEventListener('message', function(event) {
    if (event.data.action == 'showMenu') {
        document.getElementById('menu').style.display = 'block';
        document.getElementById('morsInput').style.display = 'none';
    } else if (event.data.action == 'showMorsInput') {
        document.getElementById('menu').style.display = 'none';
        document.getElementById('morsInput').style.display = 'block';
    }
});

function closeMenu() {
    fetch(`https://${GetParentResourceName()}/closeMenu`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json; charset=UTF-8'
        },
        body: JSON.stringify({})
    }).then(resp => resp.json()).then(resp => {
        document.getElementById('menu').style.display = 'none';
        document.getElementById('morsInput').style.display = 'none';
    });
}

function selectOption(action) {
    fetch(`https://${GetParentResourceName()}/selectOption`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json; charset=UTF-8'
        },
        body: JSON.stringify({action: action})
    }).then(resp => resp.json());
}

function submitMorsCode() {
    const morsCode = document.getElementById('morsCode').value;
    fetch(`https://${GetParentResourceName()}/submitMorsCode`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json; charset=UTF-8'
        },
        body: JSON.stringify({morsCode: morsCode})
    }).then(resp => resp.json());
}
