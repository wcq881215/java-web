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

    <style type="text/css">
        .file .img-space img{
            width:  100px;
            height:100px;
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
                    <h1 class="page-head-line">设备信息</h1>

                </div>
            </div>

            <div class="row" style="padding-bottom: 100px;">
                <div class="col-md-6">
                    <form action="" method="post" onsubmit="">
                        <div id="comments-sec">
                            <div class="form-group  ">
                                <label>设备型号:</label> <input type="text" name="sn" id="sn" class="form-control1 ng-invalid ng-invalid-required ng-touched" value="" />
                            </div>

                            <div class="form-group  ">
                                <label>设备名称</label> <input type="text" name="_name" id="_name" value="" class="form-control1 ng-invalid ng-invalid-required ng-touched" required="required"  />
                            </div>

                            <div class="form-group  ">
                                <label>设备分类</label> <input type="text" name="type" id="type" value="" class="form-control1 ng-invalid ng-invalid-required ng-touched" required="required"  />
                            </div>

                            <div class="hide">
                                <label>请选择设备所属办事处：</label>
                                <select id="proxy" name="proxy" class="form-control1 ng-invalid ng-invalid-required">


                                </select>
                            </div>


                            <div class="form-group  ">
                                <label>设备数量</label> <input type="text" name="number" id="number" value="" class="form-control1 ng-invalid ng-invalid-required ng-touched" required="required"  />
                            </div>

                            <div class="form-group  ">
                                <label>销售价格</label> <input type="text" name="price" id="price" value="" class="form-control1 ng-invalid ng-invalid-required ng-touched" required="required"  />
                            </div>

                            <div>
                                 <textarea placeholder="设备简介" id="_desc" name="_desc" class="tab-input"
                                           style="height:300px;"></textarea>
                            </div>

                            <div class="form-group file ">
                                <label>设备图片</label> <input type="file" name="file" value="" class="form-control1 ng-invalid ng-invalid-required ng-touched" required="required"  />
                                <div class="img-space"
                                     style="">
                                </div>
                            </div>

                            <div class="form-group">
                                <input type="button" class="btn btn-success" onclick="addDevice()" value="确认提交" />
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

    $(".file").on("change", "input[type='file']", function () {
        var file = this.files[0];
        if (file) {
            var reader = new FileReader();
            reader.onload = function (event) {
                var txt = event.target.result;
                var img = document.createElement("img");
                img.src = txt;
                img.alt = file.name;
                img.title = file.type;
                $('.img-space').append(img);
            };
        }
        reader.readAsDataURL(file);
    });


    $(document).ready(function () {
        queryProxy();
    });

    function queryProxy() {
        $.ajax({
            url: '/web/proxy/list',
            type: 'get',
            data: {},
            dataType: "html",
            success: function (html) {
                $('#proxy').html(html);
            }
        });
    }

    function addDevice() {

        var sn = $('#sn').val();
        var _name = $('#_name').val();
        var type = $('#type').val();
        var proxy = $('#proxy').val();
        var number = $('#number').val();
        var price = $('#price').val();
        var _desc = $('#_desc').val();


        if (_name == '') {
            alertMess("请输入设备名称");
            return false;
        }
        if (_desc == '') {
            alertMess("请输入设备简介");
            return false;
        }


        $.ajax({
            url: '/web/device/add',
            type: 'POST',
            data: {
                sn: sn,
                _name: _name,
                type: type,
                proxy: proxy,
                number: number,
                price: price,
                _desc: _desc
            },
            success: function (json) {
                if (json.code == '200') {
                    var did = json.obj.id;
                    var img = "";
                    var fname = "";
                    var type = "";
                    $('.img-space > img').each(function () {
                        img += $(this).attr("src") + "##@##";
                        fname += $(this).attr("alt") + "##@##";
                        type += $(this).attr("title") + "##@##";
                    });

                    $.ajax({
                        url: '/web/device/image',
                        type: 'POST',
                        data: {
                            did: did,
                            img: img,
                            type: type,
                            alt: fname
                        }, success: function (json) {
                            console.log("upload " + fname + " image ");
                            alertMess("上传成功");
                            location.href = "/facade/device.html"
                        }
                    });

                } else {
                    alertMess(json.msg);
                }
            }
        });

        return true;
    }

</script>

</html>
