<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:forEach items="${data}" var="record">
    <option value="${record.id}">${record.name}</option>
</c:forEach>