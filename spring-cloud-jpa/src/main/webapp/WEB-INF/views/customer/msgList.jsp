<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>我的消息</title>
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

    <h1 class="am-header-title"><a href="#title-link" class="" style="color: #333;">我的消息</a></h1>
    <div class="am-header-right am-header-nav">
        <a href="#right-link" class=""> </a>
    </div>
</header>

<div data-am-widget="slider" class="am-slider am-slider-default" data-am-slider='{}' style="margin-top:50px;">
    <ul class="am-slides">
        <li><img src="/images/banner3.png"></li>

    </ul>
</div>


<div data-am-widget="intro" class="am-intro am-cf am-intro-default" style="margin-left:10px;">

    <div class="am-g am-intro-bd">
        <a href="/web/order/message/1" target="_top">
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
        <a href="/web/order/message/1" target="_top">
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
        <a href="/web/order/message/1" target="_top">
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


<div class="h50"></div>

<%@include  file="../footer.jsp" %>

</body>

<script type="text/javascript">
    init();
    function init() {
        $.ajax({
            type: 'post',
            url: '/web/order/user/message',
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
