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


<div class="cate-search" style="display:none;position: relative; top: 0; border-bottom: 0; margin-top:50px;">
    <input type="text" class="cate-input" placeholder="输入设备名称或订单编号查询">
    <input type="button" class="cate-btn">
</div>
<ul class="order-style" style="margin-top:50px;">
    <li class="current"><a href="javascript:queryOrder(-1)">全部</a></li>
    <li><a href="javascript:queryOrder(2)">未发货</a></li>
    <li><a href="javascript:queryOrder(3)">发货待安装</a></li>

</ul>

<div id="data-gallery">


</div>


</body>

<script type="text/javascript">

    var status = "-1"; //-1 全部 2待发货 3已发货
    var page = 0;
    var pageSize = 4;
    var ajaxFlag = true;
    var chage = true;


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

    function queryOrder(state) {
        page = 0;
        status = state;
        ajaxFlag = true;
        chage = true;
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
        $.ajax({
            type: 'post',
            url: '/web/order/status/' + status,
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
                if (chage) {
                    $('#data-gallery').html(htm);
                    chage = false;
                } else {
                    $('#data-gallery').append(htm);
                }
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
            var stateMsg = "--";
            //1:内勤录入等待发货，2已发货待安装 3安装完成等待客户确认 4 已完成
            if (data.state == '1') {
                stateMsg = "等待生产";
            }
            if (data.state == '2') {
                stateMsg = "已生产待发货";
            }
            if (data.state == '3') {
                stateMsg = "已发货待安装";
            }
            if (data.state == '4') {
                stateMsg = "安装完成";
            }
            if (data.state == '5') {
                stateMsg = "已完成";
            }

            html += "<div class='c-comment'>";
            html += "<span class='c-comment-num'>订单编号：" + data.id + "</span>";
            html += "<span class='c-comment-suc'>" + data.state  + "</span>";
            html += "</div>";
            html += "<div class='c-comment-list' style='border: 0;'>";
            html += "<a class='o-con' target='_top' href='/web/order/office/detail/"+data.id+"'>";
            html += "<div class='o-con-txt'>";
            html += "<p>" + data.device + "</p>";
            html += "</div>";
            html += "<div class='o-con-much'> <h4>" + data.number + "台</h4></div>";
            html += "</a>";
            html += "<div class='c-com-money hide'>合计：<span>" + data.number + "台设备</span></div>";
            html += "</div>";
            html += "<div class='clear'></div>";
        }
        return html;
    }


</script>


</html>
