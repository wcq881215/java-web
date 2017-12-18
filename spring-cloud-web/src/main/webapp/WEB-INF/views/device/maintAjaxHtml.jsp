<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:forEach var="data" items="${dataList}">
    <div class="am-g am-intro-bd">
        <a href="/web/maintain/detail/${data.id}">
            <div class="am-intro-right am-u-sm-9">
                <h2>${data.title}</h2>
                <p>${data.desc}...</p>
                <div class="text" style=" margin-right:20px;">
                    <span class="fl">${data.time}</span>
                    <span style="float:right; margin-right:10px;">查看详情</span>
                </div>
            </div>
        </a>
    </div>
</c:forEach>