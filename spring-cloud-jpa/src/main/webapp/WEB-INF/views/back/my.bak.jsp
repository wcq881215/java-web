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
<div class="member">
    <div class="member-pic">
        <img src="/images/default_photo.png"/>
    </div>
    <div class="member-infor">${sessionScope.session_user.username}</div>
</div>
<ul class="member-nav">
    <li><a href="/user/address.html"><i class="am-icon-map-marker"></i><span>收货地址</span></a></li>
    <li><a href="/user/order.html"><i class="am-icon-newspaper-o"></i><span>我的订单</span></a></li>
    <li><a href="/user/cart.html"><i class="am-icon-cart-arrow-down"></i><span>购物车</span></a></li>
    <li><a href="/user/notify.html"><i class="am-icon-bell-o"></i><span>系统通知</span></a></li>
    <li><a href="/user/card.html"><i class="am-icon-credit-card"></i><span>会员卡</span></a></li>
    <li><a href="/user/yhq.html"><i class="am-icon-cc-mastercard"></i><span>优惠券</span></a></li>
    <li><a href="/user/jifen.html"><i class="am-icon-dollar"></i><span>积分</span></a></li>
</ul>
<ul class="member-nav mt">
    <li><a href="/web/contact.html"><i class="am-icon-phone"></i>联系我们</a></li>
</ul>
<div class="h50"></div>

<%@include file="../footer.jsp"%>

</body>
</html>