<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>正大海工</title>
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
    <script type="text/javascript" src="/js/location.js?v=1.0"></script>
</head>
<body>
<div class="member">
    <div class="member-pic">
        <img src="/images/default_photo.png"/>
    </div>
    <div class="member-infor">${sessionScope.session_user.username}</div>
</div>
<ul class="member-nav">
    <li><a href="/user/self.html"><i class="am-icon-map-marker"></i><span>个人资料</span></a></li>
    <li><a href="/user/notify.html"><i class="am-icon-bell-o"></i><span>系统通知</span></a></li>
    <li><a href="/user/about.html"><i class="am-icon-credit-card"></i><span>关于系统</span></a></li>
    <li><a href="/web/contact.html"><i class="am-icon-phone"></i>联系我们</a></li>
</ul>

<div class="h50"></div>

<div class="receive-btn" onclick="exit()" style="background: rgb(50, 149, 251); color:#fff">退出登录</div>

<%@include file="../footer.jsp" %>

</body>
<script type="text/javascript">

    function exit() {
        setCookie("logout","1",1,"/",document.domain);
        document.location.href = "/user/exit";
    }

</script>
</html>