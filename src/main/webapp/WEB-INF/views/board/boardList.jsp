<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
    <!-- css 파일 -->
	<link href="${pageContext.request.contextPath}/resources/css/boardlist2.css"
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
        <!-- 전체 div -->
        <div class="wraps">
            <!-- 카테고리 드롭다운 -->
            <div class="dropdown" id="dropdown">
                <button class="btn btn-default" type="button" data-toggle="dropdown">Category
                <span class="caret"></span></button>
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
                <input type="radio" name="goods" value="판매완료"> &nbsp;판매완료
            </div> 
            <!-- 썸네일 게시물 리스트 -->
            <div class="fixed_img_col"> 
                <ul>
                    <!-- li가 게시물 하나하나 -->
                    <c:forEach var="n" items="${list}">
                    <li>
                        <span class="thumb"> 
                           <em>${n.post_code }</em>
                          <%--  <c:set var="writer" value="${n.id}"/> --%>
                           <sec:authorize access="isAuthenticated()">
                           <sec:authentication var="loginId" property='principal.member.id'/>
                           </sec:authorize>
                          <%--  login:${loginId}writer:${writer}                     
                           <c:if test="${writer eq loginId}">
                           <a href="postSellerView.do?no=${n.post_no }">
                           </c:if>
                           <c:if test="${writer != loginId}">
                           <a href="postBuyerView.do?no=${n.post_no }">
                           </c:if> --%> 
                            <a href="postSellerView.do?no=${n.post_no }">             
                            <img class="img-rounded" src="${pageContext.request.contextPath}/resources/images/sample.jpg" alt=""></span>
                            <Strong>${n.post_title }</Strong>
                        	</a>
                        <p>${n.post_address }&nbsp;·&nbsp;<fmt:formatDate pattern="MM-dd" value="${n.post_date}" /></p>
                        <p id="price">${n.post_price }원</p>
                        <button name="hbtn" id="hbtn" class="glyphicon glyphicon-heart-empty"></button>
                    </li>
                    </c:forEach>
                </ul>
            </div>
            
        </div>
        <button type="button" id="more" class="btn btn-default">더보기</button><br/>
        	
        	<c:if test="${!empty loginId}">
            <div id="enbtndiv">
            	<a href="postWrite.do" id="enbtn" class="btn btn-default">글 등록</a>
            </div>
            </c:if>
