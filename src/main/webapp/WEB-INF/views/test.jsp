<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>

</script>

</head>
<body>

<table border="1">
  <tr>
    <th>아이디</th>
    <th>닉네임</th>
    <th>이메일</th>
    <th>주소</th>
  </tr>
     <c:forEach var="member" items="${MemberList}">
  <tr>
	 <td>${member.id }</td>
	 <td>${member.nickname }</td>
	 <td>${member.email }</td>
	 <td>${member.address }</td>
   </tr>
    </c:forEach>

</table>

</body>
</html>