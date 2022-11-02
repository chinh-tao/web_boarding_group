const navigation = performance.getEntriesByType("navigation")[0];

function initData() {
    if (navigation.type == 'navigate') {
        console.log("Remove old data");
        window.localStorage.removeItem('is_refresh');
        window.localStorage.removeItem('id-branch');
    } else if (navigation.type == 'reload') {
        console.log("Reload data page");
        if (window.localStorage['is_refresh'] == 'done') {
            console.log("Load data infor");
            getInforAdmin();
            return;
        }
    }
    window.addEventListener('load', function (ev) {
        handleInitApp();
    });
}

async function getInforAdmin() {
    const res = await fetch(`https://boarding-group.herokuapp.com/web/infor-admin?id=${window.localStorage['id-branch']}`, {
        method: 'GET',
        headers: {
            'Content-Type': 'application/json',
        },
    });
    if (res.status == 200) {
        const data = await res.json();
        if (data['code'] == 0) {
            window.dataAdmin = data['payload'];
            handleInitApp();
        }
    }
}

function handleInitApp() {
    _flutter.loader.loadEntrypoint({
        serviceWorker: {
            serviceWorkerVersion: serviceWorkerVersion,
        }
    }).then(function (engineInitializer) {
        return engineInitializer.initializeEngine();
    }).then(function (appRunner) {
        return appRunner.runApp();
    });
}

initData();