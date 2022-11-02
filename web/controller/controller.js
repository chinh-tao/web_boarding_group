const navigation = performance.getEntriesByType("navigation")[0];

function initData() {
    console.log(navigation.type);
    if (navigation.type == 'navigate') {
        console.log("op-1");
        window.localStorage.removeItem('is_refresh');
        window.localStorage.removeItem('id-branch');
    } else if(navigation.type == 'reload'){
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