<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- icon library -->
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ej/pwFindUpt.css"/>
<script>
// 비밀번호 일치여부
	$(function(){
	    $('#joinPw').keyup(function(){
	      $('#checkPw').html('');
	    });
	
	    $('#joinPwCon').keyup(function(){
	        if($('#joinPw').val() != $('#joinPwCon').val()){
	          $('#checkPw').html('비밀번호 불일치');
	          $('#checkPw').attr('color', 'red');
	        } else{
	          $('#checkPw').html('비밀번호 일치');
	          $('#checkPw').attr('color', '#B337B3');
	        }
	    });
	});
</script>
    <div class="container">

        <h3 class="h3">비밀번호 변경</h3><br><br><br>
        <form action="updatePw.do" method="post">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            <input type="hidden" name="id" value="${member.id }"/>
            <div class="center"><input type="radio" name="find" > 아이디 찾기　 <input type="radio" name="find"> 비밀번호 찾기</div><br><br>
            <table>
                <tr>
                    <th>비밀번호</th>
                    <td><input type="password" id="joinPw" name="password" size="30" placeholder="비밀번호를 입력해주세요." required></td>
                </tr>
                <tr>
                    <th>비밀번호 확인</th>
                    <td><input type="password" id="joinPwCon" name="passwordch" size="30" placeholder="비밀번호를 한번더 입력해주세요." required>
                    <font id="checkPw" size="2"></font>	</td>
                </tr>
            </table>
            <br><br>
            <div class="center">
            <input type="submit" class="btn btn1 btn_submit" value="완료">
            </div>
        </form>
    </div>
    <br><br><br><br><br>