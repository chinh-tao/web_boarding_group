const navigation = performance.getEntriesByType("navigation");

function initData() {
    if (navigation.type != navigation.TYPE_RELOAD) {
        console.log("op-1");
        window.localStorage.removeItem('is_refresh');
    } else {
        console.log("op-2");
        if (window.localStorage['is_refresh'] == 'done') {
            console.log("op-2.1");
            getInforAdmin();
        }
    }
}

async function getInforAdmin() {
    const res = await fetch(`https://boarding-group.herokuapp.com/web/infor-admin?id=${window.localStorage['id-branch']}`, {
        method: 'GET',
        headers: {
            'Content-Type': 'application/json',
        },
    });
    const data = await res.json();
    window.dataAdmin = data['payload'];
}

initData();