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

        }

        #wuliu_infor{
            background-color: rgba(0,0,0,0.5);
            width: 100%;
            height: 100%;
            position: fixed;
            top:0px;

        }

        #wuliu_infor .am-tabs-bd{
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


    <c:if test="${isEdit == true}">
        <ul class="fixed-btn hide" style="text-align: center;padding-left: 0px;">
            <li style="width: 150px;float: none;display: inline-block;"><a href="javascript:delivery()" class="current">发货</a></li>
        </ul>
    </c:if>

    <c:if test="${isSplit == true}">
        <div class="coupon-wrap" style="margin-top:-40px;padding-top: 0px;">
            <div class="contact-wrap" style="margin-bottom: 60px;">
                <p>物流公司：${data.logistics}</p>
                <p>联系电话: <span>${data.iphone}</span></p>
                <p>司机：${data.driver}</p>
                <p>司机电话: <span>${data.logphone}</span></p>
                <p>发货时间: <span>${data.delatime}</span></p>
            </div>

            <ul class="fixed-btn">
                <li style="width: 90%;"><a href="javascript:selectTech()" class="current">派工</a></li>
            </ul>
        </div>
    </c:if>

    <c:if test="${not empty data.service}">
        <div class="coupon-wrap" style="margin-top:0px;padding-top: 0px;">
            服务派工人员
        <div class="contact-wrap" style="margin-bottom: 60px;">
        <c:forEach items="${data.service}" var="service">
            <c:if test="${service.state ne -1}">
                <p>${service.user.role}：${service.user.name}</p>
            </c:if>
        </c:forEach>
        </div>
        </div>
    </c:if>



</div>

<div class="hide" id="wuliu_infor">
    <div class="am-tabs qiehuan"  onClick="event.cancelBubble = true" style="width: 90%;margin: 50% auto;border-radius: 8px;">
        <div class="">
            <div class="am-tab-panel am-fade am-in am-active" id="tab1">
                <li>
                    <input type="text" name="logistics" id="logistics"  value="${data.logistics}" placeholder="物流公司" class="tab-input"/>
                    <input type="text" name="iphone" id="iphone"  value="${data.iphone}" placeholder="联系电话" class="tab-input"/>
                    <input type="text" name="driver" id="driver" value="${data.driver}" placeholder="司机" class="tab-input"/>
                    <input type="text" name="logphone" id="logphone" value="${data.logphone}" placeholder="司机电话" class="tab-input"/>
                    <input type="date" name="delatime" id="delatime" value="${data.delatime}" placeholder="发货时间" class="tab-input"/>
                    <button type="button" onclick="addLogistics()" class="tab-btn" style="padding: 2px;width: 150px;text-align: center;margin: auto 25% ;margin-top:20px;">确认提交</button>
                </li>
            </div>
        </div>
    </div>

</div>


<div class="am-tabs qiehuan hide" id="user-content" data-am-tabs style="margin-top:50px; ">
    <div class="search-input" style="">
        <input type="text" id="key" name="key" placeholder="输入关键词查找"/>
    </div>

    <ul class="member-nav">

    </ul>
    <br><br>
    <button type="button" onclick="splitOrder()" class="tab-btn">确 定</button>

</div>


</body>
<script type="text/javascript">
    function delivery() {
        $('#wuliu_infor').removeClass('hide');
    }
    
    $('#wuliu_infor').click(function (e) {
        $('#wuliu_infor').addClass('hide');
    });

    $('#wuliu_infor .am-tabs').unbind();

    
    function addLogistics() {
        var oid = ${data.id};
        var logistics = $('#logistics').val();
        var iphone = $('#iphone').val();
        var driver = $('#driver').val();
        var logphone = $('#logphone').val();
        var delatime = $('#delatime').val();

        if (logistics == '') {
            alert('请输入物流公司');
            return;
        }
        if (iphone == '') {
            alert('请输入物流公司联系电话');
            return;
        }
        if (driver == '') {
            alert('请输入司机');
            return;
        }
        if (logphone == '') {
            alert('请输入司机联系电话');
            return;
        }
        if (delatime == '') {
            alert('请输入发货时间');
            return;
        }

        $.ajax({
            type: 'post',
            url: '/web/order/manage/logistics',
            data: {
                id: oid,
                logistics: logistics,
                iphone: iphone,
                driver: driver,
                logphone: logphone,
                delatime: delatime
            },
            dataType: 'json',
            success: function (json) {
                console.log(json);
               if(json.code ==  '200'){
                    location.href =  "/order/service.html";
               }else{
                   alertMess("操作失败");
               }
            }
        });
    }


    function selectTech() {
        $('#couponDetail').addClass("hide")
        $('#user-content').removeClass("hide")
        init(function (json) {
            appendData(json);
        });
    }

    var page = 0;
    var pageSize = 4;
    var ajaxFlag = true;
    $(".search-input").on("input", "input[type='text']", function () {
        ajaxFlag = true;
        page = 0;
        init(function (json) {
            var htm = createHtmlNoData();
            if (json.obj.numberOfElements > 0) {
                htm = createHtml(json);
                $('.ui-loader').hide();
            } else {
                ajaxFlag = false;
            }
            $('.member-nav').html(htm);
        });
    });

    function appendData(json) {
        var htm = createHtmlNoData();
        if (json.obj.numberOfElements > 0) {
            page++;
            htm = createHtml(json);
            $('.ui-loader').hide();
        } else {
            ajaxFlag = false;
        }
        $('.member-nav').append(htm);
    }

    function init(callback) {
        var key = $('#key').val();
        if (!ajaxFlag) {
            return;
        }
        $.ajax({
            type: 'get',
            url: '/web/user/list/server',
            data: {
                key: key,
                page: page,
                pageSize: pageSize
            },
            dataType: 'json',
            success: function (json) {
                console.log(json);
                callback(json)
            }
        });
    }

    function createHtml(json) {
        var html = "";
        var array = json.obj.content;
        for (var i in array) {
            var data = array[i];
            html += "<li>";
            html += "<span>" + data.name + "&nbsp;" + data.dept + "&nbsp; 电话：" + data.phone + "</span>";
            html += "<input style='float: right;right:20px;margin-top: 15px;' type='checkbox' name='user_ids' value='" + data.id + "' />";
            html += "</li>";
        }
        return html;
    }

    function createHtmlNoData() {
//        return "<div>没有数据了</div>";
        return "";
    }


    function splitOrder() {

        var orderid = ${data.id};
        var uids = "";
        $("input[name='user_ids']").each(function () {
            if ($(this).is(":checked")) {
                uids += $(this).val() + ",";
            }
        })
        console.log(">> uids :: " + uids);
        if(uids == ""){
            alertMess('请选择服务人员进行派工');
            return false;
        }
        $.ajax({
            url: '/web/order/manage/split',
            type: 'get',
            data: {
                id: orderid,
                uids: uids
            },
            success: function (json) {
                if (json.code == '200') {
                    alertMess('派工成功');
                    location.href = "/order/service.html";
                } else {
                    alertMess(json.msg+'，请重新提交');
                }
            }
        });

        return true;
    }

</script>

</html>
