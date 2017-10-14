<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>养护指南</title>
    <meta name="description" content="养护指南"/>
    <meta name="keywords" content="养护指南"/>
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <link rel="stylesheet" href="/css/amazeui.min.css"/>
    <link rel="stylesheet" href="/css/style.css"/>
    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <script type="text/javascript" src="/js/amazeui.min.js"></script>
</head>
<body>
<header data-am-widget="header" class="am-header am-header-default header"
        style="width:100%;position:fixed; z-index:1000;top:0;left:0;">
    <div class="am-header-left am-header-nav">
        <a href="javascript:history.go(-1)" class="">
            <i class="am-header-icon am-icon-angle-left"></i>
        </a>
    </div>
    <h1 class="am-header-title"><a href="#title-link" class="" style="color: #333;">养护指南</a></h1>
    <div class="am-header-right am-header-nav">
        <a href="#right-link" class=""> </a>
    </div>
</header>


<div class="am-tabs qiehuan" data-am-tabs style="margin-top:50px; ">

    <div class="am-tabs-bd">
        <div class="am-tab-panel am-fade am-in am-active" id="tab1">
            <input type="text" placeholder="标题" id="title" name="title" class="tab-input"/>
            <textarea id="content" placeholder="养护指南" class="tab-input" style="height:300px;"></textarea>

            <br><br>

            <button type="button" onclick="submitAdv()" class="tab-btn">提交</button>

        </div>

    </div>
</div>

</body>

<script type="text/javascript">
    function submitAdv() {
        var title = $('#title').val();
        var content = $('#content').val();
        if (title == '') {
            alert("请输入标题");
            return;
        }
        if (content == '') {
            alert("请输入内容");
            return;
        }

        $.ajax({
            type: 'post',
            url: '/web/maintain/add',
            data: {
                title: title,
                content: content
            },
            dataType: 'json',
            success: function (json) {
                console.log(json);
                if (json.code == '200') {
                    alert('提交成功');
                    history.go(-1);
                    return;
                } else {
                    alert(json.msg);
                    return
                }
            }
        });
    }


</script>

</html>
