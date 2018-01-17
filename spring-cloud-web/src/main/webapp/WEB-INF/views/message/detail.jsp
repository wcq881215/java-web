<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="page zShow" id="couponDetail" refresh="0" style=" margin-top:0px;">
    <div class="coupon-wrap">
        <img src="/images/default_photo.png" alt="logo" class="logo">
        <h2 class="sub-title"> ${data.title}</h2>
        <p class="name">${data.time}</p>
        <p class="condition">${data.content}</p>

    </div>
</div>