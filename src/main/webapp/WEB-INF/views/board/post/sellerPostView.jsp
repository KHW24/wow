<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

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
   width:800px;
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
 .section-hr{
   border-bottom: 2px solid #cccc;
 }
 .comment-hr{
  border-bottom: 2px dotted #cccc;
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
<c:set var="writer" value="${list.id}"/>
<sec:authorize access="isAuthenticated()">
<sec:authentication var="loginId" property='principal.member.id'/>
</sec:authorize>

 <div class="container wrapper" >
      <!--이미지 슬라이드-->
        <div class="row" >
          <div class="col-sm-12" >
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
              <td><img src="${pageContext.request.contextPath}/resources/images/userimage.jpg" class="user-info-img"/></td>
              <td>
                <span class="user-info"><strong>${list.id }</strong></span><br>
                <span class="user-info">${list.post_address }</span>
              </td>
              <td>
              <c:if test="${!empty loginId}">
              <button class="btn btn-default" onclick="popupOpen();">쪽지보내기</button>
              </c:if>
              </td>
              <td><button class="btn btn-default">신고하기</button></td>
            </tr>
            <tr>
              <td class="heart"><img src="${pageContext.request.contextPath}/resources/images/heart.png" class="user-info-img"/>
              </td>
              <td colspan="2" class="title">
                <strong>${list.post_title }</strong>
              </td>
              <td>
              <c:if test="${writer eq loginId}">
                <select class="form-control" >
                  <option>판매중</option>
                  <option>판매완료</option>
                </select>
               </c:if>
              </td>
            </tr>
          </table>
        </div>
      </div>
      <div class="row">
        <div class="col-sm-12 text-right">
         <br>
          <span class="read-count"><strong>${list.hit } 조회</strong></span>
        </div>
      </div>
      <!--글내용-->
      <div class="row">
        <div class="col-sm-12">
          <pre>${list.post_contents}
           </pre>
        </div>
  </div>
  <div class="row">
    <div class="col-sm-12 text-right section-hr">
  <c:if test="${writer eq loginId}">
      <a href="postUpdate.do?no=${list.post_no}" class="btn btn-default">글 수정</a>
      <a href="postDelete.do?no=${list.post_no}" class="btn btn-default">글 삭제</a>
      <br><br>
  </c:if>
    </div>
  </div>
   <!--댓글-->
  <div class="row">
    <div class="col-sm-12 section-hr">
      <br>
      <span class="comments-title"><strong>댓글[<span id="cCnt"></span>]</strong></span>
      <div class="paging">
      <!-- 페이지네이션 -->
	</div>
      <div class="comments" id="comments-list">
      <!-- 댓글 내용 -->
      </div>
    </div>  
  </div>
  <!--댓글 등록버튼-->
    <div class="row text-center">
      <div class="col-sm-9">
        <br>
       <form id="replyForm" method="post" action="replyadd.do">
      
      <input type="text" placeholder="댓글을 입력하세요." name="repContents" id="repContents" class="form-control">
   	  <input type="hidden" name="postNo" id="postNo" value="${postNo}"/>
    </div>
    <div class="col-sm-3">
    	<br>
      <sec:authorize access="isAuthenticated()">
      	  <input type="hidden" name="id" id="id" value="<sec:authentication property="principal.member.id"/>" />
      </sec:authorize>
      	<input type="button" class="btn btn-default" id="reply-btn" value="댓글등록" />
      </form>
      <br><br><br>
      <div class="row">
      <div class="col-sm-12">

      </div>
      </div>
      <!-- 댓글 삭제 모달 창 -->
			<!-- Modal -->
			<div id="repModal" class="modal fade" role="dialog">
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title"></h4>
						</div>
						<div class="modal-body">
						<font color='red'>댓글을 삭제하시겠습니까?</font>
							<input type="hidden" class="modal-repSeq"/>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default modal-delete-btn"
								data-dismiss="modal">삭제</button>
						</div>
					</div>
				</div>
			</div><!-- //댓글 삭제 모달창  -->
			<br><br><br><br>
      </div>
    </div>
      </div><!--//div.container-->
      <!-- 제이쿼리 -->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
      
    <script>
      	var header = "${_csrf.headerName}"; 
		var token = "${_csrf.token}";
		
		//댓글 등록
      $(function(){
    		$("#reply-btn").click(function(){
	    		var repContents = $("#repContents").val();
    	  		var postNo = $("#postNo").val();
    	  		var id = $("#id").val();
    	  		
    	  		if(${empty loginId}){
    	  			alert("로그인한 사용자만 댓글 입력이 가능합니다. ");
    	  			location.href="${pageContext.request.contextPath}/login.do";
    	  		}else{
    	  			$.ajax({
        				type: "POST",
        				url: "${pageContext.request.contextPath}/reply/insert",
        				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        				data: {repContents : repContents, postNo : postNo, id : id},
        				beforeSend : function(xhr){
        					xhr.setRequestHeader(header, token);
        				},
        				success : function(data){
        					if(data=="success"){
        						alert("댓글이 등록되었습니다.");
        						$("#repContents").val("");
        						getReplyList(-1); 
        					}
        				},
        				error:function(request, status, error){
        					alert("code"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        				}
        			});//ajax
    	  		}
    		});//댓글 등록
      }); //window.onload
      
     $(function(){
    	getReplyList(); 
    	
     });
     
     //댓글 목록 출력
      function getReplyList(page){
    	  var header = "${_csrf.headerName}"; 
 		  var token = "${_csrf.token}";
 		  var loginId = "${loginId}";
   	  	  var clickPage = page || 1;
 		  
 		 $(document).ajaxSend(function(e,xhr, options){
    		 xhr.setRequestHeader(header, token); 
    	  });
 		 
    	  $.ajax({
    		 type: "GET",
    		 url: "${pageContext.request.contextPath}/reply/list?postNo=${postNo}&page="+clickPage,
    		success: function(data){
    			console.log(data);
    			var html = "";
				var str = "";
    			var rCntByPn = data.replyCnt;  //전체 댓글 총 갯수
    	
    			if(clickPage == -1){
    	 			 clickPage = Math.ceil(rCntByPn/10.0);
    	 			 getReplyList(clickPage);
    	 			 return;
    	 		 }
    			
    			if(rCntByPn > 0){
  					$(data.list).each(function(){
  						html += "<div class='comment comment-hr'>";
  						html += "<span class='comments-title'><strong>"+this.id+"</strong></span>";
  						html += "&nbsp;&nbsp;<span>"+getFormatDate(this.repDate)+"</span>&nbsp;&nbsp;";
  						if(this.id == "${loginId}"){
  							html += "<button type='button' class='btn btn-default btn-xs repmod'>수정</button>&nbsp;&nbsp;";
  	  						html += "<button type='button' class='btn btn-default btn-xs repdel' data-toggle='modal' data-target='#repModal'>삭제</button>";	
  							html += "<input type='hidden' name='repSeq' value='"+this.repSeq+"'/>";
  						}
  						html += "<br><span class='repContents'>"+this.repContents+"</span><br>";
  						html += "</div>";
  					});
  					showReplyPage(rCntByPn);
  				}else{
  					html += "<div class='comment'>";
  					html += "<span class='comments-title'><strong> 등록된 댓글이 없습니다. </strong></span>";
  					html += "</div>";
  				}
  				$("#cCnt").html(rCntByPn);
  				$("#comments-list").html(html);
    		}
    	  });//ajax
    	  
		} // 댓글 목록 출력 함수 
     
		//댓글 작성일이 오늘이면 시간/ 하루 지난 이후부터는 날짜 출력
      function getFormatDate(date){
    	  var today = new Date();			//현재시간 
    	  var gap = today.getTime()-date;	//댓글 작성시간과 현재시간 차이
    	  var dateObj = new Date(date);
    	  var str = "";
    	  
    	  if(gap<(1000*60*60*24)){
    		  var hh = dateObj.getHours();
    		  var mi = dateObj.getMinutes();
    		  var ss = dateObj.getSeconds();
    		  
    		  return [(hh>9?'':'0')+hh, ":", (mi>9?'':'0')+mi,':',(ss>9?'':'0')+ss].join('');
    	  }else{
    		  var yy = dateObj.getFullYear();
    		  var mm = dateObj.getMonth()+1;  //월은 0이 기본값이기 때문에 1 더해줘야 함.
    	  	  var dd = dateObj.getDate();
    		  
    		  return [yy,'-',(mm>9?'':'0')+mm,'-',(dd>9?'':'0')+dd].join('');
    	  }
    	  
          var year = date.getFullYear();
          var month = (date.getMonth()+1);
          var day = date.getDate();
          var hours = date.getHours();
          var minutes = date.getMinutes();
          var seconds = date.getSeconds();
          return year + '-' + month + '-' + day+" "+hours+":"+minutes+":"+seconds;
      }// 날짜 처리 함수

      // 쪽지보내기 팝업
      function popupOpen(){
    	     var popUrl = "messagepopup.do?no=${list.post_no}";	//팝업창에 출력될 페이지 URL
    	     var popOption = "width=500, height=430, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
    	         window.open(popUrl,"",popOption);
    	     };
		
		//댓글 수정
      $(function(){
    	  $("#comments-list").on('click','.repmod',function(){
  			var repContents = $(this).siblings(".repContents").text();
  			var repSeq = $(this).nextAll("input[type=hidden]").val();
  			
  			$(this).siblings(".repContents").html("<input type='text' class='form-control rep-mod-contents' value='"+repContents+"'/>");
  			$(this).text("수정완료");
  			
  			$(this).click(function(){
  				var repModContents = $(this).siblings(".repContents").children().val();
  				$.ajax({
  					type: "POST",
  					url: "${pageContext.request.contextPath}/reply/update",
  					contentType: "application/x-www-form-urlencoded; charset=UTF-8",
  					data: {repContents : repModContents, repSeq : repSeq},
  					beforeSend : function(xhr){
  						xhr.setRequestHeader(header, token);
  					},
  					success : function(data){
  						if(data=="success"){
  							alert("댓글이 수정되었습니다.");
  							getReplyList(-1); 
  						}
  					},
  					error:function(request, status, error){
  						alert("code"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
  					}
  				});//ajax
  			});//댓글 수정완료 클릭
  			
  	      });//댓글 수정 함수
        
    	  //댓글 삭제 버튼 클릭 시 확인 모달창
        $("#comments-list").on('click','.repdel',function(){
  			var repContents = $(this).siblings(".repContents").text();
  			var repSeq = $(this).nextAll("input[type=hidden]").val();
  			$(".modal-repSeq").val(repSeq);
  			$(".modal-title").html("<strong>댓글 삭제</strong>");
  			$(".modal-delete-btn").text("삭제");
  			$(".modal-reply").prev().html("<font color='red'>댓글을 삭제하시겠습니까?</font>");
      });
        
    	  //댓글 삭제 처리
        $(".modal-delete-btn").click(function(){
      	  var repSeq = $(".modal-repSeq").val();
				$.ajax({
					type: "GET",
					url: "${pageContext.request.contextPath}/reply/delete",
					contentType: "application/x-www-form-urlencoded; charset=UTF-8",
					data: {repSeq : repSeq},
					beforeSend : function(xhr){
						xhr.setRequestHeader(header, token);
					},
					success : function(data){
						if(data=="success"){
							alert("댓글이 삭제되었습니다.");
							getReplyList(-1); 
						}
					},
					error:function(request, status, error){
						alert("code"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				});//ajax
			}); //댓글 삭제 버튼 클릭 시
      }); //window.onload
     
	
	// 댓글 페이징 처리
	var pageNum = 1;
	var paging = $(".paging");
	
    
	function showReplyPage(replyCnt){
		var endNum = Math.ceil(pageNum/10.0)*10;
		var startNum = endNum - 9;
		var prev = startNum != 1;
		var next = false;
		
		if(endNum * 10 >= replyCnt){
			endNum = Math.ceil(replyCnt/10.0);
		}
		
		if(endNum * 10 < replyCnt){
			next = true;
		}
		
		var str = "<ul class='breadcrumb text-right'>";
		
		if(prev){
			str += "<li><a href='"+(startNum-1)+"'>이전</a></li>";
		}
		
		for(var i = startNum; i <= endNum; i++){
			var active = pageNum == i? "active":"";
			str +="<li class='"+active+"'><a href='"+i+"'>"+i+"</a></li>";
		}
		
		if(next){
			str+="<li><a href='"+(endNum+1)+"'>다음</a></li>";
		}
		
		str+="</ul>";
		console.log(str);
		
		paging.html(str);
		
		}// showReplyPage 함수
		
		
		//다음 페이지 눌렀을 때 리스트 나오게
		$(function(){
			paging.on("click","li a",function(e){
				e.preventDefault();
				console.log("page click");
				
				var targetPageNum = $(this).attr("href");
				console.log("targetPageNum: "+targetPageNum);
				pageNum=targetPageNum;
				getReplyList(pageNum);
			});
					
		});
	
	</script>


      