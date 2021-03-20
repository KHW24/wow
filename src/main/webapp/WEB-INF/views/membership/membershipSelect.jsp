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
IMP.init('imp88302713');
IMP.request_pay({
    pg : 'inicis', //가맹점 식별코드
    pay_method : 'card',
    merchant_uid : 'merchant_' + new Date().getTime(),
    name : '주문명:결제테스트',
    amount : bt.value, //판매 가격
    
    //로그인한 세션 회원정보 스크립트태그로 넣어주면된다.
    buyer_email : 'iamport@siot.do',
    buyer_name : '구매자이름',
    buyer_tel : '010-1234-5678',
    buyer_addr : '서울특별시 강남구 삼성동',
    buyer_postcode : '123-456'
}, function(rsp) {
    if ( rsp.success ) {
        var msg = '결제가 완료되었습니다.';
        msg += '고유ID : ' + rsp.imp_uid;
        msg += '상점 거래ID : ' + rsp.merchant_uid;
        msg += '결제 금액 : ' + rsp.paid_amount;
        msg += '카드 승인번호 : ' + rsp.apply_num;
    } else {
        var msg = '결제에 실패하였습니다.';
        msg += '에러내용 : ' + rsp.error_msg;
    }
    alert(msg);
});
}
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
        <button class="btn btn-default" onclick="button_click(this);" value="1200">결제하기</button>       
		
      </div>
      <div class="col-sm-4 test">
        <span>2주 멤버십</span><br>
        <img src="${pageContext.request.contextPath}/resources/images/membership2.png" class="mshipImg"/>
        <br>
        <span>2,000원</span><br>
        <span class="description">이주일간 검색 상위노출</span><br><br>
        <button class="btn btn-default" onclick="button_click(this);" value="2000">결제하기</button>
      </div>
      <div class="col-sm-4 test">
        <span>한달 멤버십</span><br>
        <img src="${pageContext.request.contextPath}/resources/images/membership3.png" class="mshipImg"/>
        <br>
        <span>3,500원</span><br>
        <span class="description">한 달동안 검색 상위노출</span><br><br>
        <button  class="btn btn-default" onclick="button_click(this);" value="3500">결제하기</button>
        <br><br><br>
      </div>
    </div>
  </div>