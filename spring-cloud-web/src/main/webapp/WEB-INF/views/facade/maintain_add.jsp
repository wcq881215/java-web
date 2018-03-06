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
                    <h1 class="page-head-line">养护指南</h1>

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
                                 <textarea placeholder="养护指南" id="content" name="content" class="tab-input"
                                           style="height:300px;"></textarea>
                            </div>

                            <div class="form-group">
                                <input type="button" class="btn btn-success" onclick="submitAdv()" value="确认提交" />
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
    function submitAdv() {
        var title = $('#title').val();
        var content = $('#content').val();
        if (title == '') {
            alertMess("请输入标题");
            return;
        }
        if (content == '') {
            alertMess("请输入内容");
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
                    alertMsg('提交成功');
                    location.href = "/facade/maintain.html";
                    return;
                } else {
                    alertMess(json.msg);
                    return
                }
            }
        });
    }

</script>

</html>
