<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- icon library -->
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ej/mypage.css"/>
 <div class="container">
        <h3 class="h3">마이페이지</h3><br><br><br>
        <table>
            <tr>
                <th>
                    <div class="left">
                        <div class="user">
                        <i class="fas fa-user-circle fa-10x"></i>
                        </div>
                        <p class="p">솜씨님 환영합니다.</p>
                        <a href="message.do" class="icon"><i class="far fa-envelope"></i></a>[0]<br>
                        <div class="a">
                        <a href="myMship.do">나의멤버십 </a><a href="myInfoUp.do">나의정보수정</a>
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
