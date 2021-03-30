<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KH Community</title>
<!-- 부트스트랩 css 사용 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- jQuery library -->
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- 반응형 웹 디자인 적용 -->
<!-- <meta name="viewport" content="width=device width">-->
<style>
/* html {
   background: url(resource/KakaoTalk_20210128_101406084.png) no-repeat center center fixed;
   -webkit-background-size: cover;
   -moz-background-size: cover;
   -o-background-size: cover;
   background-size: cover;
} */
textarea:focus {
   outline: none;
}
</style>
</head>
<body>
   <!-- header -->
   <div class="p-3 my-3 bg-white text-center" style="margin-bottom: 0;">
      <h1 class="title">OSOL</h1>
      <p>KH 커뮤니티에 오신 것을 환영합니다</p>
   </div>
   <!-- login/sign up -->
   <!-- login 상태일 때 -->
   <c:if test="${not empty userId}">
      <div class="mini-navbar" style="text-align: right;">
         <span>${userId}님 환영합니다.</span>&nbsp;|&nbsp; <span><a
            class="mini-item" href="/mypage/view">마이페이지</a>&nbsp;|&nbsp;
            <a class="mini-item" onclick="return confirm('로그아웃 하시겠습니까?')" href="/logout">로그아웃</a></span>
      </div>
   </c:if>
   <!-- 비 로그인 상태일때 -->
   <c:if test="${empty userId}">
   <div class="mini-navbar" style="text-align: right;">
      <span><a class="mini-item" href="/login">로그인 </a></span>&nbsp;|&nbsp;
      <span><a class="mini-item" href="/join">회원가입</a></span>   
   </div>
   </c:if>
   <!-- navbar -->
   <nav
      class="navbar navbar-expand-sm bg-dark justify-content-center navbar-dark">
      <ul class="navbar-nav">
         <li class="nav-item"><a class="nav-link " href="/main">Home</a></li>
         <li class="nav-item"><label class="nav-link disabled">|</label></li>
         <li class="nav-item"><a class="nav-link" href="/freeboard/list">자유게시판</a></li>
         <li class="nav-item"><label class="nav-link disabled">|</label></li>
         <li class="nav-item"><a class="nav-link" href="/jobBoard/list">취업게시판</a></li>
         <li class="nav-item"><label class="nav-link disabled">|</label></li>
         <li class="nav-item"><a class="nav-link" href="/foodboard/list">맛집정보</a></li>
         <li class="nav-item"><label class="nav-link disabled">|</label></li>
         <li class="nav-item"><a class="nav-link" href="/studyboard/list">스터디모집</a></li>
         <li class="nav-item"><label class="nav-link disabled">|</label></li>
         <li class="nav-item"><a class="nav-link" href="/qnaboard/board">Q n A</a></li>
      </ul>
   </nav>
   <br>
   <!-- view-main -->
   <h3 class="text-center">자유 게시판</h3>
   <br>
   <div class="container" id="main">
      <table class="table">
         <tbody class="tbody-dark text-center">
            <tr class="text-center">
               <td style="width: 20%;">글 제목</td>
               <td colspan="2" style="text-align: left;">${boardVO.boardTitle}</td>
            </tr>
            <tr class="text-center">
               <td>작성자</td>
               <td colspan="2" style="text-align: left;">${boardVO.boardWriter}</td>
            </tr>
            <tr class="text-center">
               <td>작성일</td>
               <td colspan="2" style="text-align: left;">${boardVO.boardPubDate}</td>
            </tr>
            <tr class="text-center">
               <td colspan="3"
                  style="height: 500px; text-align: left; word-break: break-all">
                  ${boardVO.boardContent}</td>
            </tr>
            <tr class="text-center">
               <td colspan="3" style="height: 200px; text-align: left;"><b>댓글</b>
                  <form>
                     <!-- action="/comment" method="post" -->
                     <table class="table table-bordered">
                        <tbody class="tbody dark text-center">
                           <tr class="text-center">
                              <td style="text-align: left; height: 150px;" id="writern"><h6
                                    style="display: inline">${userId}</h6> <br> <input
                                 type="hidden" name="bNum" id="bNum"
                                 value="${boardVO.boardId}"> <input type="hidden"
                                 name="id" value="${param.id}"> <textarea
                                    style="border: none; resize: none" rows="3" cols="146"
                                    id="content" name="comment" placeholder="댓글을 작성하세요"></textarea><br>
                                 <input type="hidden" id="userid" value="${userId}"> <input
                                 type="button" class="btn btn-md btn-primary"
                                 style="float: right;" id="write" value="등록"></td>
                           </tr>
                        </tbody>
                     </table>
                  </form>
                  <div id="comment_box">
                     <!-- Single Comment -->
                  </div></td>
            </tr>
         </tbody>

      </table>
      <a href="/freeboard/list" class="btn btn-primary">목록</a>
      <!-- 만약 해당글의 작성자가 본인이라면 -->
      <c:if test="${boardVO.boardWriter == userId}">
         <a href="/freeboard/detail?num=${boardVO.boardNum}"
            class="btn btn-primary">수정</a>
         <a href="/freeboard/delete?id=${boardVO.boardId}"
            onclick="return confirm('정말 삭제하시겠습니까?')" class="btn btn-primary">삭제</a>
      </c:if>
   </div>
   <!-- footer -->
   <div style="height: 100px;"></div>
   <script>
      $(function(){
         if($('#userid').val().length == 0){
            $("#write").attr('disabled', true);
                  $("#write").css('background', 'gray' );
                  $("#write").css('border', '1px solid gray' );
                  $("#content").attr('placeholder', '댓글을 등록 하시려면 로그인하세요' );
                  $("#content").keyup(function(){
                     location.href="/login"
                  })
               }else{
                  $("#write").attr('disabled', false);
               }
         
         $("#write").click(function() {
            content = $("#content").val();
               console.log(content);
                  $.ajax({
                  type : "post",
                  url : "/freeboard/comment",
                  data : {
                     "content" : content,
                     "userid" : $("#userid").val(),
                     "bNum" : $("#bNum").val()
                  },
                  dataType : "json",
                  success : function(result) {
                     $("#content").val('');
                     if (result == 1) {
                        getList();
                     }
                  }
               })
            });
         
         getList();
         
            $("#comment_box").on('click','.cmtmod',function() {
               var parent = $(this).parent();
               var content1 = parent.children().last().html();
               var content2 = content1.replace(/<br>/g,'\n');
               var num = parent.next().val();
               var id = parent.children().first().text();
               
              output='';
               output +='<form>';
               output +='<table class="table table-bordered">';
               output +='<tbody class="tbody dark text-center">';
               output +='<tr class="text-center">';
               output +='<td style="text-align: left; height: 150px;" id="writern"><h6 style="display: inline">'+id+'</h6>';
               output +='<br> <input type="hidden" name="bNum" id="bNum value="${boardVO.boardId}"> <input type="hidden" name="id" value="${param.id}">';
               output +='<textarea style="border: none; resize: none" rows="3" cols="146" id="content" name="comment" placeholder="댓글을 작성하세요">'+content2+'</textarea><br>';
               output +='<input type="hidden" id="userid" value="'+id+'">';
               output +='<input type="hidden" id="cmtnum" value="'+num+'">';
               output +='<input type="button" class="btn btn-md btn-primary cmtcancle" style="float: right;" value="취소">';
               output +='<input type="button" class="btn btn-md btn-primary commentmod" style="float: right;" value="수정"></td> ';
               output +='</tr></tbody></table>';
               output +='</form>';
               parent.empty();
               parent.append(output);
            });
         
         $("#comment_box").on('click','.cmtcancle',function() {
            getList();
         }); 
         
            $("#comment_box").on('click','.commentmod',function() {
               var comment = $(this).prev().prev().prev().prev().prev().val();
               var num = $(this).prev().prev().val();
                $.ajax({
                  type : "post",
                  url : "/freeboard/comment/update",
                  data : {
                     "comment" : comment,
                     "num" : num
                  },
                 success : function(result) {
                    if(result == 1){
                       getList();
                    }
                 } 
                  
               }); 
               
           });
          
             $("#comment_box").on('click','.cmtdel',function() {
               if(confirm("정말 삭제하시겠습니까?")){
               var parent = $(this).parent();
               var num = parent.next().val();
               var depth = parent.next().next().val();
               console.log(num);
                 $.ajax({
                  type : "post",
                  url : "/freeboard/comment/delete",
                  data : {
                     "num" : num,
                     "depth" : depth
                  },
                 success : function(result) {
                    if(result == 1){
                       getList();
                    }
                 } 
                  
               });
               }
               
           });
          
          
               $("#comment_box").on('click','.cmtreply',function() {
                  var parent = $(this).parent();
                  var userId = "<c:out value='${boardVO.boardWriter}'/>";
                var uId = "<c:out value='${userId}'/>";
                var cmtid = parent.children().first().text();
                 var cmtnum = parent.next().val();
                 output='';
                 output +='<tbody class="tbody dark text-center">'
                 output +='<tr class="text-center">';
                 output +='<td style="text-align: left; height: 50px; word-break: break-all" id="writern">';
                  output +='<form>';
                  output +='<table class="table table-bordered">';
                  output +='<tbody class="tbody dark text-center">';
                  output +='<tr class="text-center">';
                  output +='<td style="text-align: left; height: 150px;" id="writern"><h6 style="display: inline">'+uId+'</h6>';
                  output +='<br><input type="hidden" name="id" value="${param.id}">';
                  output +='<textarea style="border: none; resize: none" rows="3" cols="146" id="content" name="comment" placeholder="댓글을 작성하세요"></textarea><br>';
                  output +='<input type="hidden" id="orginid" value="'+cmtid+'">';
                  output +='<input type="hidden" id="cmtnum" value="'+cmtnum+'">';
                  output +='<input type="button" class="btn btn-md btn-primary cmtcancle" style="float: right;" value="취소">';
                  output +='<input type="button" class="btn btn-md btn-primary replyadd" style="float: right;" value="등록"></td>';
                  output +='</tr></tbody></table>';
                  output +='</form></td></tr></tbody>';
                  parent.parent().parent().parent().next().append(output);
               });
           
         $("#comment_box").on('click','.replyadd',function() {
            var userId = "<c:out value='${boardVO.boardWriter}'/>";
            var uId = "<c:out value='${userId}'/>";
              var originid = $(this).prev().prev().prev().val();
            var cmtnum = $(this).prev().prev().val();
            var boardnum = $(this).prev().prev().prev().prev().prev().prev().val();
            var comment = $(this).prev().prev().prev().prev().prev().val();
            
              $.ajax({
                  type : "post",
                  url : "/freeboard/reply",
                  data : {
                     "originid" : originid,
                     "cmtnum" : cmtnum,
                     "boardnum" : boardnum,
                     "uId" : uId,
                     "comment" : comment
                  },
                 success : function(result) {
                    if(result == 1){
                       getList();
                    }
                 } 
               });
         });
             
             
         function getList() {
            var userId = "<c:out value='${boardVO.boardWriter}'/>";
            var Id = "<c:out value='${userId}'/>";
                $.ajax({
                   type : "post",
                   url : "/freeboard/comment/list",
                  data : {
                     "boardNum" : $("#bNum").val()
                  },
                  dataType : "json",
                  success : function(rdata) {
                     if (rdata.length > 0) {
                        $("#comment_box").empty();
                        $("#content").text('');
                        output='';
                         $(rdata).each(function(){
                          if(this.depth == 0){
                          if(this.state == 0){
                           output +='<table class="table table-bordered">';
                           output +='<tbody class="tbody dark text-center">';
                           output +='<tr class="text-center">';
                           output +='<td style="text-align: left; height: 50px; word-break: break-all" id="writern">';
                           output +='<h6 style="display: inline">'+this.writer+'</h6>';
                            if(userId == this.writer){
                           output +='<h6 style="display: inline; color: red;">(작성자)</h6>'         
                           } 
                           output +='&nbsp;&emsp;'+this.pubDate+'&nbsp;&emsp;';
                            if(Id == this.writer){
                              output +='<a class = "comment cmtmod">수정</a>&emsp; <a class = "comment cmtdel">삭제</a>&emsp;';         
                          } 
                           output +='<a class = "comment cmtreply">답글</a>';
                           output +='<br><span>'+this.content+'</span></td>';
                           output +='<input type="hidden" value="'+this.cmtNum+'">';
                           output +='<input type="hidden" value="'+this.depth+'">';
                           output +='</tr></tbody>';
                             output +='</table>';
                             output +='<div class="comment cmtreply"></div>'
                          }else if(this.state == 1){
                             output +='<table class="table table-bordered">';
                              output +='<tbody class="tbody dark text-center">';
                              output +='<tr class="text-center">';
                              output +='<td style="text-align: left; height: 50px; word-break: break-all" id="writern">';
                              output +='<span style="color:gray;">삭제된 댓글 입니다.</span></td>';
                              output +='<input type="hidden" value="'+this.cmtNum+'">';
                              output +='</tr></tbody></table>';  
                          }
                          
                         } else {
                            if(this.state == 0){
                                 output +='<table class="table table-bordered">';
                                 output +='<tbody class="tbody dark text-center">';
                                 output +='<tr class="text-center">';
                                 output +='<td style="text-align: left; height: 50px; word-break: break-all; padding-left : 50px" id="writern">';
                                 output +='<h6 style="display: inline; color : gray;">'+this.origin_writer+'</h6>&emsp;';
                                 output +='<h6 style="display: inline">'+this.writer+'</h6>';
                                 if(userId == this.writer){
                                 output +='<h6 style="display: inline; color: red;">(작성자)</h6>'         
                                 }
                                 output +='&nbsp;&emsp;'+this.pubDate+'&nbsp;&emsp;';
                                 if(Id == this.writer){
                                    output +='<a class = "comment cmtmod">수정</a>&emsp; <a class = "comment cmtdel">삭제</a>&emsp;';         
                                }
                                 output +='<br><span>'+this.content+'</span></td>';
                                 output +='<input type="hidden" value="'+this.cmtNum+'">';
                                 output +='<input type="hidden" value="'+this.depth+'">';
                                 output +='</tr></tbody>';
                                   output +='</table>';
                                   output +='<div class="comment cmtreply"></div>'
                                }else if(this.state == 1){
                                   output +='<table class="table table-bordered">';
                                    output +='<tbody class="tbody dark text-center">';
                                    output +='<tr class="text-center">';
                                    output +='<td style="text-align: left; height: 50px; word-break: break-all" id="writern">';
                                    output +='<span style="color:gray;">삭제된 댓글 입니다.</span></td>';
                                    output +='<input type="hidden" value="'+this.cmtNum+'">';
                                    output +='</tr></tbody></table>';  
                                }  
                         }
                        });
                         $("#comment_box").append(output);
                     }
                  }
               });
            }
         
         });
   </script>
</body>
</html>