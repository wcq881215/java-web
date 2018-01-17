<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="navbar-default sidebar" role="navigation">
    <div class="sidebar-nav navbar-collapse">
        <ul class="nav" id="side-menu">
            <li>
                <a href="#"><i class="fa fa-laptop nav_icon"></i>用户管理<span class="fa arrow"></span></a>
                <ul class="nav nav-second-level">
                    <li>
                        <a href="/facade/user.html">用户管理</a>
                    </li>
                    <li>
                        <a href="/facade/user_add.html">开户</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="#"><i class="fa fa-indent nav_icon"></i>订单管理<span class="fa arrow"></span></a>
                <ul class="nav nav-second-level">
                    <li>
                        <a href="/facade/order.html">安装订单管理</a>
                    </li>
                    <li class="hide">
                        <a href="/facade/order_cnt.html">订单管理</a>
                    </li>
                </ul>
                <!-- /.nav-second-level -->
            </li>
            <li>
                <a href="#"><i class="fa fa-envelope nav_icon"></i>配件管理<span class="fa arrow"></span></a>
                <ul class="nav nav-second-level">
                    <li>
                        <a href="/facade/attach.html">配件管理</a>
                    </li>
                    <li>
                        <a href="/facade/attach_add.html">新增配件</a>
                    </li>
                </ul>
                <!-- /.nav-second-level -->
            </li>

            <li>
                <a href="#"><i class="fa fa-envelope nav_icon"></i>公司动态<span class="fa arrow"></span></a>
                <ul class="nav nav-second-level">
                    <li>
                        <a href="/facade/news.html">公司动态管理</a>
                    </li>
                    <li>
                        <a href="/facade/news_add.html">新增公司动态</a>
                    </li>
            </li>

        </ul>
    </div>
    <!-- /.sidebar-collapse -->
</div>
