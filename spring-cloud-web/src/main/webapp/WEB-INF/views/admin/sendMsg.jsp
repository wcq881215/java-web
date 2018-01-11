<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>消息推送</title>
    <meta name="description" content="正大海工"/>
    <meta name="keywords" content="正大海工"/>
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <link rel="stylesheet" href="/css/amazeui.min.css"/>
    <link rel="stylesheet" href="/css/style.css"/>
    <link rel="stylesheet" href="/css/ssi-uploader.min.css"/>
    <style type="text/css">

        .file {
            position: relative;
            display: inline-block;
            border-radius: 4px;
            padding: 0px;
            overflow: hidden;
            color: #1E88C7;
            text-decoration: none;
            text-indent: 0;
            line-height: 20px;
        }

        .file input {
            position: absolute;
            font-size: 100px;
            right: 0;
            top: 0;
            opacity: 0;
        }

        .img-space img {
            width: 80px;
            height: 80px;
        }

        .member-nav {
            padding: 0px;
            padding-left: 15px;
        }

        textarea.tab-input {
            min-height: 300px;
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
    <h1 class="am-header-title"><a href="#title-link" class="" style="color: #333;">消息推送</a></h1>
    <div class="am-header-right am-header-nav">
        <a href="#right-link" class=""> </a>
    </div>
</header>


<div class="am-tabs qiehuan hide" id="user-content" data-am-tabs style="margin-top:50px; ">
    <div class="search-input" style="">
        <input type="text" id="key" name="key" placeholder="输入关键词查找"/>
    </div>

    <ul class="member-nav">

    </ul>
    <br><br>
    <button type="button" onclick="sendMsg()" class="tab-btn">确 定</button>

</div>

<div class="am-tabs qiehuan" id="msg-content" data-am-tabs style="margin-top:50px; ">
    <div class="am-tabs-bd">
        <div class="am-tab-panel am-fade am-in am-active" id="tab1">
            <input type="text" placeholder="标题" id="title" name="title" class="tab-input"/>
            <textarea placeholder="消息内容" id="content" name="content" class="tab-input"
                      style="height:300px;"></textarea>

            <br><br>
            <button type="button" onclick="selectUser()" class="tab-btn">下一步</button>

        </div>


    </div>
</div>

<script type="text/javascript" src="/js/jquery.min.js"></script>
<script type="text/javascript" src="/js/amazeui.min.js"></script>
<link type="text/css" rel="stylesheet" href="/mobile/zdialog.css"/>
<script type="text/javascript" src="/mobile/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="/mobile/zdialog.js"></script>
<script type="text/javascript" src="/js/alert.js?v=1.0"></script>
<script type="text/javascript" src="/mobile/jquery.mobile-1.4.5.min.js"></script>


<script type="text/javascript">

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

    function selectUser() {
        var title = $('#title').val();
        var content = $('#content').val();
        if (title == '') {
            alertMess("请输入标题");
            return false;
        }
        if (content == '') {
            alertMess("请输入内容");
            return false;
        }

        $('#msg-content').addClass("hide");
        $('#user-content').removeClass("hide");

        init(function (json) {
            appendData(json);
        });

    }

    function sendMsg() {
        var title = $('#title').val();
        var content = $('#content').val();
        var uids = "";
        $("input[name='user_ids']").each(function () {
            if ($(this).is(":checked")) {
                uids += $(this).val() + ",";
            }
        })
        console.log(">> uids :: " + uids);
        $.ajax({
            url: '/web/msg/send',
            type: 'get',
            data: {
                title: title,
                content: content,
                uids: uids
            },
            success: function (json) {
                if (json.code == '200') {
                    alertMess('发送成功');
                    location.href = "/${sessionScope.role}/message";
                } else {
                    alertMess('发送成功');
                }
            }
        });

        return true;
    }


</script>
</body>

</html>

