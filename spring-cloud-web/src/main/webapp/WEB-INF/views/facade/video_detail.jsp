<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    <link rel="stylesheet" href="/mobile/video.css"/>
    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <script src="/js/html5media.js"></script>

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
                    <h1 class="page-head-line">安装视频</h1>

                </div>
            </div>

            <input type="hidden" name="aid" id="aid" value="${data.id}">
            <div class="row" style="padding-bottom: 100px;">
                <div class="col-md-6">
                    <form action="" method="post" onsubmit="">
                        <div id="comments-sec">
                            <div class="form-group  ">
                                <label>标题:</label> <input type="text" name="name" id="name" class="form-control1 ng-invalid ng-invalid-required ng-touched" value="${data.title}" />
                            </div>

                            <div>
                                视频简介<br>
                                 <textarea placeholder="填写视频简介" id="content" name="content" class="tab-input"
                                           style="height:300px;">${data.content}</textarea>
                            </div>

                            <div class="form-group  ">
                                视频播放<br>
                                    <c:if test="${not empty data.videos}" >
                                            <c:forEach items="${data.videos}" var="img">
                                                    <img src="${img.path}" width="100px" height="100px;" />
                                                <div class="" style="text-align: center;">
                                                    <video style="margin: 0px auto;" class="video" width="100%" height="347" controls preload>
                                                        <source src="${img.path}" media="only screen and (min-device-width: 568px)"></source>
                                                        <source src="${img.path}" media="only screen and (max-device-width: 568px)"></source>
                                                        <source src="${img.path}"></source>
                                                    </video>
                                                    <div class="clear"></div>
                                                </div>

                                            </c:forEach>

                                    </c:if>

                            </div>

                            <div class="form-group file ">
                                <label>上传新视频(视频文件（视频格式 mp4，swf）：)</label> <input type="file" name="video" value="" class="form-control1 ng-invalid ng-invalid-required ng-touched" required="required"  />
                                <div class="img-space"
                                     style="">
                                </div>
                            </div>

                            <div class="form-group">
                                <input type="button" class="btn btn-success" onclick="addAttach()" value="确认提交" />
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

    function addAttach() {
        var aid = $('#aid').val();
        var name = $('#name').val();
        var price = $('#price').val();
        var product = $('#product').val();
        var _desc = $('#_desc').val();

        if (name == '') {
            alertMess("请输入配件名称");
            return;
        }
        if (price == '') {
            alertMess("请输入价格");
            return;
        }
        if (product == '') {
            alertMess("请输入所属产品");
            return;
        }



        $.ajax({
            type: "post",
            url: "${pageContext.request.contextPath}/web/attach/update",
            dataType: 'json',
            data: 'name=' + name + '&price=' + price + '&product=' + product +"&desc="+_desc+"&id="+aid,
            success: function (json) {
                if (json.code == '200') {
                    var aid = json.obj.id;
                    var img = "";
                    var fname = "";
                    var type = "";
                    $('.img-space > img').each(function () {
                        img += $(this).attr("src") + "##@##";
                        fname += $(this).attr("alt") + "##@##";
                        type += $(this).attr("title") + "##@##";
                    });

                    $.ajax({
                        url: '/web/attach/image',
                        type: 'POST',
                        data: {
                            aid: aid,
                            img: img,
                            type: type,
                            alt: fname
                        }, success: function (json) {
                            alertMsg("上传成功");
                            location.href = "/facade/attach.html";
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

</html>
