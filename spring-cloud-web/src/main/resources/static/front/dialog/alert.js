
function alertMsg(message,location){

    $.Pop( message, 'alert', callback(location));

}

function callback(path) {
    setTimeout(function () {
        location.href = path;
    },5000)

}

function alertMsg(message){
    $.Pop(message, 'alert', back);
}

function back() {
    history.go(-1);
}

function alertMess(message){

    $.Pop(message,'alert',function(){console.log('alert')});

}