<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!-- css 파일 -->
<link
	href="${pageContext.request.contextPath}/resources/css/boardlist2.css"
	rel="stylesheet" type="text/css" />
<script>
$(function(){
    $('button[name="hbtn"]').on('click', function(){
       if($(this).hasClass('glyphicon glyphicon-heart-empty')== true){
          $(this).removeClass('glyphicon glyphicon-heart-empty');
          $(this).addClass('glyphicon glyphicon-heart');
       }else{
          $(this).removeClass('glyphicon glyphicon-heart');
          $(this).addClass('glyphicon glyphicon-heart-empty');
       }
    });
 });
</script>
<script>
	var csrfHeaderName ="${_csrf.headerName}";
	var csrfTokenValue="${_csrf.token}";
</script>
<!-- 전체 div -->
<div class="wraps">
	<!-- 카테고리 드롭다운 -->
	<div class="dropdown" id="dropdown">
		<button class="btn btn-default" type="button" data-toggle="dropdown">
			Category <span class="caret"></span>
		</button>
		<ul class="dropdown-menu">
			<li><a href="#">Food</a></li>
			<li><a href="#">Accessory</a></li>
			<li><a href="#">Pet</a></li>
			<li><a href="#">Interior</a></li>
			<li><a href="#">etc</a></li>
		</ul>
	</div>
	<!-- 판매중/판매완료 라디오버튼 -->
	<div class="radiobtn">
		<input type="radio" name="goods" value="판매중"> &nbsp;판매중 &nbsp;&nbsp; 
		<input type="radio" name="goods" value="판매완료">	&nbsp;판매완료
	</div>
	<!-- 썸네일 게시물 리스트 -->
	<div class="fixed_img_col">
		<ul>
			<!-- li가 게시물 하나하나 -->
			<c:forEach var="n" items="${list}">
				<li><span class="thumb"> <em>${n.post_code }</em>
						<a href="postSellerView.do?no=${n.post_no }"> 
						<img class="img-rounded" src="${pageContext.request.contextPath}/resources/images/sample.jpg"alt=""></span> 
						<Strong>${n.post_title }</Strong> </a>
					<p>${n.post_address }&nbsp;·&nbsp;
					<fmt:formatDate	pattern="MM-dd" value="${n.post_date}" />
					</p>
					<p id="price">${n.post_price }원</p>
					<button name="hbtn" id="hbtn" class="glyphicon glyphicon-heart-empty"></button>
				</li>
			</c:forEach>
		</ul>
	</div>
	<div id="dd">
	</div>
</div>
<button type="button" id="more" class="btn btn-default">더보기</button>
<br />
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
<input type="hidden" name="${_csrf.headerName}" value="${_csrf.headerName}" />

<sec:authorize access="isAuthenticated()">
	<sec:authentication var="loginId" property='principal.member.id' />
</sec:authorize>
<c:if test="${!empty loginId}">
	<div id="enbtndiv">
		<a href="postWrite.do" id="enbtn" class="btn btn-default">글 등록</a>
	</div>
</c:if>

<script>
var more = -1;
 $(function(){$('#more').on('click',function(){
	 
	 	more = more +1;
		alert(more);
		
		$.ajax({
			url : "boardList.do",
		    type: 'POST',
		    //contentType : 'text/html; charset=utf-8;',//내가 서버로 보내는 데이터의 타입
		    data: { more : more},
			dataType: "json",
			beforeSend : function(xhr){
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			success: function(data){

				var addListHtml ="";

					addListHtml += "<div class='fixed_img_col' style='height:350px'>";
				for(var i in data.list){
					
					addListHtml += "<ul>";
					addListHtml += "<li><span class='thumb'><em>"+data.list[i].post_code+"</em>";
				   addListHtml += "<a href='postSellerView.do?no="+data.list[i].post_no+"'> ";
				   addListHtml += "<img class='img-rounded' src='${pageContext.request.contextPath}/resources/images/sample.jpg'alt=''></span>";
				   addListHtml += "<Strong>"+decodeURIComponent(data.list[i].post_title)+"</Strong> </a>";
				   addListHtml += "<p>"+decodeURIComponent(data.list[i].post_address)+"&nbsp;·&nbsp"+data.list[i].post_date+"</p>";
				   //addListHtml += "<p>"+data.list[i].post_address+　·　+data.list[i].post_date+"</p>";
				   addListHtml += "<p id='price'>"+data.list[i].post_price+"원</p>";
				   addListHtml += "<button name='hbtn' id='hbtn' class='glyphicon glyphicon-heart-empty'></button>";
				   addListHtml += "</li>";
				   addListHtml += "</ul>";					
				}

					addListHtml += "</div>";
				 $("#dd").append(addListHtml);
				
			},
		    error: function (request,status,errorData){   
		    	alert('error code: '+request.status+"\n"
		    			+'message:' +request.reponseText+'\n'
		    			+ 'error :'+  errorData);
		    }
		});
	}); 
 }); 
</script>



