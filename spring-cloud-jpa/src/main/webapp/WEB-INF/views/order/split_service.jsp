<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>服务派工</title>
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
    <h1 class="am-header-title"><a href="#title-link" class="" style="color: #333;">服务派工</a></h1>
    <div class="am-header-right am-header-nav">
        <a href="#right-link" class=""> </a>
    </div>
</header>
<div class="page zShow" id="couponDetail" refresh="0" style=" margin-top:120px;">
    <div class="coupon-wrap">
        <img src="/images/default_photo.png" alt="logo" class="logo">
        <p class="name">时间：2017-08-20</p>
        <h2 class="sub-title"> 订单编号：${data.id}</h2>
        <h2 class="sub-title">订单状态：生产待发货</h2>
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
        <li class="" style="width: 40%;"><a href="javascript:selectTech()" class="current">派工</a></li>
        <li class="" style="width: 40%;"><a href="javascript:refuse(${data.id})">退回</a></li>
    </ul>

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

    $(document).on("scrollstart", function () {
        init(function (json) {
            appendData(json);
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
            url: '/web/user/list/inner',
            data: {
                type :'技术员',
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

    function createHtmlNoData() {
//        return "<div>没有数据了</div>";
        return "";
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


        function refuse(id) {
        $.ajax({
            type: 'get',
            url: '/web/order/service/refuse/${data.id}',
            data: { },
            dataType: 'json',
            success: function (json) {
                console.log(json);
                if (json.code =='200') {
                    alertMess("操作成功");
                    location.href = "/order/service_split.html";
                } else {
                    alertMess("操作失败")
                }
            }
        });
    }

    function splitOrder() {

        var orderid = ${data.id};
        var uids = "";
        $("input[name='user_ids']").each(function () {
            if ($(this.checked)) {
                uids += $(this).val() + ",";
            }
        })
        console.log(">> uids :: " + uids);
        if(uids == ""){
            alertMess('请选择技术人员进行派工');
            return false;
        }
        $.ajax({
            url: '/web/order/srv/split',
            type: 'get',
            data: {
                id: orderid,
                uids: uids
            },
            success: function (json) {
                if (json.code == '200') {
                    alertMess('派工成功');
                    location.href = "/order/service_split.html";
                } else {
                    alertMess('发送成功');
                }
            }
        });

        return true;
    }

</script>

</html>
