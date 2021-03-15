<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 <div class="container">
    <div class="row">
      <div class="col-sm-10 payment-method-hr ">
    <div class="page-title">
      결제정보
    </div>
    </div>
  </div>
    <div class="row">
      <div class="col-sm-10  payment-method-hr">
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
      <div class="col-sm-10 total">
        <br><br>
       <span class="amount"> 최종 결제 금액: 1,200원 결제 [7일 멤버십] <span>
        <br><br>
        <button class="btn btn-default">결제하기</button>
        <button class="btn btn-default">결제취소</button>
      </div>
    </div>

  </div>
  </div><!--div.container-->