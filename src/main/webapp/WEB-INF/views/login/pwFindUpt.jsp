<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- icon library -->
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ej/pwFindUpt.css"/>
    <div class="container">
        <h3 class="h3">비밀번호 변경</h3><br><br><br>
        <form action="pwFindch" method="post">
            <div class="center"><input type="radio" name="find" > 아이디 찾기　 <input type="radio" name="find"> 비밀번호 찾기</div><br><br>
            <table>
                <tr>
                    <th>비밀번호</th>
                    <td><input type="password" size="30" placeholder="비밀번호를 입력해주세요." required></td>
                </tr>
                <tr>
                    <th>비밀번호 확인</th>
                    <td><input type="password" size="30" placeholder="비밀번호를 한번더 입력해주세요." required></td>
                </tr>
            </table>
            <br><br>
            <div class="center">
            <input type="submit" class="btn btn1 btn_submit" value="완료">
            </div>
        </form>
    </div>
    <br><br><br><br><br>
