<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>注册</title>
    <meta name="description" content="正大海工"/>
    <meta name="keywords" content="正大海工"/>
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <link rel="stylesheet" href="/css/amazeui.min.css"/>
    <link rel="stylesheet" href="/css/style.css"/>
    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <script type="text/javascript" src="/js/amazeui.min.js"></script>

    <style>
        .am-tab-panel{
            font-size: 14px;
        }
        .am-tab-panel li label {
            width: 93px;
            line-height: 35px;
            height: 35px;
        }

        .am-tab-panel li .tab-input {
            width: calc(98% - 93px);
        }

    </style>
</head>
<body style="background: rgb(50, 149, 251);">

<header data-am-widget="header" class="am-header am-header-default header"
        style="width:100%;position:fixed; z-index:1000;top:0;left:0;">
    <div class="am-header-left am-header-nav">
        <a href="javascript:history.go(-1)" class="">
            <i class="am-header-icon am-icon-angle-left"></i>
        </a>
    </div>
    <h1 class="am-header-title"><a href="#title-link" class="" style="color: #333;">个人资料</a></h1>
    <div class="am-header-right am-header-nav">
        <a href="#right-link" class=""> </a>
    </div>
</header>

<div class="page zShow" id="couponDetail" refresh="0" style="background: rgb(50, 149, 251); margin-top:120px;">
    <div class="coupon-wrap">


        <div class="am-tabs-bd">

            <div class="am-tab-panel am-fade am-in am-active" id="tab1">
                <li>
                    <label>用户ID：</label> <input type="text" readonly value="${sessionScope.session_user.id}" class="tab-input"/>
                    <input type="hidden" id="uid" value="${sessionScope.session_user.id}"/>

                    <label>登陆用户名：</label> <input type="text" readonly value="${sessionScope.session_user.username}" class="tab-input"/>
                    <label>用户姓名：</label> <input type="text" placeholder="姓名" name="name" id="name"
                                                value="${sessionScope.session_user.name}" class="tab-input"/>
                    <label>用户电话：</label> <input type="text" placeholder="电话" name="phone" id="phone"
                                                value="${sessionScope.session_user.phone}" class="tab-input"/>
                    <label>登陆密码：</label> <input type="text" placeholder="设置密码" name="password" id="password"
                                                class="tab-input"/>
                    <label>确认密码：</label> <input type="text" placeholder="确认密码" name="cfmpassword" id="cfmpassword"
                                                class="tab-input"/></li>
            </div>
        </div>
    </div>

    <div class="receive-btn" onclick="updateUser()" style="background: rgb(255, 255, 255);color:#565656">确 认</div>

</div>
</body>
<script type="text/javascript">

    function updateUser() {
        var uid = $('#uid').val();
        var name = $('#name').val();
        var phone = $('#phone').val();
        var password = $('#password').val();
        var cfmpassword = $('#cfmpassword').val();

        if (name == '') {
            alert("请输入用户姓名");
            return;
        }
        if (phone == '') {
            alert("请输入电话");
            return;
        }
        if (password == '') {
            alert("请输入密码");
            return;
        }

        if (cfmpassword == '') {
            alert("请输入密码");
            return;
        }

        if (password != cfmpassword) {
            alert("2次输入密码不一致");
            return;
        }

        $.ajax({
            type: "get",
            url: "${pageContext.request.contextPath}/web/user/update",
            dataType: 'json',
            data: 'name=' + name + '&password=' + password + '&id=' + uid + '&phone=' + phone,
            success: function (json) {
                if (json.code != '200') {
                    alert(json.msg);
                } else {
                    alert('修改成功');
                }
            }
        });
    }

</script>
</html>