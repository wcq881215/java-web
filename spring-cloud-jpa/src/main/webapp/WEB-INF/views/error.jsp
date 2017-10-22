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

</body>

<script language="javascript">
    function back() {
        history.go(-1);
    }

   // var message = "${message}";
    var message = "操作有误,请重试";
    if(message == ''){
        message = "操作有误";
    }

    $.DialogByZ.Alert({Title: "提示", Content: message, BtnL: "确定", FunL: back});

</script>

</html>

