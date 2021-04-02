<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ej/myMembership.css"/>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>  
    <br><br><br>
    <div class="container">
        <div class="bold">
            <h4><sec:authentication property="principal.member.id"/>님은,</h4>
            <sapn class="purple">
            <c:if test="${payment.mshipGrade eq 1}">
            	1주 멤버십
            </c:if>
            <c:if test="${payment.mshipGrade eq 2}">
            	2주 멤버십
            </c:if>
            <c:if test="${payment.mshipGrade eq 3}">
            	한달 멤버십
            </c:if>
            <c:if test="${payment.mshipGrade eq null}">
            	멤버십 미사용
            </c:if>
           </sapn> 회원입니다.
        </div>
            <hr><br><br>
	<table class="table text-center">
		<c:if test="${empty payment}">
				<tr>
					<td colspan="5">멤버십이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${!empty payment}">
					<tr>
						<th>거래번호</th>
						<td>${payment.paymentSeq}</td>
					</tr>
					<tr>
						<th>결제금액</th>
						<td>${payment.price}원</td>
					</tr>
					<tr>
						<th>결제일</th>
						<td>${payment.paymtDate}</td>
					</tr>
					<tr>
						<th>결제수단</th>
						<td>${payment.paymetnMethod}</td>
					</tr>
					<tr>
						<th>기간</th>
						<td>${payment.paymtDate} ~ ${payment.mshipdata[0].mshipEnd }</td>
					</tr>
			</c:if>
	

	</table>
	<div class=center>
		<c:if test="${empty payment}">
				<a href="mypage.do"><button class="btn btn1">확인</button></a>
				<a href="mshipSelect.do"><button class="btn btn2">멤버십신청</button></a>
		</c:if>
		<c:if test="${!empty payment}">
				<a href="mypage.do"><button class="btn btn1">확인</button></a>
				<a href="payCancle.do"><button class="btn btn2">멤버십취소 신청</button></a>
		</c:if>		
	</div>
    </div>
    <br><br><br><br><br>
