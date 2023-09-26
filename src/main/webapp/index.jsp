<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>파일 목록</title>
</head>
<body>
    <c:forEach var="fileName" items="${fileNames}">
        ${fileName} <br/>
    </c:forEach>
</body>
</html>