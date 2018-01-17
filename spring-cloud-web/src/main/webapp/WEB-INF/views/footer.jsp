<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div data-am-widget="navbar" class="am-navbar am-cf am-navbar-default footer " id="">
    <ul class="am-navbar-nav am-cf am-avg-sm-4">
        <li>
            <a href="/${sessionScope.role}/home" class="">
                <span class=""><img src="/images/${sessionScope.action_home_png}"/></span>
                <span class="am-navbar-label">首页</span>
            </a>
        </li>
        <li>
            <a href="/${sessionScope.role}/work" class="">
                <span class=""><img src="/images/${sessionScope.action_work_png}"/></span>
                <span class="am-navbar-label">工作</span>
            </a>
        </li>
        <li>
            <a href="/${sessionScope.role}/message" class="">
                <span id="msg-tips"
                      style="z-index: 1000;position: absolute;color: #ffffff;border-radius: 50%;padding: 0px; width: 16px;height: 16px;line-height: 16px;font-size:10px;"></span>
                <span class=""><img src="/images/${sessionScope.action_msg_png}"/></span>
                <span class="am-navbar-label">消息</span>
            </a>
        </li>

        <li>
            <a href="/${sessionScope.role}/my" class="">
                <span class=""><img src="/images/${sessionScope.action_my_png}"/></span>
                <span class="am-navbar-label">我的</span>
            </a>
        </li>

    </ul>
</div>

<script type="text/javascript">

    queryMsg();
    function queryMsg() {
        $.ajax({
            type: 'post',
            url: '/web/user/message',
            data: {},
            dataType: 'json',
            success: function (json) {
                console.log(json);
                var tip = '';
                if (json.obj >= 100) {
                    tip = '99+';
                } else if (json.obj == 0) {
                    tip = '';
                    $('#msg-tips').remove();
                    return;
                } else {
                    tip = json.obj;
                }
                $('#msg-tips').text(tip);
                $('#msg-tips').css('background-color','#ff0000');
            }
        });
    }
</script>