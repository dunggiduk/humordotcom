<%@page contentType="text/html;charset=UTF-8"%>
  			  <div class="col-sm-3 sidenav" style="float: left">
  			  	 <br>
     			 <br>
      			 <ul class="nav nav-pills nav-stacked">
       				 <li class="active"><a href="/drip_member_detail.do?mId=${sessionScope.loginM}">내 정보 수정</a></li>
       				 <li><a href="/drip_member_detail_board.do?mId=${sessionScope.loginM }">작성한 글 목록</a></li>
      			     <li><a href="/drip_member_withdrawal.do?mId=${sessionScope.loginM }">회원 탈퇴</a></li>
     			 </ul>
     			 <br>
     		  </div>