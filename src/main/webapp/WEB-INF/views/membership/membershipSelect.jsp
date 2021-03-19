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
  <div class="container">
    <div class="page-title">
      멤버십 결제
    </div>
    <div class="row contents">
      <div class="col-sm-4 test">
        <span>1주 멤버십</span><br>
        <img src="${pageContext.request.contextPath}/resources/images/membership1.png" class="mshipImg"/>
        <br>
        <span>1,000원</span><br>
        <span class="description">일주일간 검색 상위노출</span><br><br>
        <a href="mshippay.do"><button class="btn btn-default">결제하기</button></a>
      </div>
      <div class="col-sm-4 test">
        <span>2주 멤버십</span><br>
        <img src="${pageContext.request.contextPath}/resources/images/membership2.png" class="mshipImg"/>
        <br>
        <span>1,000원</span><br>
        <span class="description">이주일간 검색 상위노출</span><br><br>
        <a href="mshippay.do"><button class="btn btn-default">결제하기</button></a>
      </div>
      <div class="col-sm-4 test">
        <span>한달 멤버십</span><br>
        <img src="${pageContext.request.contextPath}/resources/images/membership3.png" class="mshipImg"/>
        <br>
        <span>1,000원</span><br>
        <span class="description">한 달동안 검색 상위노출</span><br><br>
        <a href="mshippay.do"><button class="btn btn-default">결제하기</button></a>
        <br><br><br>
      </div>
    </div>
  </div>