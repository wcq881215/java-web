<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    <style type="text/css">
        .qiehuan{

        }

        #resean{
            background-color: rgba(0,0,0,0.5);
            width: 100%;
            height: 100%;
            position: fixed;
            top:0px;

        }

        #resean .am-tabs-bd{
            background-color: transparent;
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
        <p class="name">时间：<fmt:formatDate value="${data.time}" pattern="yyyy-MM-dd"></fmt:formatDate> </p>
        <h2 class="sub-title"> 订单编号：${data.id}</h2>
        <h2 class="sub-title">订单状态：${data.state}</h2>

        <div class="contact-wrap">
            <p>客户姓名：${data.cust}</p>
            <p>电话 : <span>${data.phone}</span></p>
            <p>地址 : <span>${data.address}</span></p>
        </div>
        <div class="contact-wrap">
            <p>预约维护时间：<span>${data.stime}</span></p>
        </div>

        <div class="contact-wrap">
            <p>故障描述：${data.ext}</p>
        </div>

        <div class="contact-wrap">
            <p>备注信息：${data.remark}</p>
        </div>
    </div>

    <c:if test="${not empty data.fixOrderServer}">
        <div class="coupon-wrap" style="margin-top:0px;padding-top: 0px;">
            服务派工人员
        <div class="contact-wrap" style="margin-bottom: 60px;">
        <c:forEach items="${data.fixOrderServer}" var="service">
            <c:if test="${service.state ne -1}">
                <p>${service.user.role}：${service.user.name}</p>
            </c:if>
        </c:forEach>
        </div>
        </div>
    </c:if>


    <c:if test="${isEdit == true}">
        <ul class="fixed-btn" style="text-align: center;padding-left: 0px;">
            <li style="width: 150px;float: none;display: inline-block;"><a href="javascript:accept(1)" class="current">接受</a></li>
            <li style="width: 150px;float: none;display: inline-block;"><a href="javascript:refuse()" class="current">拒绝</a></li>
        </ul>
    </c:if>


</div>

<div class="hide" id="resean">
    <div class="am-tabs qiehuan"  onClick="event.cancelBubble = true" style="width: 90%;margin: 50% auto;border-radius: 8px;">
        <div class="">
            <div class="am-tab-panel am-fade am-in am-active" id="tab1">
                <li style="text-align: center;padding-top: 20px;">
                    <textarea id="refuse_season" cols="" rows="4" placeholder="请输入拒绝原因"></textarea>
                    <button type="button" onclick="refuse_sure()" class="tab-btn" style="padding: 2px;width: 150px;text-align: center;margin: auto 25% ;margin-top:20px;">确认提交</button>
                </li>
            </div>
        </div>
    </div>

</div>


</body>
<script type="text/javascript">
    function refuse() {
        $('#resean').removeClass("hide");
    }
    function refuse_sure() {
        var reason = $('#refuse_season').val();
        if(reason == ''){
            alert("请输入拒绝原因");
            return;
        }
        accept(-1,reason);
    }

    $('#resean').click(function () {
        $('#resean').addClass('hide');
    });
    
    function accept(status,reason) {

        $.ajax({
            type: 'post',
            url: '/web/order/srv/fix/status',
            data: {
                id: ${data.id},
                status: status,
                reason: reason
            },
            dataType: 'json',
            success: function (json) {
                console.log(json);
               if(json.code ==  '200'){
                    location.href =  "/order/after_sale.html";
               }else{
                   alertMess("操作失败");
               }
            }
        });
    }


</script>

</html>
