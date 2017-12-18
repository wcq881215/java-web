<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:forEach items="${data}" var="proxy">
    <option value="${proxy.id}">${proxy.pname}</option>
</c:forEach>