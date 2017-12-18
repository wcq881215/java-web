<%@ page language="Java" import="java.util.*" pageEncoding="utf-8" %>
<% String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
    String error = (String) request.getAttribute("error0");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/ssi-uploader.min.css"/>
    <script src="${pageContext.request.contextPath}/js/jquery.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/ssi-uploader.min.js"></script>
</head>
<body>
<!--右半部分-->
<div class="right">
    <!--头部导航栏-->
    <div class="right_top">
        <p id="location">位置>图片上传</p>
        <a href="${pageContext.request.contextPath}/admin/exit"><p id="exit">退出</p></a>
    </div>
    <!--右部主要内容-->
    <div class="right_main">
        <!--图片上传-->
        <div class="row">
            <div class="col-md-12">
                <h3>图片上传：</h3>
                <input type="file" multiple id="ssi-upload3"/>
                <input type="hidden" id="albumId" value="${param.id }"/>
            </div>
        </div>
        <script type="text/javascript">

            var num = document.getElementById("albumId").value;

            //下一行的url即为你后台所走的action路径
            $('#ssi-upload3').ssi_uploader({
                url: '${pageContext.request.contextPath}/admin/uploader?albumId=' + num,
                dropZone: false,
                allowed: ['jpg', 'gif', 'txt', 'png', 'pdf']
            });
        </script>
    </div>
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript">
        $(".menu dt").css({"background-color": "#404040"});
        $(".menu dt img").attr("src", "images/left/select_xl01.png");
        $(function () {
            $(".menu dd").hide();
            $(".menu dt").click(function () {
                $(".menu dt").css({"background-color": "#404040"})
                $(this).css({"background-color": "#FF5258"});
                $(this).parent().find('dd').removeClass("menu_chioce");
                $(".menu dt img").attr("src", "images/left/select_xl01.png");
                $(this).parent().find('img').attr("src", "images/left/select_xl.png");
                $(".menu_chioce").slideUp();
                $(this).parent().find('dd').slideToggle();
                $(this).parent().find('dd').addClass("menu_chioce");
            });
        })
    </script>
</body>

</html>