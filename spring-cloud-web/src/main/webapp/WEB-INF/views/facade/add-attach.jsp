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
                    <h1 class="page-head-line">个人信息</h1>

                </div>
            </div>

            <div class="row" style="padding-bottom: 100px;">
                <div class="col-md-6">
                    <form action="" method="post" onsubmit="">
                        <div id="comments-sec">
                            <div class="form-group  ">
                                <label>登录用户名:</label> <input type="text" name="username" id="username" class="form-control1 ng-invalid ng-invalid-required ng-touched" value="" />
                            </div>

                            <div class="form-group  ">
                                <label>用户姓名</label> <input type="text" name="name" id="name" value="" class="form-control1 ng-invalid ng-invalid-required ng-touched" required="required" placeholder="输入用户姓名" />
                            </div>

                            <div class="form-group  ">
                                <label>联系电话</label> <input type="text" name="phone" id="phone" value="" class="form-control1 ng-invalid ng-invalid-required ng-touched" required="required" placeholder="输入电话" />
                            </div>

                            <div>
                                <label>地区：</label>
                                <select name="area" id = "area" class="form-control1 ng-invalid ng-invalid-required">
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

                            <div>
                                <label>部门：</label>
                                <select id="dept" name="dept" class="form-control1 ng-invalid ng-invalid-required">


                                </select>
                            </div>

                            <div class="form-group  ">
                                <label>登录密码</label> <input type="text" name="password" value="" class="form-control1 ng-invalid ng-invalid-required ng-touched" required="required" placeholder="输入登录密码" />
                            </div>

                            <div class="form-group">
                                <input type="button" class="btn btn-success" onclick="addUser()" value="确认提交" />
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

    queryDept();

    function queryDept() {
        $.ajax({
            type: "get",
            url: "${pageContext.request.contextPath}/web/user/type/list",
            dataType: 'json',
            data: '',
            success: function (json) {
                var html = createHtml(json);
                $('#dept').html(html);
            }
        });
    }

    function createHtml(json) {
        var html = "";
        var array = json.obj;
        console.log(array);
        for (var i in array) {
            var data = array[i];
            html += "<option value='" + data + "' >";
            html += data;
            html += "</option>";
        }

        return html;
    }


    function addUser() {
        var username = $('#username').val();
        var name = $('#name').val();
        var phone = $('#phone').val();
        var password = $('#password').val();
        var dept = $('#dept').val();
        var area = $('#area').val();

        if (username == '') {
            alertMess("请输入登陆用户");
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
//            alertMess("请输入密码");
//            return;
            password = "111111";
        }
        //验证username
        $.ajax({
            type: "get",
            url: "${pageContext.request.contextPath}/web/user/check",
            dataType: 'json',
            data: 'username=' + username,
            success: function (result) {
                if (result == false || result == 'false') {
                    alertMess('用户名已经存在,请使用新的登陆用户名');
                } else {
                    //添加
                    $.ajax({
                        type: "get",
                        url: "${pageContext.request.contextPath}/web/user/add",
                        dataType: 'json',
                        data: 'name=' + name + '&password=' + password + '&username=' + username + '&phone=' + phone + '&dept=' + dept+'&area='+area,
                        success: function (json) {
                            if (json.code != '200') {
                                alertMess(json.msg);
                            } else {
                                alertMsg('操作成功','/facade/user.html');
                            }
                        }
                    });
                }
            }
        });

    }


</script>

</html>
