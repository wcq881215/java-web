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
    <link type="text/css" rel="stylesheet" href="/mobile/zdialog.css"/>
    <script type="text/javascript" src="/mobile/jquery-1.11.2.min.js"></script>
    <script type="text/javascript" src="/mobile/zdialog.js"></script>
    <script type="text/javascript" src="/js/alert.js?v=1.0"></script>

    <style>
        .am-tab-panel {
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

        .am-tab-panel li input {
            padding-bottom: 5px;
            margin: 7px auto;
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
    <h1 class="am-header-title"><a href="#title-link" class="" style="color: #333;">开户</a></h1>
    <div class="am-header-right am-header-nav">
        <a href="#right-link" class=""> </a>
    </div>
</header>

<div class="page zShow" id="couponDetail" refresh="0" style="background: rgb(50, 149, 251); margin-top:120px;">
    <div class="coupon-wrap">

        <div class="am-tabs-bd">

            <div class="am-tab-panel am-fade am-in am-active" id="tab1">
                <li>

                    <label>登陆用户名：</label>
                    <input type="text" placeholder="" id="username" name="username" value="" class="tab-input"/>
                    <label>用户姓名：</label>
                    <input type="text" placeholder="" name="name" id="name" value="" class="tab-input"/>
                    <label>用户电话：</label>
                    <input type="text" placeholder="" name="phone" id="phone" value="" class="tab-input"/>
                    <label>部门：</label>
                    <select id="dept" name="dept">


                    </select>
                    <br>
                    <%--<label>科室：</label>--%>
                    <%--<input type="text" placeholder="例如:生产一部" name="phone" id="team" value="" class="tab-input"/>--%>
                    <label style="margin-bottom:0px;">登陆密码：</label>
                    <input type="text" style="margin-bottom:15px;" placeholder="设置密码,默认111111" name="password"
                           id="password" class="tab-input"/>

            </div>
        </div>
    </div>

    <div class="receive-btn" onclick="addUser()" style="background: rgb(255, 255, 255);color:#565656">确 认</div>

</div>
</body>
<script type="text/javascript">

    queryDept();

    function queryDept() {
        $.ajax({
            type: "get",
            url: "${pageContext.request.contextPath}/web/user/type/list",
            dataType: 'json',
            data: '',
            success: function (json) {
                var html = createHtml(json);
                $('#dept').html(html);
            }
        });
    }

    function createHtml(json) {
        var html = "";
        var array = json.obj;
        console.log(array);
        for (var i in array) {
            var data = array[i];
            html += "<option value='" + data + "' >";
            html += data;
            html += "</option>";
        }

        return html;
    }

    function addUser() {
        var username = $('#username').val();
        var name = $('#name').val();
        var phone = $('#phone').val();
        var password = $('#password').val();
        var dept = $('#dept').val();

        if (username == '') {
            alertMess("请输入登陆用户");
            return;
        }

        if (name == '') {
            alertMess("请输入用户姓名");
            return;
        }
        if (phone == '') {
            alertMess("请输入电话");
            return;
        }
        if (password == '') {
//            alertMess("请输入密码");
//            return;
            password = "111111";
        }
        //验证username
        $.ajax({
            type: "get",
            url: "${pageContext.request.contextPath}/web/user/check",
            dataType: 'json',
            data: 'username=' + username,
            success: function (result) {
                if (result == false || result == 'false') {
                    alertMess('用户名已经存在,请使用新的登陆用户名');
                } else {
                    //添加
                    $.ajax({
                        type: "get",
                        url: "${pageContext.request.contextPath}/web/user/add",
                        dataType: 'json',
                        data: 'name=' + name + '&password=' + password + '&username=' + username + '&phone=' + phone + '&dept=' + dept,
                        success: function (json) {
                            if (json.code != '200') {
                                alertMess(json.msg);
                            } else {
                                alertMess('操作成功');
                                location.href = "/${sessionScope.role}/work";
                            }
                        }
                    });
                }
            }
        });

    }

</script>
</html>