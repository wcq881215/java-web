<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>首页</title>
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

    <h1 class="am-header-title"><a href="#title-link" class="" style="color: #333;">首页</a></h1>
    <div class="am-header-right am-header-nav">
        <a href="#right-link" class=""> </a>
    </div>
</header>

<div data-am-widget="slider" class="am-slider am-slider-default" data-am-slider='{}' style="margin-top:50px;">
    <ul class="am-slides">
        <li><img src="/images/banner3.png"></li>

    </ul>
</div>


<ul class="nav">
    <li>
        <a href="/news/more.html">
            <img src="/images/icon.jpg"/>
            <p>公司动态</p>
        </a>
    </li>
    <li>
        <a href="/web/device/more">
            <img src="/images/icon1.jpg"/>
            <p>最新产品</p>
        </a>
    </li>
    <li>
        <a href="/video/more.html">
            <img src="/images/icon2.jpg"/>
            <p>安装视频</p>
        </a>
    </li>
    <li>
        <a href="/web/maintain/more">
            <img src="/images/icon3.jpg"/>
            <p>常规设备保养技巧</p>
        </a>
    </li>

    <li>
        <a href="/attach/query.html">
            <img src="/images/bx.png"/>
            <p>配件库</p>
        </a>
    </li>
</ul>

<div data-am-widget="titlebar" class="am-titlebar am-titlebar-default title">
    <h2 class="am-titlebar-title ">保养指南</h2>
    <nav class="am-titlebar-nav">
        <a href="/web/maintain/more" class="">更多 &raquo;</a>
    </nav>
</div>
<div data-am-widget="intro" id="maintain-gallery" class="am-intro am-cf am-intro-default" style="margin-left:10px;">


</div>


<div data-am-widget="titlebar" class="am-titlebar am-titlebar-default title">
    <h2 class="am-titlebar-title ">最新产品</h2>
    <nav class="am-titlebar-nav">
        <a href="/web/device/more" class="">更多 &raquo;</a>
    </nav>
</div>
<ul data-am-widget="gallery" id="products-gallery"
    class="am-gallery am-avg-sm-2 am-avg-md-3 am-avg-lg-4 am-gallery-default product">

</ul>


<div class="h50"></div>

<%@include file="../footer.jsp" %>

</body>

<script type="text/javascript">
    initDevice();
    initMaint();
    function initDevice() {
        $.ajax({
            type: 'post',
            url: '/web/device/new',
            data: {},
            dataType: 'html',
            success: function (html) {
                console.log(html);
                $('#products-gallery').html(html);
            }
        });
    }

    function initMaint() {
        $.ajax({
            type: 'post',
            url: '/web/maintain/new',
            data: {},
            dataType: 'html',
            success: function (html) {
                console.log(html);
                $('#maintain-gallery').html(html);
            }
        });
    }


</script>

</html>


