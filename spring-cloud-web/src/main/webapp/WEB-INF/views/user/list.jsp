<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>客户管理</title>
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
        .clear{
            background-color: inherit;
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
    <h1 class="am-header-title"><a href="#title-link" class="" style="color: #333;">客户管理</a></h1>
    <div class="am-header-right am-header-nav">
        <a href="#right-link" class=""> </a>
    </div>
</header>


<div id="data-gallery" style="margin-top: 50px;">


</div>


</body>

<script type="text/javascript">

    var page = 0;
    var pageSize = 4;
    var ajaxFlag = true;

    query();

    $(document).on("scrollstart", function () {
        query();
    });

    function query() {
        if (!ajaxFlag) {
            return;
        }
        $.ajax({
            type: 'get',
            url: '/web/user/cust/list',
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
            html += "<a class='o-con' style='padding: 0px;' target='_top' + href='/web/user/detail/"+data.id+"' >";
            html += "<div class='c-comment'>";
            html += "<span class='c-comment-num'>客户编号：" + data.id + "</span>";
            html += "<span class='c-comment-suc'>姓名/ "+data.name+"</span>";
            html += "</div>";
            html += "<div class='c-comment-list' >";
            html += "</a>";
            html += "</div>";
            html += "<div class='clear'></div>";
        }
        return html;
    }


</script>


</html>
