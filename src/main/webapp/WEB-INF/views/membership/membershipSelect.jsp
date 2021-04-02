<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	    pg : 'kcp', //가맹점 식별코드
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : bt.id, // 멤버십명
	    amount : bt.value, //판매 가격
	   // <sec:authorize access="isAuthenticated()"> /* 인증된 사용자가 맞다면 */
	    buyer_email : '<sec:authentication property="principal.member.email"/>',
	    buyer_id :'<sec:authentication property="principal.member.id"/>',
	    buyer_name : '<sec:authentication property="principal.member.nickname"/>',
	    buyer_addr : '<sec:authentication property="principal.member.roadAddress"/>',
	    buyer_postcode : '<sec:authentication property="principal.member.postCode"/>'
	   // </sec:authorize>
		// <sec:authorize access="isAnonymous()"></sec:authorize>
	
	}, function(rsp) {
	    if ( rsp.success ) {
	    	location.href="paySuccess.do";
	    	$.ajax({
	    		url: "paySuccess.do", 
	    		type: 'GET',
	    		dataType: 'json',
	    		data: {
		    		imp_uid : rsp.imp_uid,
		    		amount : bt.value,	// 멤버십 가격
		    		name : bt.id,		// 멤버십명
		    		buyer_id : "<sec:authentication property='principal.member.id'/>"	// 아이디
	    		},
	    	}).done(function(data) {
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
</script>

<sec:authorize access="isAuthenticated()">
<sec:authentication var="loginId" property='principal.member.id'/>
</sec:authorize>
<c:if test="${not empty loginId}">
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
        <button class="btn btn-default" onclick="button_click(this);" id="1주 멤버십" value="1200">결제하기</button>       
		
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
   

</c:if> 
<c:if test="${empty loginId}"></c:if>
