<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>意向订单查询</title>
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
        .c-com-money span.del{
            background-color: #ff0000;
            padding: 3px 10px;
            border-radius: 3px;
            color: #fff;
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
    <h1 class="am-header-title"><a href="#title-link" class="" style="color: #333;">意向订单查询</a></h1>
    <div class="am-header-right am-header-nav">
        <a href="#right-link" class=""> </a>
    </div>
</header>


<div id="data-gallery" style="margin-top: 50px">


</div>


</body>

<script type="text/javascript">

    var page = 0;
    var pageSize = 4;
    var ajaxFlag = true;


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
            url: '/customer/purchar/list',
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

    function createHtmlNoData() {
        return "<div style='text-align: center;'>没有数据了</div>";
    }

    function createHtml(json) {
        var html = "";
        var array = json.obj.content;
        for (var i in array) {
            var data = array[i];

            html += "<div class='c-comment'>";
            html += "<span class='c-comment-num'>订单编号：" + data.id + "</span>";
            html += "</div>";
            html += "<div class='c-comment-list' style='border: 0;'>";
            html += "<a target='_top' class='o-con' href='/customer/purchar/detail/"+data.id+"' >";
            html += "<div class='o-con-txt'>";
            html += "<p>" + data.type + "</p>";
            html += "</div>";
            html += "<div class='o-con-much'> <h4>" + data.number + "台</h4></div>";
            html += "</a>";
            html += "</div>";
            html += "<div class='clear'></div>";
        }
        return html;
    }


</script>


</html>
