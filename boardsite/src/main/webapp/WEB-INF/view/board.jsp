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
		table {
			border-top : 1px solid #DBDBDB;
		
		}
		th,td{
			border-bottom : 1px solid #DBDBDB;
			text-align : center;
		}
		th {
			text-align : center;
		}
		.board_title {
			text-align : left;
		}
		#board_w {
			float: right;
			margin-bottom : 15px;
			margin-top: -11px;
		}
		#pagger {
			float : center;
		}
		.my-2 {
			margin-right : 3px;
			margin-left : 3px;
		}
		form{
			margin-left : 15px;
		}
		.error{
			border-color: red;
			color: red;
			font-size: 0.5rem
		}
	</style>

</head>

<body>
	<div class="container">
		<%@include file= "/WEB-INF/common_view/header.jsp" %>
			<br>
			<h4 style="display: inline; vertical-align: middle;">유머 게시판</h4>
			<button style="vertical-align: middle;" id = "board_w"class="btn btn-dark" data-toggle="modal" data-target="#board_modal">글쓰기</button>
		<table class="table table-sm table-hover text-#7f888f">
			<colgroup>
				<col style="width:6%">
				<col>
				<col style="width:18%">
				<col style="width:6%">
				<col style="width:6%">
				<col style="width:6%">
		    </colgroup>
			<thead>
				<tr>
					<th scope="col">번호</th>
					<th scope="col">제목</th>
					<th scope="col">작성자</th>
					<th scope="col">날짜</th>
					<th scope="col">조회수</th>
					<th scope="col">추천</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="admins" items="${adminList }">
				<tr id = "tr_list" style="background-color: #dcdcdc;">
					<th scope="row" id="board_no">${admins.bNo}</th>
					<td class="board_title text-decoration-none" id="board_title" style="color: red; font-weight: bold;"><a href="drip_board_detail.do?bNo=${admins.bNo}" style="color: red;">${admins.bTitle}</a>
					    [
					<c:choose>
						<c:when test="${admins.bReply.get(0).rNick!=null }">
							${fn:length(admins.bReply) }
						</c:when>
						<c:otherwise>
							0
						</c:otherwise>
					</c:choose>	
					] 
					<jsp:useBean id="now" class="java.util.Date"/>
					<fmt:formatDate value="${now}" pattern="yyyy/MM/dd" var="nowDate" />
					<c:if test="${nowDate==admins.bDay}">
						냥
					</c:if>
					</td>
					<td><img src="/img/cap 16.png"/><span id="board_nick">${admins.bNick}</span></td>
					<td id="board_time">
								<fmt:formatDate value="${now}" pattern="yyyy/MM/dd" var="nowDate" />
								<c:choose>
									<c:when test="${nowDate==admins.bDay}">
										<span>${admins.bTime }</span>
									</c:when>
									<c:otherwise>
										<span>${admins.bDay }</span>
									</c:otherwise>
								</c:choose>	
					</td>
					<td id="board_views">${admins.bViews }</td>
					<td id="board_vote">${admins.bVote }</td>
				</tr>
				</c:forEach>			
				<c:forEach var="boards" items="${boardList }">			
				<tr id = "tr_list">
					<th scope="row" id="board_no">${boards.bNo}</th>
					<td class="board_title text-decoration-none" id="board_title"><a href="drip_board_detail.do?bNo=${boards.bNo}" style="color: black;">${boards.bTitle}</a>
					  [
					<c:choose>
						<c:when test="${boards.bReply.get(0).rNo!=0 }">
							${fn:length(boards.bReply) }
						</c:when>
						<c:otherwise>
							0
						</c:otherwise>
					</c:choose>	
					] 
					<c:if test="${nowDate==boards.bDay}">
						<span class="label label-warning">New</span>
					</c:if>
					</td>
					<td id="board_nick">${boards.bNick}</td>
					<td id="board_time">
								<fmt:formatDate value="${now}" pattern="yyyy/MM/dd" var="nowDate" />
								<c:choose>
									<c:when test="${nowDate==boards.bDay}">
										<span>${boards.bTime }</span>
									</c:when>
									<c:otherwise>
										<span>${boards.bDay }</span>
									</c:otherwise>
								</c:choose>	
					</td>
					<td id="board_views">${boards.bViews }</td>
					<td id="board_vote">${boards.bVote }</td>
				</tr>
			</c:forEach>
				
			</tbody>
		</table>

		<div id = "pagger">
		<nav aria-label="Page navigation example" id="pagination">
		  <ul class="pagination">
		    <li class="page-item disabled">
		      <a class="page-link" href="#" aria-label="Previous">
		        <span aria-hidden="true">&laquo;</span>
		      </a>
		    </li>
		    <li class="page-item"><a class="page-link" href="#">1</a></li>
		    <li class="page-item"><a class="page-link" href="#">2</a></li>
		    <li class="page-item"><a class="page-link" href="#">3</a></li>
		    <li class="page-item">
		      <a class="page-link" href="#" aria-label="Next">
		        <span aria-hidden="true">&raquo;</span>
		      </a>
		    </li>
		  </ul>
	    </nav>
	    </div>
	</div>

<%@include file = "member_script.jsp" %>
<%@include file = "board_script.jsp" %> 
<%@include file = "register_script.jsp" %>
<%@include file = "board_modal.jsp" %> 
<%@include file = "register_modal.jsp" %> 


</body>
</html>
