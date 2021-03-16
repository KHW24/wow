<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <div class="container ">
    <!--이미지 슬라이드-->
    <div class="row center-block">
      <div class="col-sm-10">
        <div id="myCarousel" class="carousel slide" data-ride="carousel">
          <!-- Indicators -->
          <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
          </ol>

          <!-- Wrapper for slides -->
          <div class="carousel-inner">
            <div class="item active">
              <img src="${pageContext.request.contextPath}/resources/images/macaron.jpg" alt="이미지">
            </div>

            <div class="item">
              <img src="${pageContext.request.contextPath}/resources/images/macaron2.jpg" alt="이미지">
            </div>

            <div class="item">
              <img src="${pageContext.request.contextPath}/resources/images/macaron3.jpg" alt="이미지">
            </div>
          </div>

          <!-- Left and right controls -->
          <a class="left carousel-control" href="#myCarousel" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="right carousel-control" href="#myCarousel" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right"></span>
            <span class="sr-only">Next</span>
          </a>
        </div>
      </div>
    </div>
    <!--유저 프로필, 닉네임, 주소, 쪽지보내기,신고하기-->
    <table class="userInfo">
      <tr>
        <td><img src="${pageContext.request.contextPath}/resources/images/userimage.jpg" /></td>
        <td>
          <span class="user-info"><strong>하이d</strong></span><br>
          <span class="user-info">춘천시 우두동</span>
        </td>
        <td><button class="btn btn-default">쪽지보내기</button></td>
        <td><button class="btn btn-default">신고하기</button></td>
      </tr>
      <tr>
        <td class="heart"><img src="${pageContext.request.contextPath}/resources/images/heart.png"/>
        </td>
        <td colspan="2" class="title">
          <strong>마카롱 팝니다</strong>
        </td>
        <td>
          <select class="form-control" >
            <option>판매중</option>
            <option>판매완료</option>
          </select>
        </td>
      </tr>
    </table>
    <div class="row">
      <div class="col-sm-offset-9">
        <span class="read-count"><strong>0 조회</strong></span>
      </div>
    </div>
    <!--글내용-->
    <div class="row">
      <div class="col-sm-10 contents">
       <pre> 
         ☆☆☆ 12가지맛 라인업! ☆☆☆

 

안녕하세요 우두동에 살고 있는 "하율맘" 입니다

요즘 마카롱을 굽다가 보니 점점 손이 커져서 이렇게 이곳에 판매를 해보려고 합니다.. ^^ 

많이 만들지는 못해서 한 10분에게 판매할 수 있을것 같아요~ 

우두동 주변까지만 배송 가능한데

문의사항 편하게 쪽지 주시면 자세히 답변 드릴게요 ㅎㅎ

 

☆ 평일주문 및 배송 ↓↓↓

 

☞ 주문접수후 2일이내 배송




댓글로 주문부탁드립니다(선착순 10명)
        </pre>
</div>
</div>
<!--댓글-->
<div class="row">  
  <div class="col-sm-10 comments-hr">
  <br>
  <span class="comments-title"><strong>댓글[0]</strong></span>
  <div class="comments">
    <div class="comment">
      <span class="comments-title"><strong>조멜론</strong></span>&nbsp;&nbsp;<span>2021-03-15</span><br>
      <span>저 사고 싶어요!!!</span>
    </div>
    <div class="reply comment">
      <span class="glyphicon glyphicon-hand-right"></span>
      <span class="comments-title"><strong>조멜론</strong></span>&nbsp;&nbsp;<span>2021-03-15</span><br>
      저 사고 싶어요!!!
    </div>
    <div class="comment">
      <span class="comments-title"><strong>조멜론</strong></span>&nbsp;&nbsp;<span>2021-03-15</span><br>
      <span>저 사고 싶어요!!!</span>
    </div>
  </div>
  <div class="row">
    <div class="col-sm-offset-10">
      <button class="btn btn-default">글 수정</button>
      <button class="btn btn-default">글 삭제</button>
      <br><br>
    </div>
  </div>
</div>
</div>
<!--댓글 등록버튼-->
  <div class="row comments-btn">
    <div class="col-sm-8">
      <input type="text" placeholder="댓글을 입력하세요." class="form-control">
    </div>
    <div class="col-sm-3">
      <button class="btn btn-default">댓글등록</button>
    </div>
  </div>
    </div><!--//div.container-->