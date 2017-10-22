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
</head>
<body>

<header data-am-widget="header" class="am-header am-header-default header"
        style="width:100%;position:fixed; z-index:1000;top:0;left:0;">

    <h1 class="am-header-title"><a href="#title-link" class="" style="color: #333;">工作</a></h1>
    <div class="am-header-right am-header-nav">
        <a href="#right-link" class=""> </a>
    </div>
</header>

<div data-am-widget="slider" class="am-slider am-slider-default" data-am-slider='{}'>
    <ul class="am-slides">
        <li><img src="/images/banner3.png"></li>

    </ul>
</div>
<h3 align="center" style="padding-top:15px;">订单管理</h3>
<hr>
<ul class="nav">
    <li>
        <a href="/order/addOrder.html">
            <img src="/images/cx.png"/>
            <p>订单录入</p>
        </a>
    </li>

    <li>
        <a href="/order/query.html">
            <img src="/images/yscx.png"/>
            <p>订单查询</p>
        </a>
    </li>

</ul>

<h3 align="center" class="hide" style="padding-top:15px;">售后管理</h3>
<hr class="hide">
<ul class="hide nav">
    <li>
        <a href="/order/done.html">
            <img src="/images/fw.png"/>
            <p>安装查询</p>
        </a>
    </li>
    <li>
        <a href="/order/maintentce.html">
            <img src="/images/az.png"/>
            <p>维修查询</p>
        </a>
    </li>
    <li>
        <a href="/order/fix.html">
            <img src="/images/az.png"/>
            <p>设备保修</p>
        </a>
    </li>

</ul>


<h3 align="center" class="hide" style="padding-top:15px;">客户管理</h3>
<hr class="hide">
<ul class="hide nav">
    <li>
        <a href="/user/sale.html">
            <img src="/images/az.png"/>
            <p>购机客户查询</p>
        </a>
    </li>

    <li>
        <a href="/contact/add.html">
            <img src="/images/az.png"/>
            <p>意向客户录入</p>
        </a>
    </li>

    <li>
        <a href="/contact/query.html">
            <img src="/images/az.png"/>
            <p>意向客户查询</p>
        </a>
    </li>

    <li>
        <a href="/message/send.html">
            <img src="/images/az.png"/>
            <p>信息群发</p>
        </a>
    </li>

</ul>

<div class="h50"></div>

<%@include file="../footer.jsp" %>


</body>
</html>
