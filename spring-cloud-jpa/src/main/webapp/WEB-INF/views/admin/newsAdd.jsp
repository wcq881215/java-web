<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>公司动态</title>
    <meta name="description" content="公司动态"/>
    <meta name="keywords" content="公司动态"/>
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
    <h1 class="am-header-title"><a href="#title-link" class="" style="color: #333;">公司动态</a></h1>
    <div class="am-header-right am-header-nav">
        <a href="#right-link" class=""> </a>
    </div>
</header>


<div class="am-tabs qiehuan" data-am-tabs style="margin-top:50px; ">
    <div class="am-tabs-bd">
        <div class="am-tab-panel am-fade am-in am-active" id="tab1">
            <input type="text" placeholder="标题" id="title" name="title" class="tab-input"/>
            <textarea placeholder="发布公司动态内容 " id="content" name="content" class="tab-input"
                      style="height:300px;"></textarea>


            <div class="img-space"
                 style=" background:#f2f2f2; border-color:#939393; height:auto; width:100%; margin-bottom:20px;z-index:-1000">
                <a href="javascript:void(0)" class="file">
                    <input type="file" name="file" id="select_file">
                    <img src="/images/img.png" onclick="">
                </a>

            </div>

            <br><br>
            <button type="button" onclick="addNews()" class="tab-btn">确认</button>

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

    $(".file").on("change", "input[type='file']", function () {
        var file = this.files[0];
        if (file) {
            var reader = new FileReader();
            reader.onload = function (event) {
                var txt = event.target.result;
                var img = document.createElement("img");
                img.src = txt;
                img.alt = file.name;
                img.title = file.type;
                $('.img-space').append(img);
            };
        }
        reader.readAsDataURL(file);
    });

</script>

<script type="text/javascript">

    function addNews() {
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


        $.ajax({
            url: '/web/news/add',
            type: 'POST',
            data: {
                title: title,
                content: content
            },
            success: function (json) {
                if (json.code == '200') {
                    var cid = json.obj.id;
                    var img = "";
                    var fname = "";
                    var type = "";
                    $('.img-space > img').each(function () {
                        img += $(this).attr("src") + "##@##";
                        fname += $(this).attr("alt") + "##@##";
                        type += $(this).attr("title") + "##@##";
                    });

                    $.ajax({
                        url: '/web/news/image',
                        type: 'POST',
                        data: {
                            cid: cid,
                            img: img,
                            type: type,
                            alt: fname
                        }, success: function (json) {
                            console.log("upload " + fname + " image ");
                            alertMess("上传成功");
                            location.href = "/${sessionScope.role}/work"
                        }
                    });

                } else {
                    alertMess(json.msg);
                }
            }
        });

        return true;
    }


</script>
</body>

</html>

