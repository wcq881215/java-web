<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>问题汇总</title>
    <meta name="description" content="正大海工"/>
    <meta name="keywords" content="正大海工"/>
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <link rel="stylesheet" href="/css/amazeui.min.css"/>
    <link rel="stylesheet" href="/css/style.css"/>
    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <script type="text/javascript" src="/mobile/jquery.mobile-1.4.5.min.js"></script>
    <style>
        .ui-loader h1 {
            font-size: 12px;
            text-align: center;
        }
    </style>
</head>
<body>
<header data-am-widget="header" class="am-header am-header-default header"
        style="width:100%;position:fixed; z-index:1000;top:0;left:0;">
    <div class="am-header-left am-header-nav">
        <a href="#left-link" class="">
            <i class="am-header-icon am-icon-angle-left"></i>
        </a>
    </div>
    <h1 class="am-header-title"><a href="#title-link" class="" style="color: #333;">问题汇总</a></h1>
    <div class="am-header-right am-header-nav">
        <a href="#right-link" class=""> </a>
    </div>
</header>


<div class="cate-search" style="position: relative; top: 0; border-bottom: 0; margin-top:50px;">
    <input type="text" class="cate-input" id="key" placeholder="输入关键词进行搜索">
    <input type="button" class="cate-btn">
</div>
<div align="center">
    <select style="width:150px;  " id="period">
        <option value="">按时间筛选</option>
        <option value="week">一周</option>
        <option value="three">三月</option>
        <option value="half">半年</option>
        <option value="year">一年</option>
    </select>
    <select style="width:150px" id="type">
        <option value="1">类别筛选</option>
        <option value="2">配件</option>
        <option value="3">系统</option>
        <option value="3">硬件</option>

    </select>

    <select style="width:150px" id="sort">
        <option value="">排序方式</option>
        <option value="time">按时间</option>
        <option value="time">类型</option>
    </select>
</div>

<div id="data-gallery">


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
        var htm = createHtmlNoData();
        if (!ajaxFlag) {
            $('#data-gallery').append(htm);
            return;
        }
        var period = $('#period').val();
        var key = $('#key').val();
        var type = $('#type').val();
        var sort = $('#sort').val();
        $.ajax({
            type: 'get',
            url: '/web/case/list',
            data: {
                period: period,
                key: key,
                type: type,
                sort: sort,
                page: page,
                pageSize: pageSize
            },
            dataType: 'json',
            success: function (json) {
                console.log(json);

                if (json.code == "200") {
                    page++;
                    htm = createHtml(json);

                    if (json.obj.last) {
                        ajaxFlag = false;
                    }
                    $('.ui-loader').hide();
                }
                $('#data-gallery').append(htm);
            }
        });
    }

    function createHtmlNoData() {
        return "<div>没有数据了</div>";
    }

    function createHtml(json) {
        var html = "";
        var array = json.obj.data;
        for (var i in array) {
            var data = array[i];
            html += "<div class='c-comment-list' style='border: 0;'>";
            html += " <a class='o-con' href='/web/case/detail/"+data.id+"'>";
            html += " <div class='o-con-txt'>";
            html += "<p>" + data.title + "</p>";
            html += "</div>";
            html += "</a>";
            html += "</div>";
            html += "<div class='c-com-btn'>";
            html += "<a href='/web/case/detail/"+data.id+"'>查看详情</a>";
            html += "</div>";
            html += "<div class='clear'></div>";
        }

        return html;
    }


</script>

</html>
