<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:forEach var="data" items="${dataList}">
    <li>
        <div class="am-gallery-item">
            <a href="/device/detail.html?id=${data.id}" class="">
                <img src="${data.imgs[0].src}" alt="${data.name}"/>
                <h3 class="am-gallery-title">${data.name}</h3>
                <div class="am-gallery-desc">
                    <em>查看详情</em>
                </div>
            </a>
        </div>
    </li>
</c:forEach>