<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>维修派工</title>
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
</head>
<body>


<header data-am-widget="header" class="am-header am-header-default header"
        style="width:100%;position:fixed; z-index:1000;top:0;left:0;">
    <div class="am-header-left am-header-nav">
        <a href="javascript:history.go(-1)" class="">
            <i class="am-header-icon am-icon-angle-left"></i>
        </a>
    </div>
    <h1 class="am-header-title"><a href="#title-link" class="" style="color: #333;">维修派工录入</a></h1>
    <div class="am-header-right am-header-nav">
        <a href="#right-link" class=""> </a>
    </div>
</header>


<div class="am-tabs qiehuan" data-am-tabs style="margin-top:70px;" id="couponDetail">

    <div class="am-tabs-bd">
        <div class="am-tab-panel am-fade am-in am-active" id="tab1">
            <li>客户信息
                <input type="text" name="cust" id="cust" placeholder="负责人姓名" class="tab-input"/>
                <input type="text" name="cphone" id="cphone" placeholder="联系方式" class="tab-input"/></li>
            <input type="text" name="caddress" id="caddress" placeholder="联系地址" class="tab-input"/>
            <li>
                预约维修时间：<input type="date" name="stime" id="stime" placeholder="" class="tab-input"/>
            <textarea placeholder="设备故障信息" id="selfInf" name="selfInf" class="tab-input"></textarea>
            <textarea placeholder="备注补充" id="remark" name="remark" class="tab-input"></textarea>
            <button type="button" onclick="selectTech()" class="tab-btn">下一步</button>
        </div>
    </div>

</div>

<div class="am-tabs qiehuan hide" id="user-content" data-am-tabs style="margin-top:50px; ">
    <div class="search-input" style="">
        <input type="text" id="key" name="key" placeholder="输入关键词查找"/>
    </div>

    <ul class="member-nav">

    </ul>
    <br><br>
    <button type="button" onclick="addOrder()" class="tab-btn">确 定</button>

</div>


<script type="text/javascript">

    function selectTech() {
        if(!checkData()){
            return ;
        }
        $('#couponDetail').addClass("hide")
        $('#user-content').removeClass("hide")
        init(function (json) {
            appendData(json);
        });
    }

    var page = 0;
    var pageSize = 400;
    var ajaxFlag = true;

    $(".search-input").on("input", "input[type='text']", function () {
        ajaxFlag = true;
        page = 0;
        init(function (json) {
            var htm = createHtmlNoData();
            if (json.obj.numberOfElements > 0) {
                htm = createHtml(json);
                $('.ui-loader').hide();
            } else {
                ajaxFlag = false;
            }
            $('.member-nav').html(htm);
        });
    });

    $(document).on("scrollstart", function () {
        init(function (json) {
            appendData(json);
        });
    });

    function appendData(json) {
        var htm = createHtmlNoData();
        if (json.obj.numberOfElements > 0) {
            page++;
            htm = createHtml(json);
            $('.ui-loader').hide();
        } else {
            ajaxFlag = false;
        }
        $('.member-nav').append(htm);
    }

    function init(callback) {
        var key = $('#key').val();
        if (!ajaxFlag) {
            return;
        }
        $.ajax({
            type: 'get',
            url: '/web/user/list/inner',
            data: {
                type :'售后服务',
                key: key,
                page: page,
                pageSize: pageSize
            },
            dataType: 'json',
            success: function (json) {
                console.log(json);
                callback(json)
            }
        });
    }

    function createHtmlNoData() {
        return "";
    }


    function createHtml(json) {
        var html = "";
        var array = json.obj.content;
        for (var i in array) {
            var data = array[i];
            html += "<li>";
            html += "<span>" + data.name + "&nbsp;" + data.dept + "&nbsp; 电话：" + data.phone + "</span>";
            html += "<input style='float: right;right:20px;margin-top: 15px;' type='checkbox' name='user_ids' value='" + data.id + "' />";
            html += "</li>";
        }
        return html;
    }

    function checkData() {
        var cust = $('#cust').val();
        var cphone = $('#cphone').val();
        var caddress = $('#caddress').val();
        var stime = $('#stime').val().toString();
        var selfInf = $('#selfInf').val();

        if (cust == '') {
            alertMess("请输入客户负责人姓名");
            return false;
        }
        if (cphone == '') {
            alertMess("请输入客户负责人联系方式");
            return false;
        }

        if (stime == '') {
            alertMess("请输入预约维修时间");
            return false;
        }

        if (selfInf == '') {
            alertMess("请添加设备故障信息");
            return false;
        }
        return true;
    }
    
    function addOrder() {

        var uids = "";
        $("input[name='user_ids']").each(function () {
            if ($(this).is(":checked")) {
                uids += $(this).val() + ",";
            }
        })
        console.log(">> uids :: " + uids);
        if(uids == ""){
            alertMess('请选择服务人员进行派工');
            return false;
        }

        var cust = $('#cust').val();
        var cphone = $('#cphone').val();
        var caddress = $('#caddress').val();
        var stime = $('#stime').val().toString();
        var selfInf = $('#selfInf').val();
        var remark = $('#remark').val();

        $.ajax({
            url: '/web/order/fix/add',
            type: 'POST',
            data: {
                dids:uids,
                cust: cust,
                phone: cphone,
                address: caddress,
                stime: stime,
                ext: selfInf,
                remark: remark
            },
            success: function (json) {
                if (json.code == '200') {
                    alertMess('提交成功');
                    location.href = '/manager/work.html';
                    return;
                } else {
                    alertMess(json.msg);
                }
            }
        });

        return true;
    }


</script>

</body>
</html>
