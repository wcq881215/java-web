<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>消息</title>
    <meta name="description" content="消息"/>
    <meta name="keywords" content="消息"/>
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <link rel="stylesheet" href="/css/amazeui.min.css"/>
    <link rel="stylesheet" href="/css/style.css"/>
    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <script type="text/javascript" src="/js/amazeui.min.js"></script>
    <script type="text/javascript" src="/mobile/jquery.mobile-1.4.5.min.js"></script>


</head>
<body>
<header data-am-widget="header" class="am-header am-header-default header"
        style="width:100%;position:fixed; z-index:1000;top:0;left:0;">
    <div class="am-header-left am-header-nav">
        <a href="javascript:back()" class="">
            <i class="am-header-icon am-icon-angle-left"></i>
        </a>
    </div>
    <h1 class="am-header-title"><a href="#title-link" class="" style="color: #333;">消息</a></h1>
    <div class="am-header-right am-header-nav">
        <a href="#right-link" class=""> </a>
    </div>
</header>

<div>
    <ul class="address-list" id="data-gallery" style="margin-top:70px; ">


    </ul>
</div>

<div id="detail_page">


</div>


</body>


<script type="text/javascript">

    var page = 0;
    var pageSize = 4;
    var ajaxFlag = true;

    init();

    $(document).on("scrollstart", function () {
        init();
    });

    function init() {
        var htm = createHtmlNoData();
        if (!ajaxFlag) {
//            $('#data-gallery').append(htm);
            return;
        }
        var period = $('#period').val();
        var key = $('#key').val();
        var type = $('#type').val();
        var sort = $('#sort').val();
        $.ajax({
            type: 'get',
            url: '/web/msg/my',
            data: {
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
            var color = '#fff'; //已读 深色
            if(data.state == false){//未读 浅色
                color = '#8695ab';
            }
            html += "<li style='background-color: "+color+ "'>";
            html += "<p>来源：&nbsp;&nbsp;" + data.user.role + " - " + data.user.name + " </p>";
            html += "<p class='order-add1'>" + data.title + "</p>";
            html += "<hr>";
            html += "<div class='address-cz'>";
            html += "<label class=' am-warning'>" + data.time + "</label>";
            html += "<a target='_top' class='' href='javascript:showdetail(" + data.id + ")'>查看详情</a>";
            html += "<a target='_top' class='hide' href=''>删除</a>";
            html += "</div>";
            html += "</li>";
        }

        return html;
    }

    $("ul#data-gallery  li").click(function () {
        console.log($(this) + "click");
        $(this).css('background-color','#fff');
    });

    function showdetail(id) {
        $.ajax({
            type: 'get',
            url: '/web/msg/detail/'+id,
            data: { },
            dataType: 'html',
            success: function (html) {
                $('#data-gallery').addClass('hide');
                $('#detail_page').html(html);
                $('#detail_page').removeClass('hide')
            }
        });
    }

    function back() {
        if($('#data-gallery').hasClass('hide')){
            $('#data-gallery').removeClass('hide');
            $('#detail_page').addClass('hide');
        }else {
            history.go(-1);
        }
    }
</script>


</html>
