<%@page contentType="text/html;charset=UTF-8"%>
<div class="row">
<div class="col-sm-6">
<img alt="" style="padding-left: 20px;" src="/img/유머닷컴2.png"/>
<img alt="" style="padding-top: 20px; padding-left: 30px;" src="/img/snowman.png"/>
</div>
<div class="col-sm-6" style="margin-top: 90px; ">
<div style="float: right; font-size: 12px;">
<a href="id_find.do" style=" color: #4F4F4F">ID 찾기</a>
|
<a href="pass_find.do"  style=" color: #4F4F4F">비밀번호 찾기</a>
</div>
</div>
</div>

<nav class="navbar" style = "margin-top: 0px; margin-bottom:0px; background-color: #000069">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="main.do" style="color:white;">유머닷컴</a>
    </div>
    <ul class="nav navbar-nav">
      <li><a href="#" style="color: white;">유머 베스트</a></li>
      <li><a href="drip_board.do" style="color: white;">유머 게시판</a></li>
      <li><a href="#" style="color: white;">자유 게시판</a></li>
    </ul>

    <div id="loginH" class="hide">
		<form id='after_login_form' class='navbar-form navbar-right'>
		<span  style="color: #FFFFFF;">
			<a id='login_Hi' style="color: #FFFFFF;" href='/drip_member_detail.do?mId=${sessionScope.loginM}'>${sessionScope.loginM}</a>님 환영합니다.
		</span>
		<button type='button' class='btn btn-default' onclick="location.href='/drip_member_detail.do?mId=${sessionScope.loginM}'">회원관리</button>
		
		<button type='button' class='btn btn-default' onclick='logout_member()' >로그아웃</button>
		</form>
	</div>
	
    <div id="logoutH" data-slog="${sessionScope.loginM}" class="show">
      <form id='login_form' class='navbar-form navbar-right'>
	    <div class='form-group'>
	    	<input id = 'login_id' name = 'mId' type='text' class='form-control' style="margin-right: 5px; font-size: 0.8em; padding: 5px;" placeholder='아이디'>
	      	<input id = 'login_pass' name = 'mPassword' type='password' class='form-control' style="font-size: 0.8em;  padding: 3px;" placeholder='비밀번호'>
	    </div>
      	<button type='button' class='btn btn-default' onclick='login_member();' style="font-size: 0.8em; padding: 8px;  background-color: #DBDBDB;">로그인</button>
      	<button type='button' class='btn btn-default' data-toggle='modal' data-target='#register_modal' style="font-size: 0.8em;  padding: 8px;  background-color: #DBDBDB;" onclick='register_v();'>회원가입</button>
     </form>
    </div>
  </div>
</nav>