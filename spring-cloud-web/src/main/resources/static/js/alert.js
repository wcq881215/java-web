function alertMsg(message,callName){

    $.DialogByZ.Alert({Title: "提示", Content: message, BtnL: "确定", FunL: callName});

}

function callback(path) {
    setTimeout(function () {
        location.href = path;
    },5000)

}

function alertMsg(message){
    $.DialogByZ.Alert({Title: "提示", Content: message, BtnL: "确定", FunL: back});
}

function back() {
    history.go(-1);
}

function alertMess(message){

    $.DialogByZ.Alert({Title: "", Content: message, BtnL: "确定"});

}