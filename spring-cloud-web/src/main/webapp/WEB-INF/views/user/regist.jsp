<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>个人资料</title>
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

    <link type="text/css" rel="stylesheet" href="/mobile/zdialog.css"/>
    <script type="text/javascript" src="/mobile/jquery-1.11.2.min.js"></script>
    <script type="text/javascript" src="/mobile/zdialog.js"></script>
    <script type="text/javascript" src="/js/alert.js?v=1.0"></script>
    <script type="text/javascript" src="/js/location.js?v=1.0"></script>

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
    <h1 class="am-header-title"><a href="#title-link" class="" style="color: #333;">个人资料</a></h1>
    <div class="am-header-right am-header-nav">
        <a href="#right-link" class=""> </a>
    </div>
</header>

<div class="page zShow" id="couponDetail" refresh="0"
     style="background: rgb(50, 149, 251); margin-top:120px;">
    <div class="coupon-wrap">

        <div class="am-tabs-bd">

            <div class="am-tab-panel am-fade am-in am-active" id="">
                <li>
                    <label>购买设备号：</label>
                    <input type="text" placeholder="购买设备号" name="sn" id="sn" value="" class="tab-input"/>
                    <label>登陆用户名：</label>
                    <input type="text" placeholder="登陆用户名" name="username" id="reg_username" value=""
                           class="tab-input"/>
                    <label>姓名：</label>
                    <input type="text" placeholder="姓名" name="name" id="name" value="" class="tab-input"/>
                    <label>电话：</label>
                    <input type="text" placeholder="电话" name="phone" id="phone" value="" class="tab-input"/>
                    <div>
                        <label>地区：</label>
                        <select name="area" id = "area">
                            <option value = ' 北京市'> 北京市</option>
                            <option value = ' 上海市'> 上海市</option>
                            <option value = ' 天津市'> 天津市</option>
                            <option value = ' 重庆市'> 重庆市</option>
                            <option value = ' 陕西省'> 陕西省</option>
                            <option value = ' 甘肃省'> 甘肃省</option>
                            <option value = ' 四川省'> 四川省</option>
                            <option value = ' 山西省'> 山西省</option>
                            <option value = ' 河南省'> 河南省</option>
                            <option value = ' 湖北省'> 湖北省</option>
                            <option value = ' 内蒙古自治区'> 内蒙古自治区</option>
                            <option value = ' 新疆维吾尔族自治区'> 新疆维吾尔族自治区</option>
                            <option value = ' 安徽省'> 安徽省</option>
                            <option value = ' 宁夏回族自治区'> 宁夏回族自治区</option>
                            <option value = ' 山东省'> 山东省</option>
                            <option value = ' 河北省'> 河北省</option>
                            <option value = ' 西藏自治区'> 西藏自治区</option>
                            <option value = ' 黑龙江省'> 黑龙江省</option>
                            <option value = ' 吉林省'> 吉林省</option>
                            <option value = ' 辽宁省'> 辽宁省</option>
                            <option value = ' 江苏省'> 江苏省</option>
                            <option value = ' 江西省'> 江西省</option>
                            <option value = ' 福建省'> 福建省</option>
                            <option value = ' 广东省'> 广东省</option>
                            <option value = ' 湖南省'> 湖南省</option>
                            <option value = ' 云南省'> 云南省</option>
                            <option value = ' 广西壮族自治区'> 广西壮族自治区</option>
                            <option value = ' 浙江省'> 浙江省</option>
                            <option value = ' 海南省'> 海南省</option>
                            <option value = ' 青海省'> 青海省</option>
                            <option value = ' 贵州省'> 贵州省</option>
                        </select>
                    </div>
                    <label>登陆密码：</label>
                    <input type="text" placeholder="设置密码" name="reg_password" id="reg_password" class="tab-input"/>
                    <label>确认密码：</label>
                    <input type="text" placeholder="确认密码" name="cfmpassword" id="cfmpassword" class="tab-input"/></li>
            </div>
        </div>
    </div>

    <div class="receive-btn" onclick="updateUser()" style="background: rgb(255, 255, 255);color:#565656">确 认</div>

</div>
</body>

<script type="text/javascript">

    function updateUser() {
        var sn = $('#sn').val();
        var username = $('#reg_username').val();
        var name = $('#name').val();
        var phone = $('#phone').val();
        var password = $('#reg_password').val();
        var cfmpassword = $('#cfmpassword').val();
        var mid = getCookie('ck_mid');

        if (sn == '') {
            alertMess("请输入设备号");
            return;
        }
        if (username == '') {
            alertMess("请输入登陆用户名");
            return;
        }
        if (name == '') {
            alertMess("请输入用户姓名");
            return;
        }
        if (phone == '') {
            alertMess("请输入电话");
            return;
        }
        if (password == '') {
            alertMess("请输入密码");
            return;
        }

        if (cfmpassword == '') {
            alertMess("请输入密码");
            return;
        }

        if (password != cfmpassword) {
            alertMess("2次输入密码不一致");
            return;
        }

        $.ajax({
            type: "get",
            url: "${pageContext.request.contextPath}/web/user/register",
            dataType: 'json',
            data: 'name=' + name + '&password=' + password + '&sn=' + sn + '&phone=' + phone + '&username=' + username + '&mobno=' + mid + '&role=购机客户' + '&device=' + sn+'&area='+area,
            success: function (json) {
                if (json.code != '200') {
                    alertMess('提交失败');
                } else {
                    alertMess('注册成功');
                    location.href = "/user/login?username=" + username + "&password=" + password + "&mid" + mid;
                }
            }
        });
    }


</script>


</html>