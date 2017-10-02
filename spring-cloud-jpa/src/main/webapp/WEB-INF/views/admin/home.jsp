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
        <a href="search.html">
            <img src="/images/icon.jpg"/>
            <p>公司动态</p>
        </a>
    </li>
    <li>
        <a href="search.html">
            <img src="/images/icon1.jpg"/>
            <p>最新产品</p>
        </a>
    </li>
    <li>
        <a href="search.html">
            <img src="/images/icon2.jpg"/>
            <p>安装视频</p>
        </a>
    </li>
    <li>
        <a href="yhq.html">
            <img src="/images/icon3.jpg"/>
            <p>常规设备保养技巧</p>
        </a>
    </li>
</ul>

<div data-am-widget="titlebar" class="am-titlebar am-titlebar-default title">
    <h2 class="am-titlebar-title ">保养指南</h2>
    <nav class="am-titlebar-nav">
        <a href="#more" class="">更多 &raquo;</a>
    </nav>
</div>
<div data-am-widget="intro" class="am-intro am-cf am-intro-default" style="margin-left:10px;">

    <div class="am-g am-intro-bd">
        <a href=" ">
            <div class="am-intro-right am-u-sm-9">
                <h2>专业石材的清洁与保养方法</h2>
                <p>不同磨损的石材翻新养护方法：1、修补破损及中缝补胶（无缝处理）...</p>
                <div class="text" style=" margin-right:20px;">
                    <span class="fl">2017-5-23</span>
                    <span style="float:right; margin-right:10px;">查看详情</span>
                </div>
            </div>
        </a>
    </div>

    <div class="am-g am-intro-bd">
        <a href=" ">
            <div class="am-intro-right am-u-sm-9">
                <h2>专业石材的清洁与保养方法</h2>
                <p>不同磨损的石材翻新养护方法：1、修补破损及中缝补胶（无缝处理）...</p>
                <div class="text" style=" margin-right:20px;">
                    <span class="fl">2017-5-23</span>
                    <span style="float:right; margin-right:10px;">查看详情</span>
                </div>
            </div>
        </a>
    </div>

    <div class="am-g am-intro-bd">
        <a href=" ">
            <div class="am-intro-right am-u-sm-9">
                <h2>专业石材的清洁与保养方法</h2>
                <p>不同磨损的石材翻新养护方法：1、修补破损及中缝补胶（无缝处理）...</p>
                <div class="text" style=" margin-right:20px;">
                    <span class="fl">2017-5-23</span>
                    <span style="float:right; margin-right:10px;">查看详情</span>
                </div>
            </div>
        </a>
    </div>


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
<div data-am-widget="navbar" class="am-navbar am-cf am-navbar-default footer " id="">
    <ul class="am-navbar-nav am-cf am-avg-sm-4">
        <li>
            <a href="${sessionScope.role}/main" class="">
                <span class=""><img src="/images/nav.png"/></span>
                <span class="am-navbar-label" style="color:#43b3f4;">首页</span>
            </a>
        </li>
        <li>
            <a href="${sessionScope.role}/work" class="">
                <span class=""><img src="/images/nav8.png"/></span>
                <span class="am-navbar-label">工作</span>
            </a>
        </li>
        <li>
            <a href="${sessionScope.role}/message" class="">
                <span class=""><img src="/images/nav2.png"/></span>
                <span class="am-navbar-label">消息</span>
            </a>
        </li>

        <li>
            <a href="${sessionScope.role}/my" class="">
                <span class=""><img src="/images/nav4.png"/></span>
                <span class="am-navbar-label">我的</span>
            </a>
        </li>

    </ul>
</div>


</body>

<script type="text/javascript">
    init();
    function init() {
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


</script>

</html>


