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


            <li>办事处信息录入
                <input type="text" placeholder="办事处名称" id="pname" name="pname" class="tab-input"/>
                <input type="text" placeholder="地址" id="address" name="address" class="tab-input"/>
                <input type="text" placeholder="联系电话" id="phone" name="phone" class="tab-input"/>
                <input type="text" placeholder="负责人" id="leader" name="leader" class="tab-input"/>
                <input type="text" placeholder="负责人电话" id="lmobile" name="lmobile" class="tab-input"/>
                <input type="text" placeholder="所属公司" id="groups" name="groups" class="tab-input"/>
            </li>

            <br>
            <button type="button" onclick="submitDevice()" class="tab-btn">提交</button>

        </div>


    </div>
</div>


<script type="text/javascript">
    function submitDevice() {
        var pname = $('#pname').val();
        var address = $('#address').val();
        var phone = $('#phone').val();
        var leader = $('#leader').val();
        var lmobile = $('#lmobile').val();
        var groups = $('#groups').val();

        $.ajax({
            type: 'post',
            url: '/web/proxy/add',
            data: {
                pname:pname,
                address:address,
                phone:phone,
                leader:leader,
                lmobile:lmobile,
                groups:groups
            },
            dataType: 'json',
            success: function (json) {
                console.log(json);
                if (json.code == '200') {
                    alert('提交成功');
                    history.go(-1);
                    return;
                } else {
                    alert(json.msg);
                    return
                }
            }
        });
    }


</script>

</body>
</html>
