
function getDeviceLocation(mid,longitude,latitude) {
    var div = "<div > ";
    div += "<div>设备id：" +mid+"</div>";
    div += "<div>经度：" +longitude+"</div>";
    div += "<div>纬度：" +latitude+"</div>";
    div += "</div>";
    $('body').append(div);

    setCookie("ck_mid",mid,30,"/",document.domain);
    setCookie("ck_longitude",longitude,30,"/",document.domain);
    setCookie("ck_latitude",latitude,30,"/",document.domain);


}

function setCookie(c_name, value, expiredays, path, domain) {
    var exdate=new Date();
    exdate.setDate(exdate.getDate()+expiredays);
    document.cookie=c_name+ "=" +escape(value)+
        ((expiredays==null) ? "" : ";expires="+exdate.toGMTString())
        + ";path=" + path
        + ";domain=" + domain;
}