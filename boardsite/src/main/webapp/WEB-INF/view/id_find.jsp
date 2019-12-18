<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.heeeun.boardsite.board.Board"%>
<%@page import="java.util.List"%>

<%@page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html >
<html>

<head>
	<title>유머 게시판</title>
	
	
<!-- 	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script> -->
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>

	<style type="text/css">
		.id_find_content{
			text-align: center;
			margin-top: 100px;
		}
		#result_id{
			color:red;
			font-weight: bold;
		}
	</style>

</head>

<body>
	<div class="container">
		<div class="row" style="height: 91.5vh;">
		<%@include file= "/WEB-INF/common_view/header.jsp" %>
			<br>
			<div class="col-sm-12 id_find_content">
				<p>가입 시 작성했던 이메일을 입력하세요</p>
					<input id="id_email"/>
					<br>
					<br>
					<button type="button" class="btn btn-default" id="id_find_action">확인</button>
			</div>
		</div>	
		<%@include file="/WEB-INF/common_view/footer.jsp"%>
	</div>

<%@include file = "member_script.jsp" %>
<%@include file = "board_script.jsp" %> 
<%@include file = "register_script.jsp" %>
<%@include file = "board_modal.jsp" %> 
<%@include file = "register_modal.jsp" %> 


</body>
</html>
