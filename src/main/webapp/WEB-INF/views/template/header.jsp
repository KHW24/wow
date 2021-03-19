<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
            <li><a href="main.do">HOME</a></li>
            <li><a href="login.do">LOGIN</a></li>
            <li><a href="mypage.do">MY PAGE</a></li>
          </ul>
        </div>
      </div>
    </nav>