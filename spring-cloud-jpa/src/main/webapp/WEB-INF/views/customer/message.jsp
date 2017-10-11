<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>消息</title>
    <meta name="description" content="消息"/>
    <meta name="keywords" content="消息"/>
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <link rel="stylesheet" href="/css/amazeui.min.css"/>
    <link rel="stylesheet" href="/css/style.css"/>
    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <script type="text/javascript" src="/js/amazeui.min.js"></script>
</head>
<body>

<header data-am-widget="header" class="am-header am-header-default header"
        style="width:100%;position:fixed; z-index:1000;top:0;left:0;">

    <h1 class="am-header-title"><a href="#title-link" class="" style="color: #333;">消息</a></h1>
    <div class="am-header-right am-header-nav">
        <a href="#right-link" class=""> </a>
    </div>
</header>


<ul class="member-nav" style="margin-top:50px;">

    <li><a href="/customer/msgList.html"><i class="am-icon-bell-o"></i><span>我的消息</span></a></li>
</ul>
<br>

<div class="h50"></div>

<%@include file="../footer.jsp" %>

</body>
</html>
