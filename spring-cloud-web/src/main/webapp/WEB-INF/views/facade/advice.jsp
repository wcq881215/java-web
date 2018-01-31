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
                    <h1 class="page-head-line">用户反馈查询</h1>
                    <div class="form-group  ">
                        <input type="text" name="kword" id="kword" value="" placeholder="反馈内容"/>
                        <input type="button" class="button btn" value="查询" onclick="search()"/>
                    </div>

                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div>

                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12">

                                <div class="table-responsive"></div>
                                <hr/>

                                <hr/>

                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>

    </div>
    <!-- /#wrapper -->
</div>

</body>

<script src="/front/js/jquery.min.js"></script>
<script src="/front/js/metisMenu.min.js"></script>
<script src="/front/js/bootstrap.min.js"></script>
<script src="/front/js/custom.js"></script>
<script type="text/javascript">
    var page = 1;
    var pageSize = 20;

    listAjax();

    function search() {
        page = 1;
        listAjax();
    }

    function listAjax() {
        var kword = $('#kword').val();
        $.ajax({
            type : "post",
            url : "/fronts/advice/list",
            dataType : 'html',
            data : 'page=' + page + '&pageSize=' + pageSize+'&kword='+kword,
            success : function(html) {
                $('.table-responsive').html(html);
            }
        });

    }

    function turnPage(index) {
        var num = document.getElementById("num").value;
        if (index == 0) {
            if (page < num) {
                page = page + 1;
            } else {
                page = num;
            }
        } else if (index == -1) {
            if (page > 1) {
                page = page - 1;
            } else {
                page = 1;
            }
        } else {
            page = index;
        }
        listAjax();
    }

    function skipPage() {
        var index_ = document.getElementById("page").value;
        if (index_ == "") {
            return;
        }
        turnPage(index_);
    }

    function deluser(id) {
        $.ajax({
            type : "post",
            url : "/fronts/advice/delete",
            dataType : 'json',
            data : 'id=' + id ,
            success : function(json) {
                if(json.code == '200'){
                    alert('删除成功');
                    listAjax();
                }else{
                    alert("删除失败");
                }
            }
        });
    }

</script>

</html>
