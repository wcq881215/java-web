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
</head>
<body>


<header data-am-widget="header" class="am-header am-header-default header"
        style="width:100%;position:fixed; z-index:1000;top:0;left:0;">
    <div class="am-header-left am-header-nav">
        <a href="#left-link" class="">
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
        <p style="color: #A4A4A4">区域：${sessionScope.session_user.team} 负责人：李嘉云 电话：${sessionScope.session_user.phone}<br>
            所属公司：浙江正大集团有限公司 </p>
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

            <li class="hide">添加设备信息 <span style=" font-size:24px; color:#00A6FF"> &#43;  </span><br>
                <select>
                    <option value="1">请选择设备型号</option>
                    <option value="2">设备名称</option>
                    <option value="3">设备名称</option>
                </select>
                <select>
                    <option value="1">请选择数量</option>
                    <option value="2">1台</option>
                    <option value="3">2台</option>
                    <option value="3">3台</option>
                    <option value="3">4台</option>
                    <option value="3">5台</option>

                </select>

                <select>
                    <option value="1">请选择一台重量</option>
                    <option value="2">50KG</option>
                    <option value="3">70kg</option>
                    <option value="3">90kg</option>

                </select>

                <p style="color: #404040">设备所属区域：临海地区 <br>负责人：李嘉云 &nbsp;&nbsp;&nbsp; &nbsp; 电话：13422101114<br>
                    所属公司：浙江正大集团有限公司 </p>

                <br>
            </li>

            <textarea placeholder="填写定制信息" id="selfInf" name="selfInf" class="tab-input"></textarea>

            <textarea placeholder="备注补充" id="remark" name="remark" class="tab-input"></textarea>
            <button type="button" onclick="addOrder()" class="tab-btn">确认提交</button>

        </div>


    </div>
</div>


<script type="text/javascript">

    function addOrder() {
        var buser = $('#buser').val();
        var bphone = $('#bphone').val();
        var cust = $('#cust').val();
        var cphone = $('#cphone').val();
        var caddress = $('#caddress').val();
        var stime = $('#stime').val();
        var dtime = $('#dtime').val();
        var selfInf = $('#selfInf').val();
        var remark = $('#remark').val();


        if (buser == '') {
            alert("请输入业务员姓名");
            return false;
        }
        if (bphone == '') {
            alert("请输入业务员联系电话");
            return false;
        }

        if (cust == '') {
            alert("请输入客户负责人姓名");
            return false;
        }
        if (cphone == '') {
            alert("请输入客户负责人联系方式");
            return false;
        }

        if (stime == '') {
            alert("请输入下单时间");
            return false;
        }
        if (dtime == '') {
            alert("请输入交货时间");
            return false;
        }

        $.ajax({
            url: '/web/order/add',
            type: 'POST',
            data: {
                title: title,
                content: content
            },
            success: function (json) {
                if (json.code == '200') {
//                    $('.img-space > img').each(function () {
//                        img += $(this).attr("src") + "##@##";
//                        fname += $(this).attr("alt") + "##@##";
//                        type += $(this).attr("title") + "##@##";
//                    });
                    alert('提交成功');
                    return;

                } else {
                    alert(json.msg);
                }
            }
        });

        return true;
    }


</script>

</body>
</html>
