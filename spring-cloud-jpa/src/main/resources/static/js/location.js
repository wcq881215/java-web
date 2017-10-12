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
//
//     bridge.registerHandler('iosLoacaton', function (data, responseCallback) {
//         console.log('data >>> ' + data)
//         var responseData = {'code':"success"};
//         log('js response >>> ', responseData)
//         responseCallback(responseData)
//     })
//
// })

setupWebViewJavascriptBridge(function (bridge) {

        bridge.registerHandler('getDeviceLocation', function (data, responseCallback) {
            alert('调用js');
            console.log('请求js  传值参数是：' + JSON.stringify(data))
            var responseData = {'result': 'success'}
            getDeviceLocation();
    })

})

// setupWebViewJavascriptBridge(function (bridge) {
//
//     bridge.registerHandler('iosLoacaton', function (data, responseCallback) {
//         console.log('请求js  传值参数是：' + JSON.stringify(data))
//         var responseData = {'result': 'success'}
//         // responseCallback(responseData)
//     })
//
// var callbackButton = document.getElementById('buttons').appendChild(document.createElement('button'))
// callbackButton.innerHTML = '签到'
// callbackButton.onclick = function (e) {
//     e.preventDefault()
//
//     bridge.callHandler('getDeviceLocation', {
//         'mid': '1111111',
//         'longitude': 12525.252,
//         'latitude': 125.3254
//     }, function (response) {
//         //处理oc过来的回调
//         console.log('收到oc过来的回调:' + JSON.stringify(response))
//     })
// }
//
// function iosLoacaton(){
//     console.log('  iosLoacaton call ');
// }
//
// })
//
// function iosLoacaton(mid, longitude, latitude) {
// var data = {
//     "mid": mid,
//     "longitude": longitude,
//     "latitude": latitude
// };
// setupWebViewJavascriptBridge(function (bridge) {
//     bridge.callHandler('iosLoacaton', data, function (responseData) {
//         console.log("responseData" + responseData);
//         console.log("mid:mid:longitude:latitude" + mid + "   " + longitude + "  " + latitude);
//         getDeviceLocation(mid, longitude, latitude);
//     });
// });
// }
//
// function iosLoacaton(mid, longitude, latitude) {
//     getDeviceLocation(mid, longitude, latitude);
// }

