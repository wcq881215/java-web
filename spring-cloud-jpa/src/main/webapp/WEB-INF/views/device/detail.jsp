<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>设备详情</title>
    <meta name="description" content="正大海工"/>
    <meta name="keywords" content="正大海工"/>
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <link rel="stylesheet" href="/css/amazeui.min.css"/>
    <link rel="stylesheet" href="/css/style.css"/>
    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <script type="text/javascript" src="/js/amazeui.min.js"></script>
</head>
<body>
<div data-am-widget="slider" class="am-slider am-slider-default" data-am-slider='{}'>
    <ul class="am-slides">
        <c:forEach items="${device.imgs}" var="img">
            <li><img src="${img.src}"></li>
        </c:forEach>
    </ul>
</div>
<div class="detail">
    <h2>${device.name}</h2>
    <div class="price">
        <b>￥${device.price}</b>
    </div>
    <div class="kucun">
        <p>库存：${device.number}</p>
    </div>
</div>
<div class="comment hide">
    <h2>宝贝评价（0）</h2>
    <ul>
        <li><a hhref="">有图（0）</a></li>
        <li><a hhref="">好评（0）</a></li>
        <li><a hhref="">中评（0）</a></li>
        <li><a hhref="">差评（0）</a></li>
    </ul>
</div>
<div class="detail-con">
    ${device.desc}
</div>

</body>

</html>
