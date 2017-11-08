<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>订单录入</title>
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
    <h1 class="am-header-title"><a href="#title-link" class="" style="color: #333;">订单录入</a></h1>
    <div class="am-header-right am-header-nav">
        <a href="#right-link" class=""> </a>
    </div>
</header>


<div class="am-tabs qiehuan" data-am-tabs style="margin-top:70px;">
    <ul class="am-tabs-nav am-nav am-nav-tabs">

        <p> 办事处信息</p>
        <select name="proxy" id="proxy" onchange="queryPorxyInfo()">


        </select>
        <p class="hide" id="proxy_inf" style="color: #A4A4A4"></p>
    </ul>
    <div class="am-tabs-bd">

        <div class="am-tab-panel am-fade am-in am-active" id="tab1">
            <li> 业务员信息
                <input type="text" name="buser" id="buser" placeholder="姓名" class="tab-input"/>
                <input type="text" name="bphone" id="bphone" placeholder="联系电话（可填多个，请用逗号隔开）" class="tab-input"/>

            </li>
            <li>客户信息
                <input type="text" name="cust" id="cust" placeholder="负责人姓名" class="tab-input"/>
                <input type="text" name="cphone" id="cphone" placeholder="联系方式" class="tab-input"/></li>
            <input type="text" name="caddress" id="caddress" placeholder="地址（可填多个，请用逗号隔开）" class="tab-input"/>
            <li>订单信息<br>
                下单时间：<input type="date" name="stime" id="stime" placeholder="" class="tab-input"/>
                交货时间：<input type="date" name="dtime" id="dtime" placeholder="" class="tab-input"/></li>

            <li class="" style="border: 1px dashed #ddd;padding: 3px 0px 3px 10px;margin-bottom: 10px;">
                添加设备信息 <span style=" font-size:24px; color:#00A6FF" onclick="showDevice()"> &#43;  </span><br>
                <div id="" class="device-info hide">
                    <select name="device-name" id="device-name">
                        <option value="">请选择设备型号</option>
                    </select>
                    <input type="number" name="dnumber" id="dnumber" placeholder="请输入数量" class="tab-input"/>
                </div>
                <div class="device-label label"></div>
            </li>

            <textarea placeholder="填写定制信息" id="selfInf" name="selfInf" class="tab-input"></textarea>

            <textarea placeholder="备注补充" id="remark" name="remark" class="tab-input"></textarea>
            <button type="button" onclick="addOrder()" class="tab-btn">确认提交</button>

        </div>


    </div>
</div>


<script type="text/javascript">

    $(document).ready(function () {
        queryPorxy();
        queryDevice();
    });

    function addDevice() {
        //全局  ！
        var dids = "";
        var names = "";
        var dnumber = "";
        var device = [];


        var did = $('#device-name').val();
        var dnum = $('#dnumber').val();
        if(did == ''){
            alertMess('请选择一台设备');
            return;
        }
        if(dnum == ''){
            alertMess('请选择设备数量');
            return;
        }
        var dname=$("#device-name").find("option:selected").html();
        var info = "";
        info += "设备: "+dname;
        info += "  设备数量: "+dnum;
        info += "<br>";
        $('.device-label').append(info);

        var dev = {};
        dev["did"] = did;
        dev["dname"] = dname;
        dev["number"] = dnum;

        device.push(dev);
        console.log(device);

        dids += did+",";
        names += dname+",";
        dnumber += dnum+",";
    }
    
    function showDevice() {
        var device_inf_div = $('.device-info');
        if (device_inf_div.hasClass('hide')) {
            device_inf_div.removeClass('hide');
            return;
        }

        // $('.device-info').parent().append(device_inf_div);
    }



    function queryDevice() {
        $.ajax({
            type: 'get',
            url: '/web/device/list/select',
            data: {},
            dataType: 'html',
            success: function (html) {
                html = $("select[name='device-name']").html() + html;
                console.log(html);
                $("select[name='device-name']").html(html);
            }
        });
    }

    function queryPorxy() {
        $.ajax({
            type: 'get',
            url: '/web/proxy/list',
            data: {},
            dataType: 'html',
            success: function (html) {
                console.log(html);
                $('#proxy').html(html);
                queryPorxyInfo();
            }
        });
    }

    function queryPorxyInfo() {
        var pxid = $('#proxy').val();
        $.ajax({
            type: 'get',
            url: '/web/proxy/find',
            data: {
                id: pxid
            },
            dataType: 'json',
            success: function (json) {
                if (json.code == '200') {
                    $('#proxy_inf').html('区域：' + json.obj.pname + '负责人：' + json.obj.leader + ' 电话：' + json.obj.lmobile + ' <br> 所属公司：' + json.obj.groups);
                    $('#proxy_inf').removeClass('hide');
                }
            }
        });
    }

    function addOrder() {
        var buser = $('#buser').val();
        var bphone = $('#bphone').val();
        var cust = $('#cust').val();
        var cphone = $('#cphone').val();
        var caddress = $('#caddress').val();
        var stime = $('#stime').val().toString();
        var dtime = $('#dtime').val().toString();
        var selfInf = $('#selfInf').val();
        var remark = $('#remark').val();

        var proxy = $('#proxy').val();
        var device = $("select[name='device-name']").val();
        var dnumber = $('#dnumber').val();


        if (buser == '') {
            alertMess("请输入业务员姓名");
            return false;
        }
        if (bphone == '') {
            alertMess("请输入业务员联系电话");
            return false;
        }

        if (cust == '') {
            alertMess("请输入客户负责人姓名");
            return false;
        }
        if (cphone == '') {
            alertMess("请输入客户负责人联系方式");
            return false;
        }

        if (stime == '') {
            alertMess("请输入下单时间");
            return false;
        }
        if (dtime == '') {
            alertMess("请输入交货时间");
            return false;
        }

        if (device == '') {
            alertMess("请添加设备信息");
            return false;
        }

        if (dnumber == '') {
            alertMess("请添加设备数量");
            return false;
        }

        $.ajax({
            url: '/web/order/add',
            type: 'POST',
            data: {
                buser: buser,
                bphone: bphone,
                cust: cust,
                phone: cphone,
                address: caddress,
                stime: stime,
                dtime: dtime,
                ext: selfInf,
                remark: remark,
                proxy: proxy,
                did: device,
                number: dnumber
            },
            success: function (json) {
                if (json.code == '200') {
                    alertMess('提交成功');
                    location.href = '/${sessionScope.role}/work';
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
