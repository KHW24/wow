<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
	<script>
	 $(function(){
      
      //전체 선택 및 해제
      $("#allCheck").change(function(){
         if($("#allCheck").prop("checked")==true){
            $("input[name=delNos]").prop("checked",true);
         }else{
            $("input[name=delNos]").prop("checked",false);
         }
      });
      
      //개별 선택 시 전체선택 및 해제버튼 변경
      $("input[name=delNos]").change(function(){
         checkBoxLength = $("input[name=delNos]").length;
         checkedLength = $("input[name=delNos]:checked").length;
         
         if(checkBoxLength==checkedLength){
            $("#allCheck").prop("checked",true);
         }else{
            $("#allCheck").prop("checked",false);
         }
      });
      
      //신고내역 삭제
      $("#postDelete").click(function(){
          var header = "${_csrf.headerName}"; 
            var token = "${_csrf.token}";
            var cnt = $("input[name='postCheck']:checked").length;
            var arr = new Array();
            
            $(document).ajaxSend(function(e,xhr, options){
                xhr.setRequestHeader(header, token); 
              });
            
            $("input[name='postCheck']:checked").each(function(){
              arr.push($(this).val()); 
            });
            if(cnt==0){
               alert("선택된 게시글이 없습니다.");
            }else{
               $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/adminMsDelete.do",
                data: "postDel="+arr+"&cnt="+cnt,
                dataType:"json",
                success: function(data){
                   if(data=="success"){
                      alert("삭제가 완료되었습니다.");
                   }else{
                      alert("")
                   }
                },
                error:function(request, status, error){
                   alert("code"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                }
             });
            }
      });
      
   });
	</script>
 <style>
 
   /* 테이블 */
  table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 70%;
    margin-left: auto;
    margin-right: auto;
    color:black;
    text-align: center;
  }
  td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
    text-align: center;
  }
  tr:nth-child(even) {
    background-color: #dddddd;
    text-align: center;
  }
  
  /* 페이징 처리 */
  .pagination {
    display: inline-block;
  }
  .pagination a {
    color: black;
    float: left;
    padding: 8px 16px;
    text-decoration: none;
  }
  .pagination a.active {
    background-color: gray;
    color: white;
    border-radius: 5px;
  }
  .pagination a:hover:not(.active) {
    background-color: #ddd;
    border-radius: 5px;
  }
  
  
  </style>
  

 <!-- Category -->
<div class="container-fluid bg-3 text-center">
  <h3 class="margin"><b>멤버쉽 회원 관리</b></h3>
  <br>
  <a href="membership.do" class="btn btn-default btn-lg">멤버쉽 회원 관리<br>
  </a>
  <a href="report.do" class="btn btn-default btn-lg">신고 회원 관리<br>
  </a>
  <a href="postmanage.do" class="btn btn-default btn-lg">게시물 관리<br>
  </a>

<br><br><br>
<!--CRUD-->
<form  action="adminMsDelete.do" method="post">
<table>
  <tr>
    <th> 전체선택 <input id ="allCheck"  type="checkbox" name="allAdminMs"></th>
    <th>No.</th>
    <th>ID</th>
    <th>Membership Period</th>
  </tr>
   <c:forEach items="${adminMsList}" var="adminMs">
  <tr>
    <td><input type="checkbox" name="delNos" value="${adminMs.mshipSeq}">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /></td>
    <td><c:out value="${adminMs.mshipSeq}" /></td>
    <td>${adminMs.id}</td>
    <fmt:formatDate value="${adminMs.mshipStart}"  var="mshipStart" pattern="yyyy-MM-dd"/>
    <fmt:formatDate value="${adminMs.mshipEnd}"  var="mshipEnd" pattern="yyyy-MM-dd"/>
    <td>${mshipStart} ~ ${mshipEnd}</td>  
  </tr>
      </c:forEach>
</table>
<br>
 <a href="<c:url value='/books/delete/${ book.id }' />" class="btn btn-lg btn-danger">삭제
</a>
<script>
//댓글 삭제 버튼 클릭 시 확인 모달창
$("#membership-list").on('click','.repdel',function(){
		var mshipContents = $(this).siblings(".repContents").text();
		var mshipSeq = $(this).nextAll("input[type=hidden]").val();
		$(".modal-mshipSeq").val(repSeq);
		$(".modal-title").html("<strong>댓글 삭제</strong>");
		$(".modal-delete-btn").text("삭제");
		$(".modal-reply").prev().html("<font color='red'>댓글을 삭제하시겠습니까?</font>");
});

  //댓글 삭제 처리
$(".modal-delete-btn").click(function(){
	  var repSeq = $(".modal-repSeq").val();
		$.ajax({
			type: "GET",
			url: "${pageContext.request.contextPath}/membership/delete",
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			data: {mshipSeq : mshipSeq},
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
});
</script>
</form>
<br>
<input type="button" value="선택삭제" class="btn btn-outlin-info" onclick="deleteValue();">
<br>
<div class="pagination">
  <a href="#">&laquo;</a>
  <a href="#">1</a>
  <a href="#">2</a>
  <a href="#">3</a>
  <a href="#">4</a>
  <a href="#">5</a>
  <a href="#">6</a>
  <a href="#">&raquo;</a>
</div>
<br>
<br>
<br>
</div>
