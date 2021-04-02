<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!-- icon library -->
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ej/mypage.css"/>
 <div class="container">
        <h3 class="h3">마이페이지</h3><br><br><br>
<script>
	var csrfHeaderName ="${_csrf.headerName}";
	var csrfTokenValue="${_csrf.token}";
</script>
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	<input type="hidden" name="${_csrf.headerName}" value="${_csrf.headerName}" />
        <table>
            <tr>
                <th>
                    <div class="left">
                        <div class="user">
                        <i class="fas fa-user-circle fa-10x"></i>
                        </div>
                        <sec:authorize access="isAuthenticated()">
                        <p class="p"><sec:authentication property="principal.member.id"/>님 환영합니다.</p>
                        </sec:authorize>
                        <a href="message.do?get_id=<sec:authentication property="principal.member.id"/>&page=${currentPage}" class="icon"><i class="far fa-envelope"></i></a>[0]<br>
                        <div class="a">
                        <a href="myMship.do">나의멤버십 </a><a href="myInfoCon.do">나의정보수정</a>
                       </div>
                    </div>
                </th>
                <td>
                    <a class="icon" href="wishList.do"><i class="fas fa-check-circle fa-6x"></i>
                    <br><br><br>관심 품목</a>
                </td>
                <td>
                    <a class="icon" href="myList.do"><i class="fas fa-check-circle fa-6x"></i>
                    <br><br><br>내 글 보기</a>
                </td>
                <td>
                    <a class="icon" href="myComment.do"><i class="fas fa-check-circle fa-6x"></i>
                    <br><br><br>내 댓글 보기</a>
                </td>
            </tr>
        </table>
        <br><br><br><br><br><br><br><br><br>
</div>