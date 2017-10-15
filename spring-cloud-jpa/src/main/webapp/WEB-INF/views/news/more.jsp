<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>公司动态</title>
    <meta name="description" content="正大海工"/>
    <meta name="keywords" content="正大海工"/>
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <link rel="stylesheet" href="/css/amazeui.min.css"/>
    <link rel="stylesheet" href="/css/style.css"/>
    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <script type="text/javascript" src="/js/amazeui.min.js"></script>
    <script type="text/javascript" src="/mobile/jquery.mobile-1.4.5.min.js"></script>
    <style>
        .ui-loader h1{
            font-size: 12px;
            text-align: center;
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
    <h1 class="am-header-title"><a href="javascript:void(0)" class="" style="color: #333;">公司动态</a></h1>
    <div class="am-header-right am-header-nav">
        <a href="#right-link" class=""> </a>
    </div>
</header>

<div data-am-widget="intro" id="maintain-gallery" class="am-intro am-cf am-intro-default" style="margin-left:10px;margin-top: 50px;">


</div>


</body>


<script type="text/javascript">

    var page = 0;
    var pageSize = 10;
    var ajaxFlag = true;

    init();

    $(document).on("scrollstart", function () {
        init();
    });

    function init() {
        if(!ajaxFlag){
            return;
        }
        $.ajax({
            type: 'post',
            url: '/web/news/list',
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
                }else{
                    ajaxFlag = false;
                }
                $('#maintain-gallery').append(htm);
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
            html += "<div class='am-g am-intro-bd'>";
            html += "<a target='_top' href='/web/news/detail/"+data.id+"'>";
            html += " <div class='am-intro-right am-u-sm-9'>";
            html += "<h2>"+data.title+"</h2>";
            html += "<p>"+data.desc+"...</p>";
            html += "<div class='text' style=' margin-right:20px;'>";
            html += "<span class='fl'>"+data.time+"</span>";
            html += "<span style='float:right; margin-right:10px;'>查看详情</span>";
            html += "</div>";
            html += "</div>";
            html += "</a>";
            html += "</div>";
        }
        html += "</ul>";
        return html;
    }


</script>

</html>
