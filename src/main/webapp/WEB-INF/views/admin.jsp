<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<sec:authentication property="principal"/><br>
<sec:authentication property="principal.member"/><br>
<input type="text" value="<sec:authentication property="principal.member.id" />"/><br>
<input type="text" value="<sec:authentication property="principal.member.nickname"/>" /><br>
<sec:authentication property="principal.member.authList"/><br>


</body>
</html>