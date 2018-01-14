<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
        #horizontal-form .form-group div {
            text-align: left;
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
                    <h1 class="page-head-line">订单信息</h1>

                </div>
            </div>

            <div class="tab-content" style="">
                <div class="tab-pane active" id="horizontal-form">
                    <form action="" method="post" onsubmit="" class="form-horizontal">
                        <div id="">
                            <div class="coupon-wrap" style="margin-top:0px;padding-top: 0px;">
                                订单信息
                            </div>
                            <div class="form-group  ">
                                <label class="col-sm-2 control-label"> 订单编号：</label>
                                <div class="col-sm-8 control-label"> ${data.id}</div>
                            </div>

                            <div class="form-group  ">
                                <label class="col-sm-2 control-label"> 订单状态：</label>
                                <div class="col-sm-8 control-label"> ${data.state}</div>
                            </div>


                            <c:if test="${not empty data.devices }">
                                <c:forEach items="${data.devices}" var="device">
                                    <div class="form-group  ">
                                        <label class="col-sm-2 control-label"> 设备名称：</label>
                                        <div class="col-sm-8 control-label"> ${device.device.name}</div>
                                        <br>
                                    </div>
                                    <div class="form-group  ">
                                        <label class="col-sm-2 control-label"> 设备型号：</label>
                                        <div class="col-sm-8 control-label"> ${device.device.sn}</div>
                                    </div>
                                </c:forEach>
                            </c:if>

                            <div class="form-group  ">
                                <label class="col-sm-2 control-label">客户姓名</label>
                                <div class="col-sm-8 control-labe">${data.cust}</div>
                            </div>

                            <div class="form-group  ">
                                <label class="col-sm-2 control-label">电话 </label>
                                <div class="col-sm-8 control-label">${data.phone}</div>
                            </div>
                            <div class="form-group  ">
                                <label class="col-sm-2 control-label">预约安装时间</label>
                                <div class="col-sm-8 control-label">${data.dtime}</div>
                            </div>
                            <div class="form-group  ">
                                <label class="col-sm-2 control-label">安装要求</label>
                                <div class="col-sm-8 control-labe">${data.ext}</div>
                            </div>
                            <div class="coupon-wrap" style="margin-top:0px;padding-top: 0px;">
                                物流信息
                            </div>
                            <div class="form-group  ">
                                <label class="col-sm-2 control-label">物流公司</label>
                                <div class="col-sm-8 control-labe">${data.logistics}</div>
                            </div>
                            <div class="form-group  ">
                                <label class="col-sm-2 control-label">联系电话</label>
                                <div class="col-sm-8 control-label">${data.iphone}</div>
                            </div>
                            <div class="form-group  ">
                                <label class="col-sm-2 control-label">司机</label>
                                <div class="col-sm-8 control-labe"> ${data.driver}</div>
                            </div>
                            <div class="form-group  ">
                                <label class="col-sm-2 control-label">司机电话</label>
                                <div class="col-sm-8 control-label">${data.logphone}</div>
                            </div>
                            <div class="form-group  ">
                                <label class="col-sm-2 control-label">发货时间</label>
                                <div class="col-sm-8 control-label">${data.delatime}</div>
                            </div>

                            <c:if test="${not empty data.service}">
                                <div class="coupon-wrap" style="margin-top:0px;padding-top: 0px;">
                                    服务派工人员
                                    <c:forEach items="${data.service}" var="service">
                                        <c:if test="${service.state ne -1}">
                                            <div class="form-group  ">
                                                <label class="col-sm-2 control-label">${service.user.role}：</label>
                                                <div class="col-sm-8 control-labe">${service.user.name}</div>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </div>
                            </c:if>

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


</script>

</html>
