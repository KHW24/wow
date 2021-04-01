<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
 <style>
  .page-title{
    text-align: center;
    line-height: 150px;
    font-size: 25px;
    font-weight: bold;
  }
  .test{
    text-align: center;
    font-size:20px;
    font-weight: bolder;
  }
  .contents{
    margin:0 auto;
  }
  .description{
    font-size:15px;
  }
  .mshipImg {
    width:200px;
    height:200px;
    margin: 20px 0;
  }
  </style>
  
<!-- 아임포트  -->  
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script>
function button_click(bt) {
	IMP.init('imp39894942');
	IMP.request_pay({
	    pg : 'kakaopay', //가맹점 식별코드
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : bt.id, // 멤버십명
	    amount : bt.value, //판매 가격
	    
	    //로그인한 세션 회원정보 스크립트태그로 넣어주면된다.
	    buyer_email : 'iamport@siot.do',
	    buyer_name : '구매자이름',
	    buyer_tel : '010-1234-5678',
	    buyer_addr : '서울특별시 강남구 삼성동',
	    buyer_postcode : '123-456'
	}, function(rsp) {
		console.log("dd")
	    if ( rsp.success ) {
	    	console.log("성공")
	    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
	    	jQuery.ajax({
	    		var header = "${_csrf.headerName}"; 
	            var token = "${_csrf.token}";
	            $(document).ajaxSend(function(e,xhr, options){
	                xhr.setRequestHeader(header, token); 
	             });
	    		url: "paySuccess.do", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
	    		type: 'POST',
	    		dataType: 'json',
	    		data: {
		    		imp_uid : rsp.imp_uid
		    		//기타 필요한 데이터가 있으면 추가 전달
	    		}
	    	}).done(function(data) {
	    		//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
	    		console.log(data)
	    		if ( everythings_fine ) {
	    			var msg = '결제가 완료되었습니다.';
	    			msg += '\n고유ID : ' + rsp.imp_uid;
	    			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
	    			msg += '\결제 금액 : ' + rsp.paid_amount;
	    			msg += '카드 승인번호 : ' + rsp.apply_num;

	    			alert(msg);
	    		} else {
	    			//[3] 아직 제대로 결제가 되지 않았습니다.
	    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
	    		}
	    	});
	    } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;

	        alert(msg);
	    }
	});
}

//function button_click(bt) {
//	IMP.init('imp80340117');
//	IMP.request_pay({
//	    pg : 'kcp', //가맹점 식별코드
//	    pay_method : 'card',
//	    merchant_uid : 'merchant_' + new Date().getTime(),
//	    name : bt.id, // 멤버십명
//	    amount : bt.value, //판매 가격
	    
//	    //로그인한 세션 회원정보 스크립트태그로 넣어주면된다.
//	    buyer_email : 'iamport@siot.do',
//	    buyer_name : '구매자이름',
//	    buyer_tel : '010-1234-5678',
//	    buyer_addr : '서울특별시 강남구 삼성동',
//	    buyer_postcode : '123-456'
//	}, function(rsp) {
//	    if ( rsp.success ) {
//	        var msg = '결제가 완료되었습니다.';
//	        msg += '고유ID : ' + rsp.imp_uid;
//	        msg += '상점 거래ID : ' + rsp.merchant_uid;
//	        msg += '결제 금액 : ' + rsp.paid_amount;
//	        msg += '카드 승인번호 : ' + rsp.apply_num;
//	    } else {
//	        var msg = '결제에 실패하였습니다.';
//	        msg += '에러내용 : ' + rsp.error_msg;
//	    }
//	    alert(msg);
//	    //	});
//	}

</script>
  
 
  <div class="container">
    <div class="page-title">
      멤버십 결제
    </div>
    <div class="row contents">
      <div class="col-sm-4 test">
        <span>1주 멤버십</span><br>
        <img src="${pageContext.request.contextPath}/resources/images/membership1.png" class="mshipImg"/>
        <br>
        <span>1,200원</span><br>
        <span class="description">일주일간 검색 상위노출</span><br><br>
        <button class="btn btn-default" onclick="button_click(this);" id="1주 멤버십" value="1">결제하기</button>       
		
      </div>
      <div class="col-sm-4 test">
        <span>2주 멤버십</span><br>
        <img src="${pageContext.request.contextPath}/resources/images/membership2.png" class="mshipImg"/>
        <br>
        <span>2,000원</span><br>
        <span class="description">이주일간 검색 상위노출</span><br><br>
        <button class="btn btn-default" onclick="button_click(this);" id="2주 멤버십" value="2000">결제하기</button>
      </div>
      <div class="col-sm-4 test">
        <span>한달 멤버십</span><br>
        <img src="${pageContext.request.contextPath}/resources/images/membership3.png" class="mshipImg"/>
        <br>
        <span>3,500원</span><br>
        <span class="description">한 달동안 검색 상위노출</span><br><br>
        <button  class="btn btn-default" onclick="button_click(this);" id="한달 멤버십" value="3500">결제하기</button>
        <br><br><br>
      </div>
    </div>
  </div>
  
  