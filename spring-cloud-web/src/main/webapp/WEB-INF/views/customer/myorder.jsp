<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>消息详情</title>
    <meta name="description" content="正大海工"/>
    <meta name="keywords" content="正大海工"/>
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <link rel="stylesheet" href="css/amazeui.min.css"/>
    <link rel="stylesheet" href="css/style.css"/>
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/amazeui.min.js"></script>
</head>
<body>
<header data-am-widget="header" class="am-header am-header-default header" style="position:fixed;top:0; z-index:1000">
    <div class="am-header-left am-header-nav">
        <a href="#left-link" class="">
            <i class="am-header-icon am-icon-angle-left"></i>
        </a>
    </div>
    <h1 class="am-header-title"><a href="#title-link" class="" style="color: #333;">消息详情</a></h1>
    <div class="am-header-right am-header-nav">
        <a href="#right-link" class=""> </a>
    </div>
</header>
<div class="page zShow" id="couponDetail" refresh="0" style=" margin-top:120px;">
    <div class="coupon-wrap">
        <img src="images/default_photo.png" alt="logo" class="logo">
        <p class="name">时间：2017-08-20</p>
        <h2 class="sub-title"> 订单编号：13422101114</h2>
        <h2 class="sub-title">订单状态：安装完成</h2>
        <p class="condition">设备名称：<span></span>一体式红外线桥式全自动切割机 ZDH-500</p>
        <p class="date">设备编号：<span>80089009</span></p>

        <div class="contact-wrap">
            <p>售后服务人员01</p>
            <p> 联系电话 : <span>18899998888</span></p>
            <p>发货时间：2017-08-20</p>
        </div>
        对售后人员进行评价
        <div class="contact-wrap" align="center">
            <p><span class="fr" style="float:left"><input type="radio" name="radio" value="1"> <i
                    class="am-icon-thumbs-o-up"></i>&nbsp;好评</span></p>
            <p><span class="fr"><input type="radio" name="radio" value="2"> <i class="am-icon-thumbs-o-down"></i>&nbsp;差评</span>
            </p>
            <textarea placeholder="输入评价内容" class="tab-input"></textarea>
        </div>

        <br>
        <div align="center">
            <button style=" width:90px; height:30px; align-content:center; margin-left:0px; margin-bottom:10px;"
                    type="button">确认评价
            </button>
        </div>
    </div>

</div>
</body>
</html>
