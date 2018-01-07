<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>意向设备</title>
    <meta name="description" content="意向设备"/>
    <meta name="keywords" content="意向设备"/>
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <link rel="stylesheet" href="/css/amazeui.min.css"/>
    <link rel="stylesheet" href="/css/style.css"/>
    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <script type="text/javascript" src="/js/amazeui.min.js"></script>
    <link type="text/css" rel="stylesheet" href="/mobile/zdialog.css"/>
    <script type="text/javascript" src="/mobile/jquery-1.11.2.min.js"></script>
    <script type="text/javascript" src="/mobile/zdialog.js"></script>
    <script type="text/javascript" src="/js/alert.js?v=1.0"></script>

    <style type="text/css">
        input.tab-input  {
            border : 0px;
        }

        textarea.tab-input  {
            border : 0px;
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
    <h1 class="am-header-title"><a href="#title-link" class="" style="color: #333;">意向设备</a></h1>
    <div class="am-header-right am-header-nav">
        <a href="#right-link" class=""> </a>
    </div>
</header>


<div class="am-tabs qiehuan" data-am-tabs style="margin-top:50px; ">

    <div class="am-tabs-bd">
        <div class="am-tab-panel am-fade am-in am-active" id="tab1">


            <li>设备信息
                <input type="text" placeholder="设备名称" readonly  value="设备名称：${data.name}" id="name" name="name" class="tab-input"/>
                <input type="text" placeholder="设备型号" readonly value="设备型号：${data.type}" id="type" name="type" class="tab-input"/>
                <input type="text" placeholder="设备数量" readonly value="设备数量：${data.number}" id="number" name="number" class="tab-input"/>
                <textarea id="remark" name="remark" class="tab-input" style="text-align: left;">备注要求：${data.remark}</textarea>
            </li>

            <br>

            <li>提交用户信息
                <input type="text" readonly  value="用户姓名：${data.pub.name}" name="uname" class="tab-input"/>
                联系方式：<a href="tel:${data.pub.phone}" >${data.pub.phone}</a>
            </li>

            <br>

            <button type="button" onclick="back()" class="tab-btn">返回</button>

        </div>


    </div>
</div>


<script type="text/javascript">
    function back() {
        history.go(-1);
    }


</script>

</body>
</html>
