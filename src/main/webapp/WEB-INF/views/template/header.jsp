<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
 <!-- Navbar -->
    <nav class="navbar navbar-default navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>                        
          </button>
          <a class="navbar-brand" href="main.do">이웃의 솜씨</a>
        </div>
      
            <ul class="nav navbar-nav">
              <li class="active">
                  <form class="navbar-form navbar-left" action="/action_page.php">
                    <div class="input-group">
                      <input type="text" class="form-control" placeholder="Search" name="search">
                      <div class="input-group-btn">
                        <button class="btn btn-default" type="submit">
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
            	<li><a href="mypage.do">MYPAGE</a></li>
            </sec:authorize>
          </ul>
        </div>
      </div>
    </nav>