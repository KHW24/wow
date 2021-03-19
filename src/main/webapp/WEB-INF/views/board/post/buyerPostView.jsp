<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
/* 이미지 슬라이드 크기 조정 */
  .item>img{
   min-width:100%;
   min-height:500px;
   max-height:500px;
 }
 /* 닉네임,주소, 댓글,댓글등록버튼 마진 조정 */
 .userInfo, .comments, .comments-btn{
   margin: 20px;
 }
 /* 닉네임,주소 부분 크기 조정 */
 .userInfo tr td:nth-of-type(2){
   width:900px;
 }
/* 닉네임, 조회수, 댓글 글씨크기 조정 */
 .user-info, .read-count, .comments-title{
   font-size: 16px;
 }
 /* 글제목 크기 조정 */
 .title{
   font-size:22px;
 }
 /* 유저 프로필 사진, 좋아요 하트 이미지 크기 */
 .user-info-img{
  width:70px;
  height:70px;
 }
 /* 좋아요 구분자  */
 .heart{
   border-right:2px solid #cccc;
 }
 /* 글제목 패딩 */
 .title{
   padding-left:30px;
 }
 /* 글내용 스타일 */
 pre{
   background-color: white;
   border:none;
   text-align: center;
 }
 /* 섹션별 구분자 */
 .userInfo tr:nth-of-type(2), .section-hr{
   border-bottom: 2px solid #cccc;
 }
 /* 대댓글 들여쓰기 */
 .reply{
   margin-left:20px;
 }
 /* 댓글별 마진 */
 .comment{
   margin-top:20px;
 }

/* 센터 부분 */
 .wrapper{
   color:black;
   font-size:15px;
 }
</style>
 <div class="container wrapper">
    <br><br>
    <!--이미지 슬라이드-->
    <div class="row">
      <div class="col-sm-12">
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
     <div class="row">
        <div class="col-sm-12 section-hr">
    	<table class="userInfo">
      <tr>
        <td><a href="otherList.do"><img src="${pageContext.request.contextPath}/resources/images/userimage.jpg" class="user-info-img" /></a></td>
        <td>
          <a href="otherList.do"><span class="user-info"><strong>하이d</strong></span></a><br>
          <span class="user-info">춘천시 우두동</span>
        </td>
        <td><button class="btn btn-default">쪽지보내기</button></td>
        <td><button class="btn btn-default">신고하기</button></td>
      </tr>
      <tr>
        <td class="heart"><img src="${pageContext.request.contextPath}/resources/images/heart.png" class="user-info-img"/>
        </td>
        <td colspan="3" class="title">
          <strong>마카롱 팝니다</strong>
        </td>
      </tr>
    </table>
    </div>
    </div>
    <div class="row">
      <div class="col-sm-12 text-right">
      <br>
        <span class="read-count"><strong>0 조회</strong></span>
      </div>
    </div>
    <!--글내용-->
    <div class="row">
      <div class="col-sm-12 section-hr">
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
  <div class="col-sm-12 section-hr">
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
</div>
</div>
<!--댓글 등록버튼-->
  <div class="row text-center">
    <div class="col-sm-9">
    	<br>
      <input type="text" placeholder="댓글을 입력하세요." class="form-control">
    </div>
    <div class="col-sm-3">
    	<br>
      <button class="btn btn-default">댓글등록</button>
        <br><br><br><br>
    </div>
  </div>
    </div><!--//div.container-->