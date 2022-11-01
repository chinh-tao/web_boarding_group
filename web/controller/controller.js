const navigation = performance.getEntriesByType("navigation");

function initData(){
    if (navigation.type != navigation.TYPE_RELOAD) {
        window.localStorage.removeItem('is_refresh');
    } else if (window.localStorage['is_refresh'] == 'done') {
        getInforAdmin();
    }
}

async function getInforAdmin() {
    const res = await fetch(`http://192.168.19.91:8000/web/infor-admin?id=${window.localStorage['id-branch']}`, {
        method: 'GET',
        headers: {
            'Content-Type': 'application/json',
        },
    });
    const data = await res.json();
    window.dataAdmin = data['payload'];
}

initData();