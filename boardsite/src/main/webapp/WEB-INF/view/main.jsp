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
	}
	.marginB{
		margin-bottom: 10px
	}
	.todayHeader{
		border-bottom: 1px solid black;
		font-weight: bold;
	}
	
</style>
</head>

<body>
	<div class="container">

		 <%@include file="/WEB-INF/common_view/header.jsp"%>

		
		<div class="row" style="height: 72.5vh; margin-top:10px;">
			<div class = "col-sm-12">
				<!-- ㅇㅇ -->
			<div class="col-sm-2" style="float: left;">
				<div id="vote_box" class="funbox" style="font-size: 12px; margin-top: 19px;">
					<p class = "marginB todayHeader" style="margin-top: 10px; margin-bottom: 15px">이번 주의 투표</p>
					<div id = "vote_content">
					<p id="vote_one_r" class = "marginB"><input type = "radio" name="radioValue" value=1>  부먹</p> 
					<p id="vote_two_r"><input type = "radio" name="radioValue" style="margin-bottom: 15px;" value=2>  찍먹</p>
					<button type="button" class="btn btn-default" id="week_vote_button" style="margin-right: 6px; font-size: 12px; padding:4px 10px;">투표</button>
					<button class="btn btn-default" id="Wvote_result" style="font-size: 12px; padding:4px 10px;">결과</button>
					</div>
				</div>
			</div>	
			<div class="leftbox col-sm-5" >
                <div class="top center" style="text-align:center;mragin-top:5px; margin-bottom: 5px;border-bottom: 1px solid black;
		font-weight: bold;"><span style="font-size:1em; color:black; text-decoration:none;">베스트 오브 베스트</span></div>
                <div class="middle center" style="font-size: 12px;">
                	<ul style="list-style: none; padding-left: 0px; margin-bottom: 0px;">
                	<c:forEach var="bob" items="${bob }">
                		<li style="margin-bottom: 3px;">
                		<img src="/img/fire.png"/>
                        <span class="subject">
                          <a href="drip_board_detail.do?bNo=${bob.bNo}" target="_top" style="margin-right: 10px; color: #4F4F4F">
                       		    ${bob.bTitle } </a></span> <span class="memocount" style="color: red; font-weight: bold;">[
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
                <div class="top center" style="text-align:center; margin-bottom: 5px;border-bottom: 1px solid black;
		font-weight: bold;"><span style="font-size:1em; color:black; text-decoration:none;">일일 베스트 게시글</span></div>
                <div class="middle center" style="font-size: 12px;">
                	<ul style="list-style: none; padding-left: 0px; margin-bottom: 0px;">
                	<c:forEach var="bot" items="${bot }">
                		<li style="margin-bottom: 3px;">
                		<img src="/img/fire.png"/>
                        <span  class="subject">
                          <a href="drip_board_detail.do?bNo=${bot.bNo}" target="_top" style="margin-right: 10px; color: #4F4F4F">
                       		    ${bot.bTitle } </a></span> <span class="memocount" style="color: red; font-weight: bold;">[
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
				<div  class="col-sm-2" style="float: left; ">
					<div class="funbox">
						<p class = "marginB todayHeader">출석체크</p><p></p>
						<button class="btn btn-default" style="font-size: 12px; padding:4px 10px;">출첵하기</button>
					</div>
				</div>
				<div class="col-sm-5">
					<div class=" embed-responsive embed-responsive-16by9" style="margin-top: 15px;">
	  					<iframe class="embed-responsive-item" src="https://www.youtube.com/embed/D1PvIWdJ8xo">
	  					</iframe>
					</div>
				</div>
				<div class="col-sm-5" >
					<div class="col-sm-12" style="margin-top: 15px; background-color: #2DB400;text-align:center; margin-bottom: 5px;border-bottom: 1px solid black;font-weight: bold;">
						<span style="font-size:1em; color:white; text-decoration:none;">네이버 실시간 검색 순위</span>
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


		<%@include file="quote_modal.jsp"%>
		<%@include file="main_script.jsp"%>
		<%@include file="member_script.jsp"%>
		<%@include file="board_script.jsp"%>
		<%@include file="register_script.jsp"%>
		<%@include file="board_modal.jsp"%>
		<%@include file="register_modal.jsp"%>
</body>
</html>
