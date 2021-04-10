<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
    $('button[name^="hbtn"]').on('click', function(){
       if($(this).hasClass('glyphicon glyphicon-heart-empty')== true){
          
		  	var post_no = $(this).val();
  			var get_id = $('#infoConId').val();
  			
  			$.ajax({
  				url : "wishInsert.do",
  				type : "POST",
  				data : { post_no : post_no, get_id : get_id },
  				beforeSend : function(xhr){
  					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
  				},
  			    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
  				success : function(data){
  					if(data = "success") {
  						alert("관심품목에 추가되었습니다.");
                    	window.location.href="boardList.do";
  					} else {
  						alert("관심품목 추가를 실패했습니다.")
  					}
  				},	error: function (request,status,errorData){   
      		    	alert('error code: '+request.status+"\n"
      		    			+'message:' +request.reponseText+'\n'
      		    			+ 'error :'+  errorData);
      		    }
  			});
            $(this).removeClass('glyphicon glyphicon-heart-empty');
            $(this).addClass('glyphicon glyphicon-heart');
       }	else{
	          $(this).removeClass('glyphicon glyphicon-heart');
	          $(this).addClass('glyphicon glyphicon-heart-empty');
	          
	          var post_no = $(this).val();
	  			
	  			$.ajax({
	  				url : "wishDelete.do",
	  				type : "POST",
	  				data : { post_no : post_no},
	  				beforeSend : function(xhr){
	  					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
	  				},
	  			    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	  				success : function(data){
	  					if(data = "1") {
	  						alert("관심품목에서 삭제하였습니다.");
	                    	window.location.href="wishList.do";
	  					} else {
	  						alert("관심품목 삭제를 실패했습니다.")
	  					}
	  				},	error: function (request,status,errorData){   
	      		    	alert('error code: '+request.status+"\n"
	      		    			+'message:' +request.reponseText+'\n'
	      		    			+ 'error :'+  errorData);
	      		    }
	  			});
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
		<!-- <button class="btn btn-default" type="button" data-toggle="dropdown">
			Category <span class="caret"></span>
		</button> -->
		<select class="btn btn-default" name="category" onchange="if(this.value) location.href=(this.value);">
			<option value="boardList.do?address=${param.address }&category=">Category</option>
			<option value="boardList.do?address=${param.address }&category=food" <c:if test="${param.category eq 'food'}">selected</c:if>>Food</option>
			<option value="boardList.do?address=${param.address }&category=accessories" <c:if test="${param.category eq 'accessories'}">selected</c:if>>Accessory</option>
			<option value="boardList.do?address=${param.address }&category=pet" <c:if test="${param.category eq 'pet'}">selected</c:if>>Pet</option>
			<option value="boardList.do?address=${param.address }&category=interior" <c:if test="${param.category eq 'interior'}">selected</c:if>>Interior</option>
			<option value="boardList.do?address=${param.address }&category=etc" <c:if test="${param.category eq 'etc'}">selected</c:if>>Etc</option>
		</select>
	</div>
	<!-- 판매중/판매완료 라디오버튼 -->
	<div class="radiobtn" >
		<input type="radio" name="onsale" value="" onclick="window.location.href='boardList.do?address=${param.address }&category=${param.category}&onsale=';" <c:if test="${empty param.onsale}">checked</c:if>>&nbsp;전체 &nbsp;&nbsp; 
		<input type="radio" name="onsale" value="y" onclick="window.location.href='boardList.do?address=${param.address }&category=${param.category}&onsale=y';" <c:if test="${param.onsale eq 'y'}">checked</c:if>>&nbsp;판매중 &nbsp;&nbsp; 
		<input type="radio" name="onsale" value="n" onclick="window.location.href='boardList.do?address=${param.address }&category=${param.category}&onsale=n';" <c:if test="${param.onsale eq 'n'}">checked</c:if>>&nbsp;판매완료
	</div>
	<!-- 썸네일 게시물 리스트 -->
	<div class="fixed_img_col">
		<ul>
			<!-- li가 게시물 하나하나 -->
			<c:forEach var="n" items="${list}" varStatus="status">
				<li><span class="thumb"> <em>${n.post_code }</em>
						<a href="postSellerView.do?no=${n.post_no }"> 
						<img class="img-rounded" src="${pageContext.request.contextPath}/resources/upload/${n.rename_filename}"alt=""> 
						<Strong>${n.post_title }</Strong></a></span>
					<p>${n.post_address }&nbsp;·&nbsp;
					<fmt:formatDate	pattern="MM-dd" value="${n.post_date}" />
					</p>
					<p id="price">${n.post_price }원</p>
					<input type="hidden" id="${n.post_no }" name="wbtn" value="${n.post_no }"/>
					<c:choose>
						<c:when test="${wishList[status.index].wish_seq ne null}">
							<button name="hbtn${n.post_no }" id="hbtn" class="glyphicon glyphicon-heart" value="${n.post_no }"></button>
						</c:when>
						<c:otherwise>
							<button name="hbtn${n.post_no }" id="hbtn" class="glyphicon glyphicon-heart-empty" value="${n.post_no }"></button>
						</c:otherwise>
					</c:choose>
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
<sec:authorize access="isAuthenticated()">
<input type="hidden" id="infoConId" value="<sec:authentication property="principal.member.id"/>">
</sec:authorize>

<script>
var more = -1;
 $(function(){$('#more').on('click',function(){
	 
	 	more = more +1;
		//alert(more);
		
		$.ajax({
			url : "boardList.do",
		    type: 'POST',
		    //contentType : 'text/html; charset=utf-8;',//내가 서버로 보내는 데이터의 타입
		    data: { more : more,		    
			     category : "${param.category}"	,
			     onsale : "${param.onsale}" ,
			     post_title : "${param.post_title}"
			    },
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
				   	addListHtml += "<img class='img-rounded' src='${pageContext.request.contextPath}/resources/images/"+data.list[i].rename_filename+"'alt=''></span>";
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
<script>
	
	// 찜하기


	
</script>



