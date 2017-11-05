<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>安装视频</title>
    <meta name="description" content="正大海工"/>
    <meta name="keywords" content="正大海工"/>
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <link rel="stylesheet" href="/css/amazeui.min.css"/>
    <link rel="stylesheet" href="/css/style.css"/>
    <link rel="stylesheet" href="/mobile/video.css"/>
    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <script src="/js/html5media.js"></script>
    <style type="text/css">
        body {
            background-color: #ffffff;
        }
    </style>
</head>
<body>
<header data-am-widget="header" class="am-header am-header-default header">
    <div class="am-header-left am-header-nav">
        <a href="javascript:history.go(-1)" class="">
            <i class="am-header-icon am-icon-angle-left"></i>
        </a>
    </div>
    <h1 class="am-header-title"><a href="#title-link" class="" style="color: #333;">安装视频</a></h1>
    <div class="am-header-right am-header-nav">
        <a href="#right-link" class=""> </a>
    </div>
</header>
<div class="content">
    <h1>${data.title}</h1>
    <div>
        ${data.content}
    </div>
</div>

<c:if test="${not empty data.videos}">
    <div class="" style="text-align: center;">
        <video style="margin: 0px auto;" class="video" width="100%" height="347" controls preload>
            <source src="${data.videos[0].path}" media="only screen and (min-device-width: 568px)"></source>
            <source src="${data.videos[0].path}" media="only screen and (max-device-width: 568px)"></source>
            <source src="${data.videos[0].path}"></source>
        </video>
        <div class="clear"></div>
    </div>
</c:if>
</body>
</html>

