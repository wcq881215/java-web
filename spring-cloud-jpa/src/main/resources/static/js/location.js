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


setupWebViewJavascriptBridge(function (bridge) {
        // iosLoacaton这个注册的函数名就是我要native调用js时协商的函数名，也就是你文档里写的那2个接口名，在这里申请后，就不需要单独申明function了
        bridge.registerHandler('iosLoacaton', function (data, responseCallback) {
            // app native调用了协商的函数后，就会进入这个回调里面，你可以在这个回调里面做相应的事情，比如调用getDeviceLocation()
            console.log('请求js  传值参数是：' + JSON.stringify(data))
            
            var responseData = {'result': 'success'}
            responseCallback(responseData); // 这个是你接到我的调用，然后想回传给我的响应数据
            if(data){
                getDeviceLocation(data.mid,data.longitude,data.latitude);
            }
            // 做其他的事情
    })

})



