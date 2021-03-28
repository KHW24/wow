<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!-- 제이쿼리  -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- 카카오 지도 API -->
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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


<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style>
.form-group {
	margin-top: 4%;
	height: 30px;
}

.btn:hover {
	background-color: rgb(173, 39, 173);
	color: white;
}
</style>
<div style="text-align: center;">
	<h2>내 정보 수정</h2>
	<hr>
</div>
<form action="myInfoUp.do" method="POST">
<script>
	var csrfHeaderName ="${_csrf.headerName}";
	var csrfTokenValue="${_csrf.token}";
</script>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
<input type="hidden" name="${_csrf.headerName}" value="${_csrf.headerName}" />
	<table style="margin: 0 auto; width: 35%; height: 300px;">
		<tbody>
			<tr>
				<td style="text-align: center;">닉네임</td>
				<td>
					<div class="form-group" style="margin-top: 4%; height: 30px;">
						<input type="text" class="form-control" id="upNickName"
							name="nickname" required value="<sec:authentication property="principal.member.nickname"/>">
					</div>
				</td>
				<td>
					<input type="button" class="btn"
						style="width: 90%; height: 65%; margin-left: 10%"
						onclick="nickcheck();" name="checkNiDup" id="checkNiDup" value="중복확인">
					<font id="niDupSuc" size="2" style="display: none; color: #B337B3; padding: 4%;">중복확인완료</font>	
					<input type="hidden" name="checkNiBox" value="y">	
				</td>
			</tr>
			<tr>
				<td style="text-align: center;">아이디</td>
				<td>
					<div class="form-group" style="margin-top: 4%; height: 30px;">
						<input type="text" class="form-control" id="id" name="id"
							value="<sec:authentication property="principal.member.id"/>"  readonly="readonly">
					</div>
				</td>
				<td></td>
			</tr>
			<tr>
				<td style="text-align: center;">비밀번호</td>
				<td>
					<div class="form-group">
						<input type="password" class="form-control" id="upPw" name="password"
							placeholder="8자 이상의 영문+숫자+특수문자 조합" required
							pattern="^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+])(?!.*[^a-zA-z0-9$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$">
					</div>
				</td>
				<td></td>
			</tr>
			<tr>
				<td style="text-align: center;">비밀번호확인</td>
				<td>
					<div class="form-group">
						<input type="password" class="form-control" id="upPwCon" required>
					</div>
				</td>
				<td style="padding: 4%;">	
					<font id="checkPw" size="2"></font>	
				</td>
			</tr>
			<tr>
				<td style="text-align: center;">이메일</td>
				<td>
					<div class="form-group">
						<input type="email" class="form-control" id="email" name="email" required
							value="<sec:authentication property="principal.member.email"/>" readonly="readonly">
					</div>
				</td>
				<td>
					<input type="button" class="btn"
						style="width: 90%; height: 65%; margin-left: 10%; display: none;"
						id="sendEmail" value="이메일전송">
					<input type="button" class="btn"
						style="width: 90%; height: 65%; margin-left: 10%;" id="emailUpt" value="이메일변경">
					<!-- <input type="hidden" name="emailUptBox" value="y"> -->
				</td>
			</tr>
			<tr id="emailTr" style="display: none;">
				<td style="text-align: center;">이메일 인증번호</td>
				<td>
					<div class="form-group">
						<input type="text" class="form-control" name="emailCon" id="authKey">
					</div>
				</td>
				<td>
					<input type="button" class="btn"
						style="width: 90%; height: 65%; margin-left: 10%" id="authKeyC" value="이메일 확인">
					<input type="hidden" name="authKeyCBox" value="y">
					<div class="compare-text"></div>
				</td>
			</tr>
			<tr>
				<td style="text-align: center;">주소</td>
				<td>
					<div class="form-group" style="margin-top: 2%;">
						<input type="text" class="form-control" id="postCode"
							name="postCode" placeholder="우편번호" required="required" size="25" required
							value="<sec:authentication property="principal.member.postCode"/>" readonly>
					</div>
				</td>
				<td><input type="button" onclick="DaumPostcode()" class="btn"
					style="width: 90%; height: 65%; margin-left: 10%" value="우편번호 찾기 ">
				</td>
			</tr>
			<tr>
				<td></td>
				<td>
					<div class="form-group" style="margin-top: 2%;">
						<input type="text" class="form-control" id="roadAddress"
							name="roadAddress" placeholder="도로명주소" size="35" required="required"
							value="<sec:authentication property="principal.member.roadAddress"/>" readonly>
					</div>
				</td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td>
					<div class="form-group" style="margin-top: 2%;">
						<input type="text" class="form-control" id="detailAddress"
							name="detailAddress" placeholder="상세주소" size="35" required="required" value="<sec:authentication property="principal.member.detailAddress"/>">
					</div>
				</td>
				<td></td>
			</tr>

		</tbody>
	</table>
	<div style="text-align: center;">
		<button type="submit" class="btn" style="margin-bottom: 3%" id="updateSubmit">수정완료</button>
		<a class="btn" style="margin-bottom: 3%" data-toggle="modal" data-target="#myModal">회원탈퇴</a>
		<!-- Modal -->
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog">
					<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">
							<strong>회원탈퇴하기</strong>
						</h4>
					</div>
					<div class="modal-body text-center">
						<p>
							정말 탈퇴 하시겠습니까?
						</p>
					</div>
					<div class="modal-footer">
						<button style="text-align: center;" type="button" class="btn btn-default" data-dismiss="modal" id="alert" >탈퇴</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>



<!-- 닉네임 중복체크 -->
<script>

$(function(){ $("#upNickName").change(function(){
	$("#niDupSuc").hide();
	$("#checkNiDup").show();
	$("input[name=checkNiBox]").val('');
	
});
	
});



function nickcheck(){
	nickname = $("#upNickName").val();
	
	$.ajax({
	    url: 'nickCheck.do',
	    type: 'POST',
	    //dataType: 'text', //(생략가능)
	    contentType : 'text/html; charset=utf-8;',//내가 서버로 보내는 데이터의 타입
	    //text/html이랑 text/plain이랑 차이점 알아두기
	    data: nickname ,
		beforeSend : function(xhr){
			xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		},
	    success: function(data){
	         if(data == 0){
	         alert("사용하실 수 있는 닉네임입니다.");
	         $("#niDupSuc").show();
	     	$("#checkNiDup").hide();
	     	$("input[name=checkNiBox]").val('y');
	         
	         }else{
	         	alert("중복된 닉네임이 존재합니다.");
	         	$("#niDupSuc").hide();
	  	     	$("#checkNiDup").show();
	  	     	$("input[name=checkNiBox]").val('');
	         }
	    },
	    error: function (){                   
	    }
	  });
}
</script>

<!-- 이메일변경 클릭시 -> 인증번호버튼보이게 (hidden value="")-->
<script>
	$(function(){ $("#emailUpt").click(function(){
		$("#sendEmail").css("display","block");
		$("#emailUpt").css("display","none");
		$("#emailTr").show();
		$("#email").attr("readonly",false);
		$("input[name=authKeyCBox]").val('');
	});

	});
	
</script>

<!-- 이메일 인증  -->

<script>

var authKey;
$(function () {$("#sendEmail").click(function(){
	var mail = $("#email").val()
	
	if (mail == ""){
		alert("메일 주소가 입력되지 않았습니다.");
	}else {
		authKey = '';
		$.ajax({
			url : "sendEmail.do",
			type : "POST",
			//contentType : 'text/html; charset=utf-8;',
			data: {mail : mail},
			dataType: "json",
			beforeSend : function(xhr){
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			success: function(data){
				alert(data.key);
				authKey = data.key;
				alert("인증번호가 전송되었습니다.");
				isCertification=true; //추후 인증 여부를 알기위한 값
			},
		    error: function (request,status,errorData){   
		    	alert('error code: '+request.status+"\n"
		    			+'message:' +request.reponseText+'\n'
		    			+ 'error :'+  errorData);
		    }
		});
	}
});
});
	


$(function () {$("#authKeyC").click(function() {
	if($("#authKey").val() == ""){
		alert("인증번호를 입력해주세요.");
		isCertification = false;
	}else if ($("#authKey").val() == authKey) {   //인증 키 값을 비교를 위해 텍스트인풋과 벨류를 비교
		$(".compare-text").text("인증 성공!").css("color", "black");
		$("input[name=authKeyCBox]").val('y');  //인증 성공여부 check
	} else {
		$(".compare-text").text("불일치!").css("color", "red");
		$("input[name=authKeyCBox]").val(''); //인증 실패
	}
});
});

</script>



<!-- 탈퇴하기 버튼클릭시 팝업창 -->
<script>
 $(function(){$('#alert').on('click',function(){
		 var id = $("#id").val()
		$.ajax({
			url : "secession.do",
		    type: 'POST',
		    contentType : 'text/html; charset=utf-8;',//내가 서버로 보내는 데이터의 타입
		    data: id ,
			beforeSend : function(xhr){
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			success: function(data){
				if(data == 1){
					alert("회원 탈퇴가 완료되었습니다."); 
					window.location.href = "main.do"
			    }else{
			         alert("다시한번 시도해주세요.");
			    }
			},
		    error: function (request,status,errorData){   
		    	alert('error code: '+request.status+"\n"
		    			+'message:' +request.reponseText+'\n'
		    			+ 'error :'+  errorData);
		    }
		});
	}); 
 });
</script>

<script>
// 비밀번호 일치여부
$(function(){
    $('#upPw').keyup(function(){
      $('#checkPw').html('');
    });

    $('#upPwCon').keyup(function(){
        if($('#upPw').val() != $('#upPwCon').val()){
          $('#checkPw').html('비밀번호 불일치');
          $('#checkPw').attr('color', 'red');
        } else{
          $('#checkPw').html('비밀번호 일치');
          $('#checkPw').attr('color', '#B337B3');
        }
    });
});

//닉네임, 이메일인증, 이메일번호 확인
$(function(){
	$("#checkNiDup").click(function(){
		$("input[name=checkNiBox]").val('y');
	})
	$("#updateSubmit").click(function(){
		if($("input[name=checkNiBox]").val()==''){
			alert("닉네임 중복체크를 해주세요.");
			$("input[name=checkNiDup]").focus();
			return false;
		}else if($("input[name=authKeyCBox]").val()==''){
			alert("인증번호 확인 해주세요.");
			$("input[name=emailCon]").focus();
			return false;
		}
	})
})
</script>

