<%@page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html >
<html>

<head>
	<title>유머 게시판</title>
	
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
		#pass_id {
			margin-top:15px; 
			margin-bottom: 15px;
		}
		.label {
			margin-right: 15px;
		}
	</style>

</head>

<body>
	<div class="container">
	<div class="row" style="height: 95.5vh;">
		<%@include file= "/WEB-INF/common_view/header.jsp" %>
			<br>
			<div class="col-sm-12 id_find_content">
					<span class="label">아이디</span><input id="pass_id"/>
					<br>
					<span class="label">이메일</span><input id="pass_email"/>
					<br>
					<br>
					<button type="button" class="btn btn-default" id="pass_find_action">확인</button>
			</div>
	</div>		
		<%@include file="/WEB-INF/common_view/footer.jsp"%>
	</div>

<%@include file = "/WEB-INF/script/member_script.jsp" %>
<%@include file = "/WEB-INF/script/register_script.jsp" %>
<%@include file = "/WEB-INF/modal/register_modal.jsp" %> 


</body>
</html>
