<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>登录</title>
    <meta name="description" content="正大海工"/>
    <meta name="keywords" content="正大海工"/>
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <link rel="stylesheet" href="css/amazeui.min.css"/>
    <link rel="stylesheet" href="css/style.css"/>
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/amazeui.min.js"></script>
</head>
<body style="background: rgb(50, 149, 251);">

<div class="page zShow" id="couponDetail" refresh="0" style="background: rgb(50, 149, 251); margin-top:120px;">
    <div class="coupon-wrap">
        <img src="images/default_photo.png" alt="logo" class="logo">


        <div class="am-tabs-bd">

            <div class="am-tab-panel am-fade am-in am-active" id="tab1">
                <li>
                    <input type="text" name="username" id="username" placeholder="请输入用户名" class="tab-input"/>
                    <input type="password" name="password" id="password" placeholder="输入用户密码" class="tab-input"/></li>
            </div>
        </div>
    </div>


    <div class="receive-btn" onclick="receiveCoupon()" style="background: rgb(255, 255,255); color:#565656">登录</div>
    <div align="center" style="margin-top:2px;"><p style="color: #FFFFFF">新用户注册</p></div>

</div>
</body>
<script type="text/javascript">
    function receiveCoupon() {
        var username = $('#username').val();
        var password = $('#password').val();
        if(username == ''){
            alert("请输入用户名");
            return;
        }
        if(password == ''){
            alert("请输入密码");
            return;
        }

        $.ajax(

            url:"/user/login",
            type:"post",
            dataType:"json",
            param:{username:username,password:password},

            success:function (data) {
                alert('success' +data);
            }
        );
    }
</script>
</html>
