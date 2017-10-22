<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>上传技术方案</title>
    <meta name="description" content="上传技术方案"/>
    <meta name="keywords" content="上传技术方案"/>
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <link rel="stylesheet" href="/css/amazeui.min.css"/>
    <link rel="stylesheet" href="/css/style.css"/>
    <link rel="stylesheet" href="/css/ssi-uploader.min.css"/>
    <style type="text/css">
        #ssi-uploadBtn {

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
    <h1 class="am-header-title"><a href="#title-link" class="" style="color: #333;">上传技术方案</a></h1>
    <div class="am-header-right am-header-nav">
        <a href="#right-link" class=""> </a>
    </div>
</header>


<div class="am-tabs qiehuan" data-am-tabs style="margin-top:50px; ">
    <div class="am-tabs-bd">
        <div class="am-tab-panel am-fade am-in am-active" id="tab1">
            <input type="text" placeholder="标题" id="title" name="title" class="tab-input"/>
            <textarea placeholder="填写设备的故障与解决方案 " id="content" name="content" class="tab-input"
                      style="height:300px;"></textarea>

            <input type="file" class="span6" id="tick_img" multiple
                   name="tick_img" placeholder="上传图片"/>

            <br><br>
            <button type="button" onclick="addCase()" class="tab-btn">确认</button>


        </div>


    </div>
</div>

<script type="text/javascript" src="/js/jquery.min.js"></script>
<script type="text/javascript" src="/js/amazeui.min.js"></script>
<link type="text/css" rel="stylesheet" href="/mobile/zdialog.css"/>
<script type="text/javascript" src="/mobile/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="/mobile/zdialog.js"></script>
<script type="text/javascript" src="/js/alert.js?v=1.0"></script>
<script type="text/javascript" src="/js/ssi-uploader.min.js"></script>
<script type="text/javascript">

    var caseid = "<%=uuid%>";

    $(document).ready(function () {
        $('#tick_img').ssi_uploader({
            url: '/web/case/image',
            data: {
                id: caseid
            },
            preview: true,
            maxNumberOfFiles: 10,
            allowed: ['jpg', 'gif', 'png'],
        });

        $('.ssi-InputLabel button').text("上传图片");
        $('#ssi-DropZoneBack').text("");

    });


    function addCase() {
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
//        $.ajax({
//            url: '/web/case/add',
//            type: 'POST',
//            data: {
//                title: title,
//                content: content,
//            },
//            success: function (json) {
//                if (json.code == '200') {
//                    console.log(json)
//                    caseid = json.obj.id;
//                    uploadImg();
//
//                } else {
//                    alertMess(json.msg);
//                }
//            }
//        });


        var formData = new FormData();
        formData.append("file", $("#tick_img")[0].files[0]);
        formData.append("title", title);
        formData.append("content", content);
        $.ajax({
            url: '/web/case/image',
            type: 'POST',
            data: formData,
            //不去处理发送的数据
            processData: false,
            //不去设置Content-Type请求头
            contentType: false,
            beforeSend: function () {
                console.log("正在进行，请稍候");
            },
            success: function (responseStr) {
                if (responseStr.code == '200') {
                    console.log("成功" + responseStr);
                } else {
                    console.log("失败");
                }
            },
            error: function (responseStr) {
                console.log("error");
            }
        });

        return true;
    }

    function uploadImg() {
        $('#ssi-uploadBtn').click();
    }

</script>
</body>

</html>

