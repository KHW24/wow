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

	// 아이디 중복체크
    
	function idCheck(){
		idVal = $("#joinId").val();
	
		$.ajax({
			url: "checkIdDup.do",
			type: "POST",
			data : {id: idVal}, 
			beforeSend : function(xhr){
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			dataType : 'json',
			success: function(data){
				if(data.result == 0){
					alert("사용가능한 아이디입니다.");
				}else{
					alert("중복된 아이디입니다.");
				}			
			},
			error : function(request, status, errorData){
				alert("error code: "+request.status + "\n"+"message : "+request.responseText+
						"\n"+"error : "+errorData);
				
			}
		});
	};

	// 닉네임 중복체크
	function niCheck(){
		nickVal = $("#joinName").val();
			
		$.ajax({
			url: "checkNiDup.do",
			type: "POST",
			data : {nickname: nickVal}, 
			beforeSend : function(xhr){
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			dataType : 'json',
			success: function(data){
				if(data.result == 0){
					alert("사용가능한 닉네임입니다.")
				}else{
					alert("중복된 닉네임입니다.")
				}
			},
			error: function(){
				alert("error code: "+request.status + "\n"+"message : "+request.responseText+
						"\n"+"error : "+errorData);
			}
		});
	};
	
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
	
	// 이메일 확인 
	var code ="";
	
	function mailCheck(){
		var email = $("#joinEmail").val();
		
		$.ajax({
			type: "GET",
			url: "mailCheck.do?email="+email,	
			beforeSend : function(xhr){
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			success: function(data){
				code = data;
				if(email != ""){
					alert("이메일이 전송되었습니다.");
					$("#emailBox").css("display","");
				}else{
					alert("이메일을 입력해주세요.");
				}
			},
			error: function(){
				alert("error code: "+request.status + "\n"+"message : "+request.responseText+
						"\n"+"error : "+errorData);
			}
		});
	};
	
	// 이메일 인증번호 확인
	function mailCheckCon(){
		emailConVal = $("#joinEmailCon").val();
		if(emailConVal == ""){
			alert("인증번호를 입력해주세요.")
		}else if(code == emailConVal){
			alert("인증되었습니다.")
		}else if(code != emailConVal){
			alert("인증번호를 확인해주세요.")
		}
	}
	
	// 아이디, 닉네임, 이메일인증, 이메일번호 확인
	$(function(){
		$("#checkIdDup").click(function(){
			$("input[name=idCheckBox]").val('y');
		})
		$("#checkNiDup").click(function(){
			$("input[name=niCheckBox]").val('y');
		})
		$("#emailCheck").click(function(){
			$("input[name=mailBox]").val('y');
		})
		$("#mailConCheck").click(function(){
			$("input[name=mailConBox]").val('y');
		})
		$("#joinSubmit").click(function(){
			if($("input[name=idCheckBox]").val()==''){
				alert("아이디 중복체크를 해주세요.");
				$("input[name=id]").focus();
				return false;
			}else if($("input[name=niCheckBox]").val()==''){
				alert("닉네임 중복체크를 해주세요.");
				$("input[name=nickname]").focus();
				return false;
			}else if($("input[name=mailBox]").val()==''){
				alert("이메일 인증 해주세요.");
				$("input[name=email]").focus();
				return false;
			}else if($("input[name=mailConBox]").val()==''){
				alert("인증번호 확인 해주세요.");
				$("input[name=emailCon]").focus();
				return false;
			}
		})
	})
	
	