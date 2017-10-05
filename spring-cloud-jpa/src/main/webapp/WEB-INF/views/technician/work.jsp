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
<ul class="nav">
    <li>
        <a href="/technician/problem.html">
            <img src="/images/cx.png"/>
            <p>问题汇总</p>
        </a>
    </li>

    <li>
        <a href="/technician/deal.html">
            <img src="/images/yscx.png"/>
            <p>售后解决方案</p>
        </a>
    </li>
    <li>
        <a href="/technician/upload.html">
            <img src="/images/fw.png"/>
            <p>上传解决方案</p>
        </a>
    </li>


</ul>


<%@include file="../footer.jsp" %>


</body>
</html>
