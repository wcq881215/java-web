<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>配件库</title>
    <meta name="description" content="正大海工"/>
    <meta name="keywords" content="正大海工"/>
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <link rel="stylesheet" href="/css/amazeui.min.css"/>
    <link rel="stylesheet" href="/css/style.css"/>
    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <script type="text/javascript" src="/js/amazeui.min.js"></script>
    <link type="text/css" rel="stylesheet" href="/mobile/zdialog.css"/>
    <script type="text/javascript" src="/mobile/jquery-1.11.2.min.js"></script>
    <script type="text/javascript" src="/mobile/zdialog.js"></script>
    <script type="text/javascript" src="/js/alert.js?v=1.0"></script>

    <style>
        .am-tab-panel {
            font-size: 14px;
        }

        .am-tab-panel li label {
            width: 93px;
            line-height: 35px;
            height: 35px;
        }

        .am-tab-panel li .tab-input {
            width: calc(98% - 93px);
        }

        .am-tab-panel li input {
            padding-bottom: 5px;
            margin: 7px auto;
        }
    </style>
</head>
<body style="background: rgb(50, 149, 251);">

<header data-am-widget="header" class="am-header am-header-default header"
        style="width:100%;position:fixed; z-index:1000;top:0;left:0;">
    <div class="am-header-left am-header-nav">
        <a href="javascript:history.go(-1)" class="">
            <i class="am-header-icon am-icon-angle-left"></i>
        </a>
    </div>
    <h1 class="am-header-title"><a href="#title-link" class="" style="color: #333;">开户</a></h1>
    <div class="am-header-right am-header-nav">
        <a href="#right-link" class=""> </a>
    </div>
</header>

<div class="page zShow" id="couponDetail" refresh="0" style="background: rgb(50, 149, 251); margin-top:120px;">
    <div class="coupon-wrap">

        <div class="am-tabs-bd">

            <div class="am-tab-panel am-fade am-in am-active" id="tab1">
                <li>

                    <label>配件名称：</label>
                    <input type="text" placeholder="" id="name" name="name" value="" class="tab-input"/>
                    <label>价格：</label>
                    <input type="number" placeholder="" name="price" id="price" value="" class="tab-input"/>
                    <label>所属产品：</label>
                    <input type="text" placeholder="" name="product" id="product" value="" class="tab-input"/>

            </div>
        </div>
    </div>

    <div class="receive-btn" onclick="addAttach()" style="background: rgb(255, 255, 255);color:#565656">确 认</div>

</div>
</body>
<script type="text/javascript">


    function addAttach() {
        var name = $('#name').val();
        var price = $('#price').val();
        var product = $('#product').val();

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

        //添加
        $.ajax({
            type: "post",
            url: "${pageContext.request.contextPath}/web/attach/add",
            dataType: 'json',
            data: 'name=' + name + '&price=' + price + '&product=' + product ,
            success: function (json) {
                if (json.code != '200') {
                    alertMess(json.msg);
                } else {
                    alertMess('操作成功');
                    location.href = "/admin/work";
                }
            }
        });

    }

</script>
</html>