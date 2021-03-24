<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<sec:authentication property="principal"/>
<sec:authentication property="principal.member"/>
<sec:authentication property="principal.member.id"/>
<sec:authentication property="principal.member.nickname"/>
<sec:authentication property="principal.member.authList"/>


</body>
</html>