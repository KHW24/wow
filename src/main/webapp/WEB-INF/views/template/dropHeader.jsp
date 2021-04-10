<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <!-- Navbar -->
<script>
	$(function(){
		$('#searchBtn').on('click', function(){
			
			var category = $('select[name="category"]').val();
			var categoryArr = category.split('=');
			var categoryVal = categoryArr[1];
		
			var onsaleVal = $('input[name="onsale"]:checked').val();

			$('input[name="onsale"]').val(onsaleVal);
			$('input[name="category"]').val(categoryVal);
			$('#searchFrm').submit();
		});
	});
</script>
<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <ul class="nav navbar-nav">
      <c:if test="${empty param.address }">
        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">이웃의 솜씨<span class="caret"></span></a>
       </c:if>
       <c:if test="${!empty param.address }">
       <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">${param.address }<span class="caret"></span></a>
        </c:if>
        <ul class="dropdown-menu">
          <li><a href="#">종로구 명동</a></li>
          <li><a href="#">종로구 을지로1동</a></li>
        </ul>
      </li>
      </ul>
    </div>

        <ul class="nav navbar-nav">
          <li class="active">
               <form class="navbar-form navbar-left" action="boardList.do" method="GET" id="searchFrm">
               		<input type="hidden" name="onsale">
               		<c:if test="${!empty param.address }">
               		<input type="hidden" name="address" value="${param.address }">
               		</c:if>
               		<input type="hidden" name="category">
                <div class="input-group">
                  <input type="text" class="form-control" placeholder="Search" name="post_title" value="${param.post_title }">
                  <div class="input-group-btn">
                    <button class="btn btn-default" type="button" id="searchBtn">
                      <i class="glyphicon glyphicon-search"></i>
                    </button>
                  </div>
                </div>
              </form>
          </li>
        </ul>

    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
       <sec:authorize access="isAuthenticated()">
            <li><a href="mypage.do"><sec:authentication property="principal.member.id"/>님</a></li>
            </sec:authorize>
        <li><a href="main.do">HOME</a></li>
        <sec:authorize access="isAnonymous()">
            	<li><a href="login.do">LOGIN</a></li>
            	<li><a href="join.do">JOIN</a></li>
            </sec:authorize>
            <sec:authorize access="isAuthenticated()">
            	<li><a href="#" onclick="document.getElementById('logout-btn').submit();">LOGOUT</a>
            	<form id="logout-btn" action="logout.do" method="post">
            		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            	</form></li>
            	</sec:authorize>
            	
  
            	  <sec:authorize access="hasRole('ROLE_MEMBER')">
            	  <li><a href="mypage.do">MYPAGE</a></li>
            	  </sec:authorize>
            	  
            	   <sec:authorize access="hasRole('ROLE_ADMIN')">
            	  <li><a href="membership.do">ADMIN</a></li>
            	  </sec:authorize>
            	  
            
      </ul>
    </div>
  </div>
</nav>











