<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- icon library -->
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ej/membershipPayComplete.css"/>
    <div class="container">
        <div class="icon">
        <i class="fas fa-clipboard-check fa-6x"></i>
        </div>

        <h3 class="h3">고객님, 멤버십 <span class="purple">결제</span>가 완료되었습니다.</h3>
        <br>
        <p class="p">고객님의 결제 내역은 다음과 같습니다.</p><br>
        
        <table class="table text-center">
            <tr>
                <th>거래번호</th>
                <td>10101010</td>
            </tr>
            <tr>
                <th>결제한 멤버십</th>
                <td>1주일 멤버십</td>
            </tr>
            <tr>
                <th>결제 금액</th>
                <td>1,200원</td>
            </tr>
            <tr>
                <th>결제일자</th>
                <td>2021.03.13</td>
            </tr>
        </table><br><br>
        <div class=center>
            <a href="main.do"><button class="btn btn1">확인</button></a>
        </div>
        
    </div>
    <br><br><br><br><br><br>