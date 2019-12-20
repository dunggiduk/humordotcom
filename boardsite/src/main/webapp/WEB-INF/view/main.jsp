<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.heeeun.boardsite.board.Board"%>
<%@page import="java.util.List"%>

<%@page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	List<Board> boards = (List<Board>) request.getAttribute("boardList");
%>
<!DOCTYPE html >
<html>

<head>
<title>유머 게시판</title>


<!-- 	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script> -->
<!-- Latest compiled and minified CSS -->
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
	#search_li{
		margin-top: 5px;
	}
	ul{
		list-style: none;
		padding : 0px;
		font-size: 12px;
	}
	#gflhopirvtqnwmuskj .post-wrap {
		margin-right: -15px;
	}
	#gflhopirvtqnwmuskj .post-list {
		float: left;
		width: 100%;
		padding-right: 15px;
	}
	#ouqrkpngfshvmwiljt .post-wrap {
	margin-right: -15px;
	}
	
	#ouqrkpngfshvmwiljt .post-list {
		float: left;
		width: 100%;
		padding-right: 15px;
	}
	#gflhopirvtqnwmuskj .post-wrap {
		margin-right: -15px;
	}
	
	#gflhopirvtqnwmuskj .post-list {
		float: left;
		width: 100%;
		padding-right: 15px;
	}
	#ouqrkpngfshvmwiljt .post-wrap {
		margin-right: -15px;
	}
	
	#ouqrkpngfshvmwiljt .post-list {
		float: left;
		width: 100%;
		padding-right: 15px;
	}
	.positionM{
	    margin: 5rem 0rem;
	}
	.funbox{
		border: 1px solid #DBDBDB; 
		text-align: center;
		padding:1rem;
		ont-size: 12px; 
		margin-top: 19px;
	}
	.marginB{
		margin-bottom: 10px
	}
	.todayHeader{
		border-bottom: 1px solid black;
		font-weight: bold;
		margin-top: 10px; 
		margin-bottom: 15px;
	}
	.main-row {
		height: 72.5vh; margin-top:10px;
	}
	.funbox-outer{
		float: left;
	}
	#week_vote_button {
		margin-right: 6px; 
		font-size: 12px; 
		padding:4px 10px;
	}
	#Wvote_result {
		font-size: 12px; 
		padding:4px 10px;
	}
	input[name=radioValue] {
		margin-bottom: 15px;
	}
	.top-center {
		text-align:center;
		mragin-top:5px; 
		margin-bottom: 5px;
		border-bottom: 1px solid black;
		font-weight: bold;"
	}
	.top-center-head {
		font-size:1em; 
		color:black; 
		text-decoration:none;
	}
	.middle-center {
		font-size: 12px;
	}
	.main_ul {
		 list-style: none; 
		 padding-left: 0px; 
		 margin-bottom: 0px;
	}
	.main_li {
		margin-bottom: 3px;
	}
	.main_li_a {
		margin-right: 10px; 
		color: #4F4F4F;
	}
	.memocount {
		color: red; 
		font-weight: bold;
	}
	.chulcheck {
		font-size: 12px; 
		padding:4px 10px;
	}
	.embed-responsive {
		margin-top: 15px;
	}
	.naver-title {
		margin-top: 15px; 
		background-color: #2DB400;
		text-align:center; 
		margin-bottom: 5px;
		border-bottom: 1px solid black;
		font-weight: bold;
	}
	.naver-title-span {
		font-size:1em; 
		color:white; 
		text-decoration:none;
	}
</style>
</head>

<body>
	<div class="container">

		 <%@include file="/WEB-INF/common_view/header.jsp"%>

		
		<div class="row main-row">
			<div class = "col-sm-12">
				<!-- ㅇㅇ -->
			<div class="col-sm-2 funbox-outer">
				<div id="vote_box" class="funbox">
					<p class = "marginB todayHeader">이번 주의 투표</p>
					<div id = "vote_content">
					<p id="vote_one_r" class = "marginB"><input type = "radio" name="radioValue" value=1>  부먹</p> 
					<p id="vote_two_r"><input type = "radio" name="radioValue" value=2>  찍먹</p>
					<button type="button" class="btn btn-default" id="week_vote_button">투표</button>
					<button class="btn btn-default" id="Wvote_result">결과</button>
					</div>
				</div>
			</div>	
			<div class="leftbox col-sm-5" >
                <div class="top-center"><span class="top-center-head">베스트 오브 베스트</span></div>
                <div class="middle-center">
                	<ul class="main_ul">
                	<c:forEach var="bob" items="${bob }">
                		<li class="main_li">
                		<img src="/img/fire.png"/>
                        <span class="subject">
                          <a class="main_li_a" href="drip_board_detail.do?bNo=${bob.bNo}" target="_top">
                       		    ${bob.bTitle } </a></span> <span class="memocount">[
                       		    <c:choose>
                       		    	<c:when test="${bob.bReply.get(0).rNo!=0 }">
                       		    		${fn:length(bob.bReply) }
                       		    	</c:when>
                       		    	<c:otherwise>
                       		    		0
                       		    	</c:otherwise>
                       		    </c:choose>
                       		    ]</span>
                		</li>
                	</c:forEach>	
                	</ul>
                </div>
                <div class="bottom left"></div>
                <div class="bottom center"></div>
                <div class="bottom right"></div>
            </div>
			<div class="leftbox col-sm-5" >
                <div class="top-center"><span class="top-center-head">일일 베스트 게시글</span></div>
                <div class="middle-center">
                	<ul class="main_ul">
                	<c:forEach var="bot" items="${bot }">
                		<li class="main_li">
                		<img src="/img/fire.png"/>
                        <span  class="subject">
                          <a class="main_li_a" href="drip_board_detail.do?bNo=${bot.bNo}" target="_top">
                       		    ${bot.bTitle } </a></span> <span class="memocount">[
                       		    <c:choose>
                       		    	<c:when test="${bot.bReply.get(0).rNo!=0 }">
                       		    		${fn:length(bot.bReply) }
                       		    	</c:when>
                       		    	<c:otherwise>
                       		    		0
                       		    	</c:otherwise>
                       		    </c:choose>
                       		    ]</span>
                		 </li>
                	</c:forEach>	
                	</ul>
                </div>
                <div class="bottom left"></div>
                <div class="bottom center"></div>
                <div class="bottom right"></div>
            </div>
			</div>

			<div class="col-sm-12">
				<!-- ㅇㅇ -->
				<div  class="col-sm-2 funbox-outer">
					<div class="funbox">
						<p class = "marginB todayHeader">출석체크</p><p></p>
						<button class="btn btn-default chulcheck">출첵하기</button>
					</div>
				</div>
				<div class="col-sm-5">
					<div class=" embed-responsive embed-responsive-16by9">
	  					<iframe class="embed-responsive-item" src="https://www.youtube.com/embed/D1PvIWdJ8xo">
	  					</iframe>
					</div>
				</div>
				<div class="col-sm-5" >
					<div class="col-sm-12 naver-title">
						<span class="naver-title-span">네이버 실시간 검색 순위</span>
					</div>
					<div id="searchList" class = row>
						<div class = "col-sm-6">
							 
							<ul id = "search_one">
								<c:forEach var="cc" begin="0" end="9" step="1" items="${naverS }" varStatus="status">
									<li id="search_li">${status.index+1} <c:out value="${cc}" /></li>
								</c:forEach>
							</ul>
						</div>
						<div class = "col-sm-6">
							<ul id = "search_two">
								<c:forEach var="cc" begin="10" end="19" step="1" items="${naverS }" varStatus="status">
									<li id="search_li">${status.index+1} <c:out value="${cc}" /> </li>
								</c:forEach>
							</ul>	
						</div>
					</div>
				</div>
			</div>
		</div>
		<%@include file="/WEB-INF/common_view/footer.jsp"%>
		</div>


		<%@include file="/WEB-INF/modal/quote_modal.jsp"%>
		<%@include file="/WEB-INF/script/main_script.jsp"%>
		<%@include file="/WEB-INF/script/member_script.jsp"%>
		<%@include file="/WEB-INF/script/board_script.jsp"%>
		<%@include file="/WEB-INF/script/register_script.jsp"%>
		<%@include file="/WEB-INF/modal/board_modal.jsp"%>
		<%@include file="/WEB-INF/modal/register_modal.jsp"%>
</body>
</html>
