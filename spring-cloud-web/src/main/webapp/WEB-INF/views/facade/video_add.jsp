<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE HTML>
<html>
<head>
    <title>正大海工</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords" content="正大海工"/>
    <script type="application/x-javascript"> addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);
    function hideURLbar() {
        window.scrollTo(0, 1);
    } </script>
    <!-- Bootstrap Core CSS -->
    <link href="/front/css/bootstrap.min.css" rel='stylesheet' type='text/css'/>
    <!-- Custom CSS -->
    <link href="/front/css/style.css" rel='stylesheet' type='text/css'/>
    <!-- Graph CSS -->
    <link href="/front/css/lines.css" rel='stylesheet' type='text/css'/>
    <link href="/front/css/font-awesome.css" rel="stylesheet">
    <link href="/front/css/basic.css" rel="stylesheet" />
    <!-- Nav CSS -->
    <link href="/front/css/custom.css" rel="stylesheet">
    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <script type="text/javascript" src="/mobile/jquery-1.11.2.min.js"></script>
    <script type="text/javascript" src="/front/dialog/alert.js?v=1.0"></script>
    <script type="text/javascript" src="/front/dialog/plug-in.js"></script>

    <style type="text/css">
        .file .img-space img{
            width:  100px;
            height:100px;
        }
    </style>

</head>
<body>
<div id="wrapper">
    <!-- Navigation -->
    <nav class="top1 navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
        <div class="navbar-header">

        </div>
        <!-- /.navbar-header -->
        <%@include file="menu.jsp" %>
        <!-- /.navbar-static-side -->
    </nav>

    <!-- /#page-wrapper -->

    <div id="page-wrapper">
        <div id="page-inner">
            <div class="row">
                <div class="col-md-12">
                    <h1 class="page-head-line">配件库</h1>

                </div>
            </div>

            <div class="row" style="padding-bottom: 100px;">
                <div class="col-md-6">
                    <form action="" method="post" onsubmit="">
                        <div id="comments-sec">
                            <div class="form-group  ">
                                <label>标题:</label> <input type="text" name="title" id="title" class="form-control1 ng-invalid ng-invalid-required ng-touched" value="" />
                            </div>


                            <div>
                                 <textarea placeholder="视频简介" id="_desc" name="_desc" class="tab-input"
                                           style="height:300px;"></textarea>
                            </div>

                            <div class="form-group file ">
                                <label>配件图片</label> <input type="file" name="file" id="select_file1" value="" class="form-control1 ng-invalid ng-invalid-required ng-touched" required="required"  />
                                <div class="img-space"
                                     style="">
                                </div>
                            </div>

                            <div class="form-group">
                                <input type="button" class="btn btn-success" onclick="addCase()" value="确认提交" />
                            </div>
                        </div>
                    </form>
                </div>

            </div>

        </div>

    </div>


    <!-- /#wrapper -->
</div>

</body>


<script type="text/javascript">
    function addCase() {
        var title = $('#title').val();
        var content = $('#content').val();
        if (title == '') {
            alertMess("请输入标题");
            return false;
        }
        if (content == '') {
            alertMess("请输入视频简介");
            return false;
        }

        var formData = new FormData();
        formData.append("file", $("#select_file1")[0].files[0]);
        formData.append("title", title);
        formData.append("content", content);
        $.ajax({
            url: '/web/video/add',
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
                    alertMess('提交成功');
                    console.log("成功" + responseStr);
                    location.href = "/facade/video.html";

                } else {
                    alertMess('提交失败');
                    console.log("失败");
                }
            },
            error: function (responseStr) {
                console.log("error");
            }
        });

        return true;
    }

</script>

</html>
