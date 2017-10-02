<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
    <link type="text/css" rel="stylesheet" href="/mobile/reset.css"/>
    <!--弹出层 开始 -->
    <link type="text/css" rel="stylesheet" href="/mobile/zdialog.css"/>
    <script type="text/javascript" src="/mobile/jquery-1.11.2.min.js"></script>
    <script type="text/javascript" src="/mobile/zdialog.js"></script>

    <title>结果页面</title>
    <style type="text/css">

    </style>

</head>
<body>
<div class="mui-content-padded" style="text-align: center;">
    <button id="alertBtn" type="button" class="zbox-btn zbox-btn-blue zbox-btn-outlined">警告消息框</button>
    <button id="confirmBtn" type="button" class="zbox-btn zbox-btn-blue zbox-btn-outlined">确认消息框</button>
    <button id="toastBtn" type="button" class="zbox-btn zbox-btn-blue zbox-btn-outlined">自动消失提示框</button>
    <button id="load" type="button" class="zbox-btn zbox-btn-blue zbox-btn-outlined">加载中</button>
    <div id="info" onclick="$.DialogByZ.Close()">关闭加载</div>
</div>

</body>

<script language="javascript">
    function back() {
        history.go(-1);
    }

    $.DialogByZ.Alert({Title: "提示", Content: "您的请求失败", BtnL: "确定", FunL: back});

    $("#alertBtn").click(function () {
        $.DialogByZ.Alert({Title: "提示", Content: "您的请求失败", BtnL: "确定", FunL: alerts})
    })
    $("#confirmBtn").click(function () {
        $.DialogByZ.Confirm({Title: "", Content: "投资前需开通第三方存管账户</br>确保资金安全", FunL: confirmL, FunR: Immediate})
    })
    $("#toastBtn").click(function () {
        $.DialogByZ.Autofade({Content: "感谢您对我们的支持"})
    })
    $("#load").click(function () {
        $.DialogByZ.Loading('image/loading.png')
    })
    ///
    function confirmL() {
        $.DialogByZ.Close();
        $.DialogByZ.Alert({Title: "提示", Content: "您要求稍后开通", BtnL: "确定"})
    }
    //
    function alerts() {

        $.DialogByZ.Close();
    }
    function Immediate() {
        //location.href="http://www.baidu.com"
        window.open("http://www.baidu.com")
    }


</script>

</html>

