<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 제이쿼리  -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    
<!-- 카카오 지도 API -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function DaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postCode').value = data.zonecode;
                document.getElementById("roadAddress").value = roadAddr;;

            }
        }).open();
    }

</script>
<!-- /카카오 지도 API -->


<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style>
	.form-group{margin-top: 4%; height: 30px;}  
	.btn:hover{
        background-color: rgb(173, 39, 173);
        color: white;
    }
</style>
<div style="text-align: center;">
	<h2>내 정보 수정</h2>
	<hr>
</div>
<form method="POST">
	<table style="margin: 0 auto; width: 35%; height: 300px;">
		<tbody>
			<tr>
				<td style="text-align: center;">닉네임</td>
				<td>
					<div class="form-group" style="margin-top: 4%; height: 30px;">
						<input type="text" class="form-control" id="upNickName">
					</div>
				</td>
				<td>
					<button type="button" class="btn"
						style="width: 90%; height: 65%; margin-left: 10%" onclick="nickcheck();">중복확인</button>
				</td>
			</tr>
			<tr>
				<td style="text-align: center;">아이디</td>
				<td>
					<div class="form-group" style="margin-top: 4%; height: 30px;">
						<input type="text" class="form-control" id="upId" value="아이디가져오기" readonly="readonly">
					</div>
				</td>
				<td>	
				</td>
			</tr>
			<tr>
				<td style="text-align: center;">비밀번호</td>
				<td>
					<div class="form-group">
						<input type="password" class="form-control" id="upPw">
					</div>
				</td>
				<td></td>
			</tr>
			<tr>
				<td style="text-align: center;">비밀번호확인</td>
				<td>
					<div class="form-group">
						<input type="password" class="form-control" id="upPwCon">
					</div>
				</td>
				<td></td>
			</tr>
			<tr>
				<td style="text-align: center;">이메일</td>
				<td>
					<div class="form-group">
						<input type="email" class="form-control" id="upEmail">
					</div>
				</td>
				<td>
					<button type="button" class="btn"
						style="width: 90%; height: 65%; margin-left: 10%" id="sendEmail">이메일전송</button>
				</td>
			</tr>
			<tr>
				<td style="text-align: center;">이메일 인증번호</td>
				<td>
					<div class="form-group">
						<input type="text" class="form-control" id="UpEmailCon">
					</div>
				</td>
				<td>
					<button type="button" class="btn"
						style="width: 90%; height: 65%; margin-left: 10%">이메일확인</button>
				</td>
			</tr>
			<tr>
				<td style="text-align: center;">주소</td>
				<td>
					<div class="form-group" style="margin-top: 2%;">
					<input type="text" class="form-control" id="postCode" name="postCode" placeholder="우편번호" required="required" size="25" readonly>
					</div>
				</td>
				<td>
					<input type="button" onclick="DaumPostcode()" class="btn" style="width: 90%; height: 65%; margin-left: 10%" value="우편번호 찾기 ">
				</td>
			</tr>
			<tr>
				<td></td>
				<td>
					<div class="form-group" style="margin-top: 2%;">
					<input type="text" class="form-control" id="roadAddress" name="roadAddress" placeholder="도로명주소" size="35" required="required" readonly>
					</div>
				</td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td>
					<div class="form-group" style="margin-top: 2%;">
					 <input type="text" class="form-control" id="detailAddress" name="detailAddress" placeholder="상세주소" size="35" required="required">
					</div>
				</td>
				<td></td>
			</tr>
			
		</tbody>
	</table>
	<div style="text-align: center;">
		<button type="button" class="btn" style="margin-bottom :3%">완료</button>
	</div>
</form>

<!-- 닉네임 중복체크 -->
<script>
function nickcheck(){
	nickname = $("#upNickName").val();
	$.ajax({
	    url: 'nickCheck.do',
	    type: 'POST',
	    //dataType: 'text', //(생략가능)
	    contentType : 'text/html; charset=utf-8;',//내가 서버로 보내는 데이터의 타입
	    //text/html이랑 text/plain이랑 차이점 알아두기
	    data: nickname ,
	    success: function(data){
	         if(data == 0){
	         alert("사용하실 수 있는 닉네임입니다.");
	         }else{
	         	alert("중복된 닉네임이 존재합니다.");
	         }
	    },
	    error: function (){                   
	    }
	 });
}
</script>

<!-- 이메일 인증  -->
 

