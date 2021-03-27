<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- icon library -->
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ej/pwFind.css"/>

    <div class="container">

        <h3 class="h3">비밀번호 찾기</h3><br><br><br>
        <form action="pwFind.do" method="post">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            <div class="center"><input type="radio" name="find" onclick="location.href='idFind.do'"> 아이디 찾기　 <input type="radio" name="find" checked> 비밀번호 찾기</div><br><br>
            <table>
                <tr>
                    <th>아이디</th>
                    <td><input type="text" name="id" size="25" placeholder="아이디를 입력해주세요." required></td>
                    <td></td>
                </tr>
                <tr>
                    <th>이메일</th>
                    <td><input type="email" name="email" size="25" placeholder="이메일을 입력해주세요." required></td>
                    <td><input type="button" class="btn btn1" value="인증번호 전송"></td>
                </tr>
                <tr>
                    <th>인증번호</th>
                    <td><input type="text" name="emailnum" size="25" placeholder="인증번호를 입력해주세요." required></td>
                    <td><input type="button" class="btn btn1 " value="인증번호 확인"></td>
                </tr>
            </table>
            <br><br>
            <div class="center">
            <input type="submit" class="btn btn1 btn_submit" value="완료">
            </div>
        </form>
    </div>
    <br><br><br><br><br><br>
