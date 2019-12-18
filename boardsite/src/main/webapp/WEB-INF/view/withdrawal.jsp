<%@page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>회원 탈퇴</title>
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<!-- jQuery library -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<!-- Latest compiled JavaScript -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	
	<style>
	    /* Set height of the grid so .sidenav can be 100% (adjust if needed) */
    .row.content {height: 1500px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      background-color: #f1f1f1;
      height: 100%;
    }
    
    /* Set black background color, white text and some padding */
    footer {
      background-color: #555;
      color: white;
      padding: 15px;
    }
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height: auto;} 
    }
    .withdrawal-Notice h3{
    font-weight: bold;
    }
    .withdrawal-Notice p{
    color: red;
    }
    .agree {
    	text-align: center;
    }
	</style>
</head>
<body>
	<div class="container">
		<!-- header -->
		<%@include file="/WEB-INF/common_view/header.jsp" %>
		<div class="row row-ma">
		<!-- side bar -->
		<%@include file="/WEB-INF/common_view/sidebar.jsp" %>
     	<!-- screen -->
     		  <div class="col-sm-9"  style="height: 74vh;">
	     		<br>
	     		<br>
	     		<hr>
	     		<div class="withdrawal-Notice"  style="width: 100%">
		     		<h3>탈퇴 안내</h3>
		     		<br>
		     		<p>다음 안내를 꼼꼼히 확인 후 동의란에 체크하세요.</p><br>
		     		- 탈퇴 후에는 아이디 ${sessionScope.loginM} 로 다시 가입할 수 없습니다.<br>
		     		<br>
					- 탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가합니다.<br>
		     		<br>
		     		- 탈퇴 후에도 게시판형 서비스에 등록한 게시물은 그대로 남아 있으며 탈퇴 후 삭제가 불가합니다.<br>
					<br>
					<br>
					<br>
					<hr>
					<div class="checkbox"  style="text-align: center;">
  						<label><input id="confirm" style="align-content: center;" type="checkbox">안내 사항을 모두 확인하였으며, 이에 동의합니다.</label>
					</div>
					<br>
					<br>
					<div style="text-align: center;">
						<button id="confirm_button" type="button" class="btn btn-success" onclick="withdrawal_confirm();" >확인</button>
					</div>
				</div>
     		  </div>
     		</div>
     		  <%@include file="/WEB-INF/common_view/footer.jsp"%>
     		</div>
     <div id = "love"></div>
     <script type="text/javascript">
     function withdrawal_confirm() {
    	 if($('#confirm').is(':checked')){
    		$('#withdrawal_confirm_modal').modal();
    	 } else {
    		 alert('동의 후 진행하세요');
    	 }
     };
     function password_submit(){
		 $.ajax({
				url : '/drip_member_withdrawal_action.do', 
				method : 'POST',
				data : $('#delete_submit').serialize(),
				dataType : 'TEXT',
				success : function(text) {
					if(text.trim()=='true'){
						alert('탈퇴되었습니다');
						location.href='/drip_board.do';
					} else if (text.trim()=='false') {
						alert('비밀번호가 일치하지 않습니다');
					} else if (text.trim()=='false2') {
						alert('존재하지 않는 회원입니다');
					} else if (text.trim()=='false3') {
						alert('비밀번호를 입력하세요');
					}
					
				},
			 	error : function() {
			 		alert('error');
			 	}
			 })
     }
    // $("#love").load("/js/html",function(){})
     </script>
     
     <%@include file = "withdrawal_confirm.jsp" %>
     <%@include file = "member_script.jsp" %>
     <%@include file = "board_script.jsp" %>		
</body>
</html>