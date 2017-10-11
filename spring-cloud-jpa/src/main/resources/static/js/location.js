function getDeviceLocation(mid, longitude, latitude) {
    var div = "<div > ";
    div += "<div>设备id：" + mid + "</div>";
    div += "<div>经度：" + longitude + "</div>";
    div += "<div>纬度：" + latitude + "</div>";
    div += "</div>";
    $('body').append(div);

    setCookie("ck_mid", mid, 30, "/", document.domain);
    setCookie("ck_longitude", longitude, 30, "/", document.domain);
    setCookie("ck_latitude", latitude, 30, "/", document.domain);


}

function setCookie(c_name, value, expiredays, path, domain) {
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + expiredays);
    document.cookie = c_name + "=" + escape(value) +
        ((expiredays == null) ? "" : ";expires=" + exdate.toGMTString())
        + ";path=" + path
        + ";domain=" + domain;
}


function setupWebViewJavascriptBridge(callback) {
    if (window.WebViewJavascriptBridge) {
        return callback(WebViewJavascriptBridge);
    }
    if (window.WVJBCallbacks) {
        return window.WVJBCallbacks.push(callback);
    }
    window.WVJBCallbacks = [callback];
    var WVJBIframe = document.createElement('iframe');
    WVJBIframe.style.display = 'none';
    WVJBIframe.src = 'https://__bridge_loaded__';
    document.documentElement.appendChild(WVJBIframe);
    setTimeout(function () {
        document.documentElement.removeChild(WVJBIframe)
    }, 0)
}

// setupWebViewJavascriptBridge(function (bridge) {
//     var uniqueId = 1
//
//     function log(message, data) {
//         var log = document.getElementById('log')
//         var el = document.createElement('div')
//         el.className = 'logLine'
//         el.innerHTML = uniqueId++ + '. ' + message + ':<br/>' + JSON.stringify(data)
//         if (log.children.length) {
//             log.insertBefore(el, log.children[0])
//         }
//         else {
//             log.appendChild(el)
//         }
//     }
//
//     bridge.registerHandler('testJavascriptHandler', function (data, responseCallback) {
//         log('ObjC called testJavascriptHandler with', data)
//         var responseData = {'Javascript Says': 'Right back atcha!'}
//         log('JS responding with', responseData)
//         responseCallback(responseData)
//     })
//
//     document.body.appendChild(document.createElement('br'))
//
//     var callbackButton = document.getElementById('buttons').appendChild(document.createElement('button'))
//     callbackButton.innerHTML = 'Fire testObjcCallback'
//     callbackButton.onclick = function (e) {
//         e.preventDefault()
//         log('JS calling handler "testObjcCallback"')
//         bridge.callHandler('testObjcCallback', {'foo': 'bar'}, function (response) {
//             log('JS got response', response)
//         })
//     }
// })

function iosLoacaton(mid, longitude, latitude) {
    var data = {
        "mid": mid,
        "longitude": longitude,
        "latitude": latitude
    };

    setupWebViewJavascriptBridge(function (bridge) {
        bridge.callHandler('iosLoacaton', data, function (responseData) {
            console.log("responseData" + responseData);
            console.log("mid:mid:longitude:latitude" + mid + "   " + longitude + "  " + latitude);
            getDeviceLocation(mid, longitude, latitude);
        });
    });
}

