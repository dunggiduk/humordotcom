<%@page import="com.heeeun.boardsite.member.Member"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>

<%@page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	Member member = (Member)request.getAttribute("m");
%>
<!DOCTYPE html>
<html>
<head>
	<title>회원 정보</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	
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
    #set_member{
    	float: right;
    }
    #red{
    	color: red;
    }
    hr{
    	margin-top: 12px;
    	margin-bottom: 13px;
    }
    div.has-success > span.glyphicon,
    div.has-error > span.glyphicon{
        right: 12px;
    }
    .screen {
    	height: 71vh;
    }
    .vali_notice {
    	font-size:0.8em; 
    	float: inherit; 
    	margin-top: 0.5em;
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
     		<div class="col-sm-9 screen">
     		<br>
     		<br>
     		<br>
     		<span style="color: gray;">내 정보 수정</span>
     		<hr style="border: 5;">
     		<form class="form-horizontal" id="member_set_form" method="post" action="">
     			<div class="form-group">
					<label class="col-sm-3 control-label"><span id="red">* </span>아이디</label> 
					<div class="col-sm-5">
						<input type="text" class="form-control" name="mId" readonly="readonly" value="${m.mId }">
					</div>
				</div>
				<hr>
				<div class="form-group">
					<label class="col-sm-3 control-label"><span id="red">* </span>닉네임</label> 
					<div class="col-sm-5">
						<input type="text" class="form-control" name="mNick" id="mNick_set" value=${m.mNick }>
					</div>
				</div>
				<hr>
     			<div class="form-group">
					<label class="col-sm-3 control-label"><span id="red">* </span>비밀번호</label> 
					<div class="col-sm-5">
						<input type="password" class="form-control" name="mPassword" id="mPassword_set">
						<span class="vali_notice">8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요</span>
					</div>
				</div>
				<hr>
     			<div class="form-group">
					<label class="col-sm-3 control-label"><span id="red">* </span>비밀번호 확인</label> 
					<div class="col-sm-5">
						<input type="password" class="form-control" name="mPassword2">
					</div>
				</div>
				<hr>
     			<div class="form-group">
					<label class="col-sm-3 control-label"><span id="red">* </span>이메일 주소</label> 
					<div class="col-sm-5">
						<input type="text" class="form-control" name="mMail" value=${m.mMail }>
					</div>
				</div>
				<hr>
				<button id="set_member" type="submit" class="btn btn-success btn-lg col-xs-2">수정 완료</button>
			</form>
     	    </div>	
		    </div>
     	    <%@include file="/WEB-INF/common_view/footer.jsp"%>
		    </div>
	<%@include file = "/WEB-INF/script/sidebar_script.jsp" %>		    
	<%@include file = "/WEB-INF/script/register_script.jsp" %>
	<%@include file = "/WEB-INF/script/board_script.jsp" %>
	<%@include file = "/WEB-INF/modal/register_modal.jsp" %>
	<%@include file = "/WEB-INF/script/member_script.jsp" %>
	<script type="text/javascript">
	$(function(){
		member_setting();
	});
	//var validator = $( "#member_set_form" ).validate();
	
	function member_setting(){
		$('#member_set_form').validate({
			onkeyup:function(elem, e){
				//alert(e.target.id)
				if(this.element(elem)){
					$(e.target).siblings().remove()
					$(e.target).parent().addClass('has-success').removeClass("has-error").append('<span class="glyphicon glyphicon-ok form-control-feedback"></span>')
					
				}else {
					var $parent = $(e.target).parent()
					$(e.target).siblings().remove()
					$parent.removeClass('has-success').addClass("has-error")
					$parent.append('<span class="glyphicon glyphicon-remove form-control-feedback" style = "right: 12px;"></span>')
				};
			},
			rules: {
				mId: {
					required:true
					
				},
				mPassword: {
					required:true,
					passwordcheck:true
				},
				mPassword2: {
					required:true,
					equalTo:"#mPassword_set"
				},
				mMail: {
					required:true,
					email: true,
					emailcheck:true
				},
				mNick: {
					required:true,
					Hancheck: true
				}
			},
			submitHandler: function(frm){
				//frm.submit();
			},
			invalidHandler: function(event, validator) {
			    // 'this' refers to the form
			    //var isvalid = validator.element( "#"+event.target.id);
				alert(validator)
		 	}

		})
	};
	
	</script>
</body>
</html>