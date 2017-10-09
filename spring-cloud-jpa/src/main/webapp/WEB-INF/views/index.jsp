<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String idfa = request.getParameter("device");
    System.out.println("===================reqeust from mobile device :: " + idfa);

    idfa = request.getHeader("device");
    System.out.println("===================reqeust header from mobile device :: " + idfa);
%>


<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>登录</title>
    <meta name="description" content="正大海工"/>
    <meta name="keywords" content="正大海工"/>
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <link rel="stylesheet" href="/css/amazeui.min.css"/>
    <link rel="stylesheet" href="/css/style.css"/>
    <script type="text/javascript" src="/js/jquery-1.10.2.js"></script>
    <script type="text/javascript" src="/js/location.js"></script>

</head>
<body style="background: rgb(50, 149, 251);">

<div class="page zShow" id="couponDetail" refresh="0" style="background: rgb(50, 149, 251); margin-top:120px;">
    <div class="coupon-wrap">
        <img src="/images/default_photo.png" alt="logo" class="logo">

        <form id="userform" method="post" action="/user/login">
        <div class="am-tabs-bd">

            <div class="am-tab-panel am-fade am-in am-active" id="tab1">
                <li>
                    <%--<input type="text" name="username" id="username" placeholder="请输入用户名" class="tab-input"/>--%>
                    <select id="username"  name="username">
                        <option value="admin">管理员</option>
                        <option value="tech">技术员</option>
                        <option value="office">内勤</option>
                        <option value="service">售后服务</option>
                        <option value="produce">生产部</option>
                        <option value="custom">购机客户</option>
                    </select>

                        <input type="password" name="password" id="password" value="111111" placeholder="输入用户密码" class="tab-input"/>

                </li>

            </div>
        </div>
        </form>
    </div>


    <div class="receive-btn" onclick="receiveCoupon()" style="background: rgb(255, 255,255); color:#565656">登录</div>
    <div align="center" style="margin-top:2px;"><p style="color: #FFFFFF">新用户注册</p></div>


</div>
</body>
<script type="text/javascript">

    function receiveCoupon() {
        var username = $('#username').val();
        var password = $('#password').val();
        if (username == '') {
            alert("请输入用户名");
            return;
        }
        if (password == '') {
            alert("请输入密码");
            return;
        }
        $('#userform').submit();

        <%--$.ajax({--%>
            <%--type: "get",--%>
            <%--url: "${pageContext.request.contextPath}/web/user/login",--%>
            <%--dataType: 'json',--%>
            <%--data: 'username=' + username + "&password=" + password,--%>
            <%--success: function (json) {--%>
                <%--if (json.code != '200') {--%>
                    <%--alert(json.msg);--%>
                    <%--return;--%>
                <%--}--%>
                <%--location.href = "${pageContext.request.contextPath}/page/admin/home";--%>
            <%--}--%>
        <%--});--%>


    }
</script>
</html>
