<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    <style type="text/css">
        .qiehuan{
            background-color: inherit;
        }

        #wuliu_infor{
            background-color: rgba(0,0,0,0.5);
            width: 100%;
            height: 100%;
            position: absolute;
            top:0px;

        }

    </style>

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
        <p class="name">时间：2017-08-20</p>
        <h2 class="sub-title"> 订单编号：${data.id}</h2>
        <h2 class="sub-title">订单状态：${data.state}</h2>
        <c:if test="${not empty data.devices }">
            <c:forEach items="${data.devices}" var="device">
                <p class="condition">设备名称：<span></span>${device.device.name}</p>
                <p class="date">设备型号：<span>${device.device.sn}</span></p>
            </c:forEach>
        </c:if>

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

    <c:if test="${isEdit == true}">
        <ul class="fixed-btn">
            <li style="width: 90%;"><a href="javascript:delivery()" class="current">发货</a></li>
        </ul>
    </c:if>

</div>

<div class="hide" id="wuliu_infor">
    <div class="am-tabs qiehuan" data-am-tabs style="margin-top:70px;">
        <div class="am-tabs-bd">
            <div class="am-tab-panel am-fade am-in am-active" id="tab1">
                <li> 业务员信息
                    <input type="text" name="buser" id="buser" placeholder="姓名" class="tab-input"/>
                    <input type="text" name="bphone" id="bphone" placeholder="联系电话" class="tab-input"/>

                    <button type="button" onclick="addOrder()" class="tab-btn">确认提交</button>

                </li>
            </div>
        </div>
    </div>

</div>
</body>
<script type="text/javascript">
    function delivery() {
        $('#wuliu_infor').removeClass('hide');
    }

</script>

</html>
