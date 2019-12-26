<%@page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>회원 관리</title>
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
</head>
<body>
	<div class="container">
		<!-- header -->
		<%@include file="/WEB-INF/common_view/header.jsp"%>
		<div class="row row-ma" style="min-height: 100%">
			<!-- side bar -->
			<%@include file="/WEB-INF/common_view/sidebar.jsp"%>
			<!-- screen -->
			<div class="col-sm-9" style="height: 74vh;">
				<ul class="nav nav-tabs"
					style="margin-top: 20px; margin-bottom: 30px;">
					<li class="active"><a data-toggle="tab" href="#home">활동 회원</a></li>
					<li><a data-toggle="tab" href="#menu1">탈퇴 회원</a></li>
				</ul>
				<div class="tab-content">
					<div id="home" class="tab-pane fade in active">
						<p>아이디, 닉네임, 가입 날짜, 이메일로 회원을 검색할 수 있습니다 :</p>
						<input class="form-control" id="InfoInput" type="text"
							placeholder="Search.." style="margin-bottom: 20px;">
						<table class="table text-#7f888f table-hover">
							<colgroup>
								<col style="width: 6%">
								<col style="width: 20%">
								<col style="width: 20%">
								<col style="width: 15%">
								<col style="width: 15%">
								<col style="width: 5%">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">등급</th>
									<th scope="col">아이디</th>
									<th scope="col">닉네임</th>
									<th scope="col">가입 날짜</th>
									<th scope="col">이메일</th>
									<th scope="col"></th>
								</tr>
							</thead>
							<tbody id="infoTable">
								<c:forEach var="a" items="${memberAll }">
									<tr id="tr_list">
										<th scope="row">${a.mGrade}</th>
										<td class="board_title text-decoration-none">${a.mId}</td>
										<td>${a.mNick }</td>
										<td>${a.mJoinDate }</td>
										<td>${a.mMail}</td>
										<td><button onclick="admin_delete_m('${a.mId}')">
												<i class="glyphicon glyphicon-remove"></i>
											</button></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div id="menu1" class="tab-pane fade">
						<p>아이디, 닉네임, 가입 날짜, 이메일로 회원을 검색할 수 있습니다 :</p>
						<input class="form-control" id="InfoInput" type="text"
							placeholder="Search.." style="margin-bottom: 20px;">
						<table class="table text-#7f888f table-hover">
							<colgroup>
								<col style="width: 6%">
								<col style="width: 20%">
								<col style="width: 20%">
								<col style="width: 15%">
								<col style="width: 15%">
								<col style="width: 15%">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">등급</th>
									<th scope="col">아이디</th>
									<th scope="col">닉네임</th>
									<th scope="col">탈퇴 날짜</th>
									<th scope="col">가입 날짜</th>
									<th scope="col">이메일</th>
								</tr>
							</thead>
							<tbody id="infoTable">
								<c:forEach var="b" items="${memberNAll }">
									<tr id="tr_list">
										<th scope="row">${b.mGrade}</th>
										<td class="board_title text-decoration-none">${b.mId}</td>
										<td>${b.mNick }</td>
										<td>${b.mDeleteDate }</td>
										<td>${b.mJoinDate }</td>
										<td>${b.mMail}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<%@include file="/WEB-INF/common_view/footer.jsp"%>
	</div>
	<%@include file="/WEB-INF/script/sidebar_script.jsp"%>
	<%@include file="/WEB-INF/script/member_script.jsp"%>
</body>
</html>