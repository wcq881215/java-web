<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>订单查询</title>
    <meta name="description" content="正大海工"/>
    <meta name="keywords" content="正大海工"/>
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <link rel="stylesheet" href="/css/amazeui.min.css"/>
    <link rel="stylesheet" href="/css/style.css"/>
    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <script type="text/javascript" src="/js/amazeui.min.js"></script>
    <script type="text/javascript" src="/mobile/jquery.mobile-1.4.5.min.js"></script>
    <style type="text/css">
        .order-style li {
            width: 30%;
        }

    </style>
</head>
<body>


<header data-am-widget="header" class="am-header am-header-default header"
        style="width:100%;position:fixed; z-index:1000;top:0;left:0;">
    <div class="am-header-left am-header-nav">
        <a href="javascript:history.go(-1)" class="">
            <i class="am-header-icon am-icon-angle-left"></i>
        </a>
    </div>
    <h1 class="am-header-title"><a href="#title-link" class="" style="color: #333;">订单查询</a></h1>
    <div class="am-header-right am-header-nav">
        <a href="#right-link" class=""> </a>
    </div>
</header>

<ul class="order-style" style="margin-top:50px;">
    <li class="current"><a href="javascript:queryOrder(0)">安装订单</a></li>
    <li><a href="javascript:queryOrder(1)">维修订单</a></li>
</ul>


<div id="data-gallery" style="margin-top: 50px;">


</div>


</body>

<script type="text/javascript">

    var page = 0;
    var pageSize = 4;
    var ajaxFlag = true;
    var flag = 0;

    $(document).ready(function () {
        $('ul.order-style li').click(function () {
            clearLi();
            $(this).addClass("current");
        });
    })

    function clearLi() {
        $('ul.order-style li').each(function () {
            $(this).removeClass("current");
        });
    }

    function queryOrder(type) {
        if (flag != type) {
            ajaxFlag = true;
            page = 0;
            $('#data-gallery').html('');
        }
        flag = type;
        query();
    }

    query();

    $(document).on("scrollstart", function () {
        query();
    });

    function query() {
        if (!ajaxFlag) {
            return;
        }
        if (flag == 0) {
            queryInstallOrder();
        } else {
            queryFixOrder();
        }
    }

    function queryInstallOrder() {
        $.ajax({
            type: 'post',
            url: '/web/order/srv/select',
            data: {
                page: page,
                pageSize: pageSize
            },
            dataType: 'json',
            success: function (json) {
                console.log(json);
                var htm = createHtmlNoData();
                if (json.obj.numberOfElements > 0) {
                    page++;
                    htm = createHtml(json);
                    $('.ui-loader').hide();
                } else {
                    ajaxFlag = false;
                }
                $('#data-gallery').append(htm);
            }
        });
    }

    function queryFixOrder() {
        $.ajax({
            type: 'post',
            url: '/web/order/srv/fix/select',
            data: {
                page: page,
                pageSize: pageSize
            },
            dataType: 'json',
            success: function (json) {
                console.log(json);
                var htm = createHtmlNoData();
                if (json.obj.numberOfElements > 0) {
                    page++;
                    htm = createFixHtml(json);
                    $('.ui-loader').hide();
                } else {
                    ajaxFlag = false;
                }
                $('#data-gallery').append(htm);
            }
        });
    }

    function createHtmlNoData() {
        return "<div style='text-align: center;'>没有数据了</div>";
    }

    function createHtml(json) {
        var html = "";
        var array = json.obj.content;
        for (var i in array) {
            var data = array[i];
            var stateMsg = '待接受派工';
            html += "<div class='c-comment'>";
            html += "<span class='c-comment-num'>订单编号：" + data.id + "</span>";
            html += "<span class='c-comment-suc'>" + stateMsg + "</span>";
            html += "</div>";
            html += "<div class='c-comment-list' style='border: 0;'>";
            html += "<a class='o-con' target='_top' href='/web/order/srv/detail/" + data.id + "'>";

            var total = 0;
            if (data.devices && data.devices.length > 0) {
                for (var j = 0; j < data.devices.length; j++) {
                    var devi = data.devices[j];
                    total += devi.numb;

                    html += "<div class='o-con-txt'>";
                    html += "<p>" + devi.device.name + "</p>";
                    html += "</div>";

                    html += "<div class='o-con-much'> <h4>" + devi.numb + "台</h4></div>";
                }

            } else {
                html += "<p></p>";
            }


            html += "</a>";
            html += "<div class='c-com-money '>合计：<span>" + total + "台设备</span></div>";
            html += "</div>";
            html += "<div class='clear'></div>";
        }
        return html;
    }

    function createFixHtml(json) {
        var html = "";
        var array = json.obj.content;
        for (var i in array) {
            var data = array[i];
            var stateMsg = '待接受派工';
            html += "<div class='c-comment'>";
            html += "<span class='c-comment-num'>订单编号：" + data.id + "</span>";
            html += "<span class='c-comment-suc'>" + stateMsg + "</span>";
            html += "</div>";
            html += "<div class='c-comment-list' style='border: 0;'>";
            html += "<a class='o-con' target='_top' href='/web/order/srv/detail/fix/" + data.id + "'>";
            html += "<div class='o-con-txt'>";
            html += "<p>" + data.ext+ "</p>";
            html += "</div>";
            html += "</a>";
            html += "</div>";
            html += "<div class='clear'></div>";
        }
        return html;
    }


</script>


</html>
