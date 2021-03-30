<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ej/myMembership.css"/>
    
    <br><br><br>
    <div class="container">
        <div class="bold">
        <sec:authorize access="isAuthenticated()">
            <h4><sec:authentication property="principal.member.id"/>님은,</h4>
            </sec:authorize>
            <sapn class="purple">${userinfo.membership}1주일멤버십</sapn> 회원입니다.
        </div>
            <hr><br><br>
        <table class="table text-center">
            <tr>
                <th>거래번호</th>
                <td>10101010</td>
            </tr>
            <tr>
                <th>결제금액</th>
                <td>1,200원</td>
            </tr>
            <tr>
                <th>결제일</th>
                <td>2021-03-12</td>
            </tr>
            <tr>
                <th>결제수단</th>
                <td>계좌이체</td>
            </tr>
            <tr>
                <th>기간</th>
                <td>2021-03-13 ~ 2021-03-18</td>
            </tr>
        </table>
        <div class=center>
        <a href="mypage.do"><button class="btn btn1">확인</button></a>
        <a href="payCancle.do"><button class="btn btn2">멤버십취소 신청</button></a>
        </div>
    </div>
    <br><br><br><br><br>
