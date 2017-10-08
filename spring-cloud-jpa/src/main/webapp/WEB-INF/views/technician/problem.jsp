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
    <input type="text" class="cate-input" placeholder="输入关键词进行搜索">
    <input type="button" class="cate-btn">
</div>
<div align="center">
    <select style="width:150px;  " id="period">
        <option value="1">按时间筛选</option>
        <option value="2">一周</option>
        <option value="3">三月</option>
        <option value="3">半年</option>
        <option value="3">一年</option>
    </select>
    <select style="width:150px">
        <option value="1">类别筛选</option>
        <option value="2">配件</option>
        <option value="3">系统</option>
        <option value="3">硬件</option>

    </select>

    <select style="width:150px">
        <option value="1">排序方式</option>
        <option value="2">按时间</option>
        <option value="3">类型</option>
    </select>
</div>

<div id="data-gallery">

    <div class="c-comment-list" style="border: 0;">
        <a class="o-con" href="">
            <div class="o-con-txt">
                <p>问题标题问题标题问题标题问题标题问题标题</p>
            </div>
        </a>

    </div>
    <div class="c-com-btn">
        <a href="">查看详情</a>

    </div>
    <div class="clear"></div>

    <div class="c-comment-list" style="border: 0;">
        <a class="o-con" href="">
            <div class="o-con-txt">
                <p>问题标题问题标题问题标题问题标题问题标题</p>
            </div>
        </a>

    </div>
    <div class="c-com-btn">
        <a href="">查看详情</a>

    </div>
    <div class="clear"></div>

    <div class="c-comment-list" style="border: 0;">
        <a class="o-con" href="">
            <div class="o-con-txt">
                <p>问题标题问题标题问题标题问题标题问题标题</p>
            </div>
        </a>

    </div>
    <div class="c-com-btn">
        <a href="">查看详情</a>

    </div>
    <div class="clear"></div>

    <div class="c-comment-list" style="border: 0;">
        <a class="o-con" href="">
            <div class="o-con-txt">
                <p>问题标题问题标题问题标题问题标题问题标题</p>
            </div>
        </a>

    </div>
    <div class="c-com-btn">
        <a href="">查看详情</a>

    </div>
    <div class="clear"></div>
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
        if (!ajaxFlag) {
            return;
        }
        var period = $('#period').val();
        var key = $('#key').val();
        var type = $('#type').val();
        var sort = $('#sort').val();
        $.ajax({
            type: 'post',
            url: '/web/case/list',
            data: {
                period: period,
                key: page,
                type: type,
                sort: sort,
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
                $('#products-gallery').append(htm);
            }
        });
    }

    function createHtmlNoData() {
        return "<div>没有数据了</div>";
    }

    function createHtml(json) {
        var html = "<ul id='products-gallery' class='am-gallery am-avg-sm-2 am-avg-md-3 am-avg-lg-4 am-gallery-default product am-no-layout'>";
        var array = json.obj.content;
        for (var i in array) {
            var data = array[i];
            html += "<li>";
            html += "<div class='am-gallery-item'>";
            html += "<a  target='_top' href='/web/device/detail/" + data.id + "' class=''>";
            html += "<img src='" + data.imgs[0].src + "' alt='" + data.name + "'/>";
            html += "<h3 class='am-gallery-title'>" + data.name + "</h3>";
            html += "<div class='am-gallery-desc'>";
            html += "<em>查看详情</em>";
            html += "</div>";
            html += "</a>";
            html += "</div>";
            html += "</li>";
        }
        html += "</ul>";
        return html;
    }


</script>

</html>
