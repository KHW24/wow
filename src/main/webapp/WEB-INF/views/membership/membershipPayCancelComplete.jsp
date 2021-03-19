<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- icon library -->
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ej/membershipPayCancelComplete.css"/>

    <div class="container">
        <div class="icon">
        <i class="fas fa-clipboard-check fa-6x"></i>
        </div>

        <h3 class="h3">고객님, <span class="purple">취소요청</span>이 완료되었습니다.</h3>
        <br>
        <p class="p">고객님의 취소 요청 내역은 다음과 같습니다.</p><br>
        
        <table class="table text-center">
            <tr>
                <th>거래번호</th>
                <td>10101010</td>
            </tr>
            <tr>
                <th>거래요청한 멤버십</th>
                <td>1주일 멤버십</td>
            </tr>
            <tr>
                <th>환불예정 금액</th>
                <td>1,000원(6일분/총7일)</td>
            </tr>
            <tr>
                <th>취소요청 일자</th>
                <td>2021.03.13</td>
            </tr>
            <tr>
                <th>취소요청 사유</th>
                <td>구매의사 없어짐</td>
            </tr>
        </table><br><br>
        <div class=center>
            <a href="myMship.do"><button class="btn btn1">확인</button></a>
        </div>
    </div>
    <br><br><br><br><br><br>
