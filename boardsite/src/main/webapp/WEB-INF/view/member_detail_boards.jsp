<%@page import="java.util.Date"%>
<%@page import="java.util.Map"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>

<%@page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<title>회원 정보 보기</title>
	
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
	
	<!-- 도넛 차트 시작-->
	<c:import url='https://fonts.googleapis.com/css?family=Lato:300,400,700/'/>

	body {
		padding: 0;
		margin: 0;
		height: 100%;
		list-style: none;
		overflow: hidden;
		font-family: 'Lato', Calibri, Arial, sans-serif;
	}
	.progressDiv {
		width: 84%;
		background: #fcfcfc;
		height: 325px;
		left: 7%;
		top: 100px;
		display: inline-block;
		border-radius: 2px;
	}

	.statChartHolder {
		width: 35%;
		height: 90%;
		position: relative;
		border-right: 1px solid #ccc;
		top: 15px;
	    display: inline-block;
	}

	.statRightHolder {
		display: inline-block;
		height: 90%;
		width: 64%;
		position: relative;
		top: -15px;
		margin: 0;
	}
	.statRightHolder ul {
		list-style: none;
	    margin: 0;
	}
	.statRightHolder li {
		border-bottom: 1px solid #ccc;
		height: 75px;
		width: 95%;
		position: relative;
		top: -25px;
	}
	.statRightHolder h3 {
		display: inline-block;
		margin-right: 15px;
		color: #B6B5B5;
		font-weight: 300;
		font-size: 35px;
	}
	.statRightHolder span {
		display: inline-block;
		color: #B6B5B5;
		font-size: 21px;
		font-weight: 300;
	}

	.statsLeft {
	    list-style:none;
	    display:inline-block;
	    width:45%;
	}
	.statsLeft li {
		width: 100%;
		height: 14px;
		border: none;
		top: 5px;
		margin-bottom: 25px;
	}
	.statsLeft h3{
	    font-size:17px;
	    font-weight:500;
	    display: inline-block;
	}
	.statsLeft span{
	    font-size: 17px;
	    display:inline-block;
	    color: red;
	}
	.statsRight {
		width: 45%;
		display: inline-block;
		position: absolute;
	}
	.statsRight li {
		width: 100%;
		height: 14px;
		border: none;
		top: 5px;
		margin-bottom: 25px;
	}
	.statsRight h3{
	    font-size:17px;
	    display: inline-block;
	}
	.statsRight span{
	    font-size: 17px;
	    display:inline-block;
	    color: red;
	}
	/* Pie Chart */
	.progress-pie-chart {
	    width:200px;
	    height: 200px;
	    border-radius: 50%;
	    background-color: #E5E5E5;
	    position: relative;
	}
	.progress-pie-chart.gt-50 {
	    background-color: #81CE97;
	}

	.ppc-progress {
	    content: "";
	    position: absolute;
	    border-radius: 50%;
	    left: calc(50% - 100px);
	    top: calc(50% - 100px);
	    width: 200px;
	    height: 200px;
	    clip: rect(0, 200px, 200px, 100px);
	}
	.ppc-progress .ppc-progress-fill {
	    content: "";
	    position: absolute;
	    border-radius: 50%;
	    left: calc(50% - 100px);
	    top: calc(50% - 100px);
	    width: 200px;
	    height: 200px;
	    clip: rect(0, 100px, 200px, 0);
	    background: #81CE97;
	    transform: rotate(60deg);
	}
	.gt-50 .ppc-progress {
	    clip: rect(0, 100px, 200px, 0);
	}
	.gt-50 .ppc-progress .ppc-progress-fill {
	    clip: rect(0, 200px, 200px, 100px);
	    background: #E5E5E5;
	}

	.ppc-percents {
	    content: "";
	    position: absolute;
	    border-radius: 50%;
	    left: calc(50% - 173.91304px/2);
	    top: calc(50% - 173.91304px/2);
	    width: 173.91304px;
	    height: 173.91304px;
	    background: #fff;
	    text-align: center;
	    display: table;
	}
	.ppc-percents span {
	    display: block;
	    font-size: 2.6em;
	    font-weight: bold;
	    color: #81CE97;
	}

	.pcc-percents-wrapper {
	    font-size:2em;
	    display: table-cell;
	    vertical-align: middle;
	}

	.progress-pie-chart {
	    margin: 50px auto 0;
	}
		
	<!-- 도넛 차트 end-->
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
    
    
    .row-ma{
    	padding-left: 15px;
    	padding-right:15px;
    }
    /**************미디어***********/
    @media (max-width: 720px) {
		.statsLeft{
			font-size: 10px
		}
		.statsRight{
			font-size: 10px
		}
	}
	
	@media (min-width: 720px) and (max-width: 990px) {
		.statsLeft{
			font-size: 10px
		}
		.statsRight{
			font-size: 10px
		}
	}
	
	@media (min-width: 990px) {
		.statsLeft{
			width: 40%;
		}
		.statsRight{
			width: 50%;
		}
	}

	}
<
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
     	<div class="col-sm-9" style="float:right; overflow: auto; height: 74vh;">
	

     		<!-- 도넛 차트 시작 -->
     		<div class="progressDiv" style="align-content: center; width: 100%">
     		
				<div class="statChartHolder">
					<div class="progress-pie-chart" data-percent="99"><!--Pie Chart -->
						<div class="ppc-progress">
					    	<div class="ppc-progress-fill"></div>
					    </div>
					<div class="ppc-percents">
				<div class="pcc-percents-wrapper">
					<img src="/img/${sessionScope.loginG } 64.png"/>
				</div>
					</div>
					</div><!--End Chart -->
				</div>
				<div class="statRightHolder">
					<ul>
						<li> <h3 class="blue" style="color: black;">${sessionScope.loginN }</h3> <span>님</span><span id="grade_number">(Lv${sessionScope.loginG })</span></li>
					    <li> <h3 class="purple" style="font-size: 30px; color: black;">${sessionScope.loginD }</h3> <span>가입</span></li>
					</ul>
					<ul class="statsLeft">
					    <li><h3 class="yellow">총 게시글</h3> <span>${write_b }개</span></li>
					    <li><h3 class="red">총 댓글</h3> <span>${fn:length(cb) }개</span></li>
					</ul>
					<ul class="statsRight">
					    <li><h3>출첵 포인트</h3> <span>0 Point</span></li>
					    <li><h3></h3> <span></span></li>
					</ul>
				</div>
			</div>
     		<!-- 도넛 차트 끝 -->
			<br>
     		<h3>작성한 댓글</h3>
     		<hr style="border: 5;">
			<c:choose>
				<c:when test="${fn:length(cb)==0 }">
					<p>작성한 글이 없습니다.</p>
				</c:when>
				<c:otherwise>
     		<table class="table text-#7f888f">
				<colgroup>
					<col style="width:6%">
					<col>
					<col style="width:18%">
					<col style="width:6%">
					<col style="width:8%">
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
					<c:forEach var ="bc" items="${cb }">
						<tr id = "tr_list2">
							<th scope="row" id="board_no2">${bc.bNo}</th>
							<td class="board_title text-decoration-none" id="board_title2"><a href="drip_board_detail.do?bNo=${bc.bNo }">${bc.bTitle }</a>
								[
								<c:choose>
									<c:when test="${bc.bReply.get(0).rNick!=null }">
										${fn:length(bc.bReply) }
									</c:when>
									<c:otherwise>
										0
									</c:otherwise>
								</c:choose>	
								] 
							</td>
							<td id="board_nick2">${bc.bNick }</td>
							<td id="board_time2">
								<jsp:useBean id="now" class="java.util.Date"/>
								<fmt:formatDate value="${now}" pattern="yyyy/MM/dd" var="nowDate" />
								<c:choose>
									<c:when test="${nowDate==bc.bDay}">
										<span>${bc.bTime }</span>
									</c:when>
									<c:otherwise>
										<span>${bc.bDay }</span>
									</c:otherwise>
								</c:choose>	
							</td>
							<td id="board_views2">${bc.bViews }</td>
							<td id="board_vote2">${bc.bVote }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			</c:otherwise>
		</c:choose>
			
			<br>
     		<h3>작성한 글</h3>
     		<hr style="border: 5;">
			<c:choose>
				<c:when test="${write_b==0 }">
					<p style="text-align: center;">작성한 글이 없습니다.</p>
					<br>
				</c:when>
				<c:otherwise>
     		<table class="table text-#7f888f">
				<colgroup>
					<col style="width:6%">
					<col>
					<col style="width:18%">
					<col style="width:6%">
					<col style="width:8%">
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
					<c:forEach var ="b" items="${b }">
						<tr id = "tr_list">
							<th scope="row" id="board_no">${b.bNo}</th>
							<td class="board_title text-decoration-none" id="board_title"><a href="drip_board_detail.do?bNo=${b.bNo }">${b.bTitle }</a>
								[
								<c:choose>
									<c:when test="${b.bReply.get(0).rNick!=null }">
										${fn:length(b.bReply) }
									</c:when>
									<c:otherwise>
										0
									</c:otherwise>
								</c:choose>	
								]
							</td>
							<td id="board_nick">${b.bNick }</td>
							<td id="board_time">
								<fmt:formatDate value="${now}" pattern="yyyy/MM/dd" var="nowDate" />
								<c:choose>
									<c:when test="${nowDate==b.bDay}">
										<span>${b.bTime }</span>
									</c:when>
									<c:otherwise>
										<span>${b.bDay }</span>
									</c:otherwise>
								</c:choose>	
							</td>
							<td id="board_views">${b.bViews }</td>
							<td id="board_vote">${b.bVote }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			</c:otherwise>
		</c:choose>
     	</div>	
    	</div>
    	<%@include file="/WEB-INF/common_view/footer.jsp"%>
    	</div>
<%@include file = "member_detail_boards_script.jsp" %>
<%@include file = "member_script.jsp" %>
<%@include file = "board_script.jsp" %> 
<%@include file = "register_script.jsp" %>
<%@include file = "register_modal.jsp" %> 
</body>
</html>