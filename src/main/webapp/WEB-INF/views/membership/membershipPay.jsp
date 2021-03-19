<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
 .page-title{
    text-align: center;
    line-height: 150px;
    font-size: 25px;
    font-weight: bold;
  }
  .payment-method-title{
    width:500px;
  }
  table{
    text-align: center;
    font-size:20px;
  }
  table tr{
    height:100px;
  }
  .payment-method-hr{
    border-bottom:2px solid #cccc;
  }
  .amount{
   font-size:25px;
   font-weight: bolder; 
  }
  .total{
    text-align: center;
  }
</style>

 <div class="container">
    <div class="row">
      <div class="col-sm-12 payment-method-hr ">
    <div class="page-title">
      결제정보
    </div>
    </div>
  </div>
    <div class="row">
      <div class="col-sm-12  payment-method-hr">
        <table>
            <tr>
              <td rowspan="3"  class="payment-method-title"><strong>결제방법</strong></td>
              <td><label><input type="radio" name="payment-method"/>&nbsp;&nbsp;무통장입금</label></td>
            </tr>
            <tr>
              <td><label><input type="radio" name="payment-method"/>&nbsp;&nbsp;신용카드</label></td>
            </tr>
            <tr>
              <td><label><input type="radio" name="payment-method">&nbsp;&nbsp;실시간 계좌이체</label></td>
            </tr>
        </table>  
      </div>
    <div class="row">
      <div class="col-sm-12 total">
        <br><br>
       <span class="amount"> 최종 결제 금액: 1,200원 결제 [7일 멤버십] <span>
        <br><br>
        <a href="paySuccess.do"><button class="btn btn-default">결제하기</button></a>
        <a href="javascript:history.back()"><button class="btn btn-default">결제취소</button></a>
        <br><br><br><br>
      </div>
    </div>

  </div>
  </div><!--div.container-->