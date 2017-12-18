<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>填写意向设备</title>
    <meta name="description" content="填写意向设备"/>
    <meta name="keywords" content="填写意向设备"/>
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <link rel="stylesheet" href="/css/amazeui.min.css"/>
    <link rel="stylesheet" href="/css/style.css"/>
    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <script type="text/javascript" src="/js/amazeui.min.js"></script>
    <link type="text/css" rel="stylesheet" href="/mobile/zdialog.css"/>
    <script type="text/javascript" src="/mobile/jquery-1.11.2.min.js"></script>
    <script type="text/javascript" src="/mobile/zdialog.js"></script>
    <script type="text/javascript" src="/js/alert.js?v=1.0"></script>
</head>
<body>
<header data-am-widget="header" class="am-header am-header-default header"
        style="width:100%;position:fixed; z-index:1000;top:0;left:0;">
    <div class="am-header-left am-header-nav">
        <a href="javascript:history.go(-1)" class="">
            <i class="am-header-icon am-icon-angle-left"></i>
        </a>
    </div>
    <h1 class="am-header-title"><a href="#title-link" class="" style="color: #333;">填写意向设备</a></h1>
    <div class="am-header-right am-header-nav">
        <a href="#right-link" class=""> </a>
    </div>
</header>


<div class="am-tabs qiehuan" data-am-tabs style="margin-top:50px; ">

    <div class="am-tabs-bd">
        <div class="am-tab-panel am-fade am-in am-active" id="tab1">


            <li>填写设备信息
                <input type="text" placeholder="设备名称" id="name" name="name" class="tab-input"/>
                <input type="text" placeholder="设备型号" id="type" name="type" class="tab-input"/></li>

            <li>备注信息<br>


            </li>
            <textarea placeholder="输入对设备的要求与需要" id="remark" name="remark" class="tab-input"></textarea>

            <br><br>

            <button type="button" onclick="submitDevice()" class="tab-btn">提交</button>


        </div>


    </div>
</div>


<script type="text/javascript">
    function submitDevice() {
        var name = $('#name').val();
        var type = $('#type').val();
        var remark = $('#remark').val();
        if (name == '') {
            alertMess("请输入设备名称");
            return;
        }

        if (type == '') {
            alertMess("请输入设备型号");
            return;
        }

        $.ajax({
            type: 'post',
            url: '/customer/purchar/device',
            data: {
                name: name,
                type: type,
                remark: remark
            },
            dataType: 'json',
            success: function (json) {
                console.log(json);
                if (json.code == '200') {
                    alertMess('提交成功');
                    history.go(-1);
                    return;
                } else {
                    alertMess(json.msg);
                    return
                }
            }
        });
    }


</script>

</body>
</html>
