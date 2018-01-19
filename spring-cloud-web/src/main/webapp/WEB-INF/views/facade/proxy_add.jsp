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
    <link href="/front/css/basic.css" rel="stylesheet"/>
    <!-- Nav CSS -->
    <link href="/front/css/custom.css" rel="stylesheet">
    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <script type="text/javascript" src="/mobile/jquery-1.11.2.min.js"></script>
    <script type="text/javascript" src="/front/dialog/alert.js?v=1.0"></script>
    <script type="text/javascript" src="/front/dialog/plug-in.js"></script>

    <style type="text/css">
        .file .img-space img {
            width: 100px;
            height: 100px;
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
                    <h1 class="page-head-line">办事处</h1>

                </div>
            </div>

            <div class="row" style="padding-bottom: 100px;">
                <div class="col-md-6">
                    <form action="" method="post" onsubmit="">
                        <div id="comments-sec">
                            <div class="form-group  ">
                                <label>办事处名称:</label> <input type="text" name="pname" id="pname"
                                                             class="form-control1 ng-invalid ng-invalid-required ng-touched"
                                                             value=""/>
                            </div>

                            <div class="form-group  ">
                                <label>地址</label> <input type="number" name="address" id="address"
                                                         value=""
                                                         class="form-control1 ng-invalid ng-invalid-required ng-touched"
                                                         required="required"/>
                            </div>

                            <div class="form-group  ">
                                <label>联系电话</label> <input type="text" name="phone" id="phone" value=""
                                                           class="form-control1 ng-invalid ng-invalid-required ng-touched"
                                                           required="required"/>
                            </div>

                            <div class="form-group  ">
                                <label>负责人</label> <input type="text" name="leader" id="leader" value=""
                                                          class="form-control1 ng-invalid ng-invalid-required ng-touched"
                                                          required="required"/>
                            </div>

                            <div class="form-group  ">
                                <label>负责人电话</label> <input type="text" name="lmobile" id="lmobile"
                                                            value=""
                                                            class="form-control1 ng-invalid ng-invalid-required ng-touched"
                                                            required="required"/>
                            </div>

                            <div class="form-group  ">
                                <label>所属公司</label> <input type="text" name="groups" id="groups" value=""
                                                           class="form-control1 ng-invalid ng-invalid-required ng-touched"
                                                           required="required"/>
                            </div>


                            <div class="form-group">
                                <input type="button" class="btn btn-success" onclick="submitProxy()" value="确认提交"/>
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

    function submitProxy() {
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
                pname: pname,
                address: address,
                phone: phone,
                leader: leader,
                lmobile: lmobile,
                groups: groups
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

</html>
