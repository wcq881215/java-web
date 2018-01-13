<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>订单详情</title>
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
<header data-am-widget="header" class="am-header am-header-default header" style="position:fixed;top:0; z-index:1000">
    <div class="am-header-left am-header-nav">
        <a href="javascript:history.go(-1)" class="">
            <i class="am-header-icon am-icon-angle-left"></i>
        </a>
    </div>
    <h1 class="am-header-title"><a href="#title-link" class="" style="color: #333;">订单详情</a></h1>
    <div class="am-header-right am-header-nav">
        <a href="#right-link" class=""> </a>
    </div>
</header>
<div class="page zShow" id="couponDetail" refresh="0" style=" margin-top:120px;">
    <div class="coupon-wrap">
        <img src="/images/default_photo.png" alt="logo" class="logo">
        <p class="name">时间：<fmt:formatDate value="${data.time}" pattern="yyyy-MM-dd"></fmt:formatDate> </p>
        <h2 class="sub-title"> 订单编号：${data.id}</h2>
        <h2 class="sub-title">订单状态：${data.state}</h2>
        <p class="condition">设备名称：<span></span>${data.device}</p>
        <p class="date">设备型号：<span>${data.sn}</span></p>
        <div class="contact-wrap">
            <p>客户姓名：${data.cust}</p>
            <p>电话 : <span>${data.phone}</span></p>

        </div>
        <div class="contact-wrap">

            <p>预约安装时间：<span>${data.dtime}</span></p>
        </div>

        <div class="contact-wrap">
            <p>安装要求：${data.ext}</p>
        </div>

    </div>


    <div class="h50"></div>
    <ul class="fixed-btn">
        <li style="width: 95%;"><a href="javascript:accept(${data.id})" class="current">接受</a></li>
        <li class="hide"><a href="javascript:refuse(${data.id})">拒绝</a></li>
    </ul>

</div>
</body>
<script type="text/javascript">
    function accept(id) {
        $.ajax({
            type: 'post',
            url: '/web/order/product/accept/${data.id}',
            data: { },
            dataType: 'json',
            success: function (json) {
                console.log(json);
                if (json.code =='200') {
                    alertMess("操作成功")
                    location.href = "/order/production.html";
                } else {
                    alertMess("操作失败")
                }
            }
        });
    }

    function refuse(id) {
        $.ajax({
            type: 'post',
            url: '/web/order/product/refuse/${data.id}',
            data: { },
            dataType: 'json',
            success: function (json) {
                console.log(json);
                if (json.code =='200') {
                    alertMess("操作成功");
                    location.href = "/order/production.html";
                } else {
                    alertMess("操作失败")
                }
            }
        });
    }

</script>

</html>
