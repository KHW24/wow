<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>    
<!-- icon library -->
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ej/membershipPayComplete.css"/>
    <div class="container">
    	<br><br><br><br>
    	<div class="icon">
        <i class="fas fa-clipboard-check fa-6x"></i>
        </div>

        <h3 class="h3"><sec:authentication property="principal.member.id"/>님, 멤버십 <span class="purple">결제</span>가 완료되었습니다.</h3>
        <br>
        <%-- <p class="p">고객님의 결제 내역은 다음과 같습니다.</p><br>
        
        <table class="table text-center">
            <tr>
                <th>거래번호</th>
                <td>${mshipdata.mshipSeq}</td>
            </tr>
            <tr>
                <th>결제한 멤버십</th>
                <td>${name }</td>
            </tr>
            <tr>
                <th>결제 금액</th>
                <td>${amount }</td>
            </tr>
            <tr>
                <th>결제일자</th>
                <td>${mshipdata.mshipStart }</td>
            </tr>
        </table>  --%>
        <br>
        <div class=center>
            <a href="mypage.do"><button class="btn btn1">확인</button></a>
        </div>
        
    </div>
    <br><br><br><br><br><br>