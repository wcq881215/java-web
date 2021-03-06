<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        <p class="name">时间：2017-08-20</p>
        <h2 class="sub-title"> 订单编号：${data.id}</h2>
        <h2 class="sub-title">订单状态：生产完成等待安装</h2>
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
        <li class="" style="width: 95%;"><a href="javascript:addWuliu(${data.id})" class="current">发货</a></li>
        <li class="hide" style="width: 40%;"><a href="javascript:refuse(${data.id})">退回</a></li>
    </ul>

</div>

<div class="am-tabs qiehuan wuliu" data-am-tabs style="margin-top:70px;display: none;">

    <li>物流信息
        <input type="text" name="logistics" id="logistics" placeholder="物流公司" class="tab-input"/>
        <input type="text" name="iphone" id="iphone" placeholder="联系电话" class="tab-input"/>
        <input type="text" name="driver" id="driver" placeholder="司机" class="tab-input"/></li>
    <input type="text" name="logphone" id="logphone" placeholder="联系电话" class="tab-input"/>
    <input type="date" name="delatime" id="delatime" placeholder="发货时间" class="tab-input"/>

    <div class="h50"></div>
    <ul class="fixed-btn">
        <li class="" style="width: 95%;"><a href="javascript:submitWuliu(${data.id})" class="current">提交</a></li>
    </ul>

</div>


</body>
<script type="text/javascript">

    function addWuliu(id) {
        $('.zShow').hide();
        $('.wuliu').show();
    }

    function submitWuliu(id) {
        var logistics = $('#logistics').val();
        var iphone = $('#iphone').val();
        var driver = $('#driver').val();
        var logphone = $('#logphone').val();
        var delatime = $('#delatime').val();
        if (logistics == '请输入物流公司') {
            alert('');
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
            url: '/web/order/manage/wuliu/${data.id}',
            data: {
                logistics: logistics,
                iphone: iphone,
                driver: driver,
                logphone: logphone,
                delatime: delatime
            },
            dataType: 'json',
            success: function (json) {
                console.log(json);
                if (json.code == '200') {
                    alertMess("操作成功")
                    location.href = "/order/service_ing.html";
                } else {
                    alertMess("操作失败")
                }
            }
        });
    }


    function accept(id) {
        $.ajax({
            type: 'post',
            url: '/web/order/srv/accept/${data.id}',
            data: {},
            dataType: 'json',
            success: function (json) {
                console.log(json);
                if (json.code == '200') {
                    alertMess("操作成功")
                    location.href = "/order/service.html";
                } else {
                    alertMess("操作失败")
                }
            }
        });
    }

    function refuse(id) {
        $.ajax({
            type: 'get',
            url: '/web/order/service/refuse/${data.id}',
            data: {},
            dataType: 'json',
            success: function (json) {
                console.log(json);
                if (json.code == '200') {
                    alertMess("操作成功");
                    location.href = "/order/service_ing.html";
                } else {
                    alertMess("操作失败")
                }
            }
        });
    }

</script>

</html>
