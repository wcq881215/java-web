<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>客户资料</title>
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

    <style type="text/css">
        .qiehuan {

        }

        .dialog_back {
            background-color: rgba(0, 0, 0, 0.5);
            width: 100%;
            height: 100%;
            position: fixed;
            top: 0px;

        }

        .dialog_back .am-tabs-bd {
            background-color: transparent;
        }

        .fixed-btn li a {
            padding: 7px 10px;
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
    <h1 class="am-header-title"><a href="#title-link" class="" style="color: #333;">客户资料</a></h1>
    <div class="am-header-right am-header-nav">
        <a href="#right-link" class=""> </a>
    </div>
</header>
<div class="page zShow" id="couponDetail" refresh="0" style=" margin-top:0px;">
    <div class="coupon-wrap" style="width: 100%;">
        <p class="condition">&nbsp;&nbsp;&nbsp;&nbsp;用户ID：<span></span>${data.id}</p>
        <p class="date">&nbsp;&nbsp;&nbsp;&nbsp;用户名：<span>${data.username}</span></p>
        <p class="date">用户姓名：<span>${data.name}</span></p>
        <p class="date">用户电话：<span>${data.phone}</span></p>
        <p class="date">所属地区：<span>${data.area}</span></p>

    </div>
    <div class="receive-btn" onclick="back()" style="background: rgb(50, 149, 251);color:#fff">确 认</div>
</div>

</body>
<script type="text/javascript">
    function back() {
        history.go(-1);
    }
</script>

</html>
