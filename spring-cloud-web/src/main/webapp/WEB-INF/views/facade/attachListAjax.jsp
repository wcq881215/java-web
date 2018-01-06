<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<table class="table table-striped table-bordered table-hover">
    <thead>
    <tr>
        <th>配件编号</th>
        <th>配件名称</th>
        <th>配件价格</th>
        <th>所属产品</th>
        <th>简介</th>
        <th>发布时间</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${data.content}" var="list">
        <tr>
            <td>${list.id }</td>
            <td>${list.name }</td>
            <td>${list.price }</td>
            <td>${list.product }</td>
            <td>${list.desc }</td>
            <td><fmt:formatDate value="${list.time }" pattern="yyyy-MM-dd"></fmt:formatDate></td>
            <td>
                <a href="javascript:deluser(${list.id})">删除</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>


</table>

<div class="">
    <input type="hidden" id="num" name="num" value="${data.totalPages }">
    共${data.totalElements}条记录，当前第${data.number+1}页,共${data.totalPages}页
    <a href="javascript:turnPage(-1)">上一页</a> <a href="javascript:turnPage(0)">下一页</a> 跳至&nbsp;
    <input type="text" name="page" id="page" class=""  size="10"  style="width:50px;margin-bottom: 0px;border:solid 1px #d7a372;"  value=""/>&nbsp;
    <input type="button" class="btn" value="跳" onclick="skipPage()">
</div>

