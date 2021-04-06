<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<style>
 .btn:hover{
        background-color: rgb(173, 39, 173);
        color: white;
    }
</style>

<div style="text-align: center;">
	<h2><strong>내 댓글 보기</strong></h2>
	<hr>
</div>
<div class="container" >
	
	<form  action="myReplyDelete.do" method="post">
		<input type="submit" class="btn" value="삭제" style="margin-left: 83%;" onclick="confirm('삭제하시겠습니까?')"/>
		
		<table style="margin:5%" class="table table-condensed">
			<thead>
				<tr>
					<th>NO</th>
					<th>CONTENT</th>
					<th>ID</th>
					<th>DELETE</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${listCount != 0}">
					<c:forEach items="${myReplies}" var="myReply" varStatus="status">

						<tr>
							<td>${status.count}</td>
							<td><a href="postSellerView.do?no=${myReply.postNo}">${myReply.repContents }</a></td>
							<td>${myReply.id }</td>

							<td><input type="checkbox" name="delNos"
								value="${myReply.repSeq}"> <input type="hidden"
								name="${_csrf.parameterName}" value="${_csrf.token}" /></td>
						</tr>

					</c:forEach>
				</c:if>
				<c:if test="${listCount == 0}">
					<tr>
						<td colspan="4" align="center"><br>
						<strong>작성한 댓글이 없습니다.</strong> <br>
						<br></td>
					</tr>
				</c:if>
			</tbody>
		</table>
		</form>
</div>
<!-- 글 있는 경우 -->
<c:if test="${listCount ne 0}">
	<div class="paging">
	  <!-- 페이지네이션 공간 -->
	</div>
</c:if>
<script>
	$(function(){
		var postCnt = "${listCount}";
		postList(postCnt); 
	 });
	
		// 댓글 페이징 처리
	var pageNum = "${page}";
	var paging = $(".paging");
	var url = "postmanage.do?page=";
	
	function postList(postCnt){
		var endNum = Math.ceil(pageNum/10.0)*10;
		var startNum = endNum - 9;
		var prev = startNum != 1;
		var next = false;
		
		if(endNum*10>=postCnt){
			endNum = Math.ceil(postCnt/10.0);
		}
		
		if(endNum*10<postCnt){
			next = true;
		}
		
		var str = "<ul class='breadcrumb text-center'>";
		
		if(prev){
			str += "<li><a href='"+(startNum-1)+"'>이전</a></li>";
		}
		
		for(var i = startNum; i <= endNum; i++){
			var active = pageNum == i? "active":"";
			str +="<li class='"+active+"'><a href='"+i+"'>"+i+"</a></li>"; // 여기 a태그에 주소넣으면 안됨 아래에 넣어야됨
		}
		if(next){
			str+="<li><a href='"+(endNum+1)+"'>다음</a></li>";
		}
		str+="</ul>";
		console.log(str);
		paging.html(str);	// div 부분에 표시되게
		}
		
		
		//다음 페이지 눌렀을 때 리스트 나오게
		$(function(){
			paging.on("click","li a",function(e){
				e.preventDefault();
				console.log("page click");
				
				var targetPageNum = $(this).attr("href");
				console.log("targetPageNum: "+targetPageNum);
				pageNum=targetPageNum;
				window.location.href="postmanage.do?page="+targetPageNum;	// 주소 주의해서 작성해야함
			});
					
		});
</script>


