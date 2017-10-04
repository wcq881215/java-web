<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div data-am-widget="navbar" class="am-navbar am-cf am-navbar-default footer " id="">
    <ul class="am-navbar-nav am-cf am-avg-sm-4">
        <li>
            <a href="/${sessionScope.role}/home" class="">
                <span class=""><img src="/images/nav.png"/></span>
                <span class="am-navbar-label" style="color:#43b3f4;">首页</span>
            </a>
        </li>
        <li>
            <a href="/${sessionScope.role}/work" class="">
                <span class=""><img src="/images/nav8.png"/></span>
                <span class="am-navbar-label">工作</span>
            </a>
        </li>
        <li>
            <a href="/${sessionScope.role}/message" class="">
                <span class=""><img src="/images/nav2.png"/></span>
                <span class="am-navbar-label">消息</span>
            </a>
        </li>

        <li>
            <a href="/${sessionScope.role}/my" class="">
                <span class=""><img src="/images/nav4.png"/></span>
                <span class="am-navbar-label">我的</span>
            </a>
        </li>

    </ul>
</div>
