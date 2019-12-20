<%@page import="javassist.expr.Instanceof"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	List<Map> board = (List<Map>) request.getAttribute("board");
%>
<!DOCTYPE html >
<html>
<head>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script defer src="https://use.fontawesome.com/releases/v5.0.8/js/solid.js" integrity="sha384-+Ga2s7YBbhOD6nie0DzrZpJes+b2K1xkpKxTFFcx59QmVPaSA8c7pycsNaFwUK6l" crossorigin="anonymous"></script>
<script defer src="https://use.fontawesome.com/releases/v5.0.8/js/fontawesome.js" integrity="sha384-7ox8Q2yzO/uWircfojVuCQOZl+ZZBg2D2J5nkpLqzH1HY0C1dHlTKIbpRz/LG23c" crossorigin="anonymous"></script>
<title><%=board.get(0).get("BTITLE")%> - 유머닷컴</title>
<style type="text/css">
.line {
	color: #dbdbdb;
}

.top_div {
	padding: 6px 6px 6px 6px;
}

hr {
	margin-top: 10px;
	margin-bottom: 10px;
	border-width: 1px;
}
#nav_footer{
	margin-bottom:0px;
}
h4 {
	display: inline;
}
.comment_count {
	 font-weight:900;
}
.disnon {
	display: none;
}
.matbot{
	margin-top: 0px; 
	border-top: 1px solid #ddd;
}
table {
	margin-bottom: 0px;
}
</style>
</head>
<body>
	<div class="container">
	<%@include file= "/WEB-INF/common_view/header.jsp" %>
		<br>
		<h4 class="board_title"><%=board.get(0).get("BTITLE")%></h4>
		<!-- 수정버튼 -->
		<button  type="button" class="btn-lg close" id="update_modal_do" aria-label="Close" onclick="update_board()">
          <span aria-hidden="true">수정</span>
        </button>
		<!-- 삭제버튼 -->
		<button id="boardDeleteButton" type="button" class="btn-lg close" aria-label="Close" onclick="delete_board()" >
          <span aria-hidden="true">&times;</span>
        </button>
        <!-- 숨겨져 있는 삭제 버튼 -->
		<button id="boardDeleteHideButton" type="button" class="btn-lg close hide" aria-label="Close" data-toggle="modal" data-target="#password_confirm_modal" >
          <span aria-hidden="true">&times;</span>
        </button>
		<hr />
		<div class="top_div">
			<span class="board_no"><%=board.get(0).get("BNO")%></span> 
			<span class="line">|</span> 
			<span class="board_nick"><%=board.get(0).get("BNICK")%></span> 
			<span class="line">|</span> 
			<span class="board_views">조회수 <%=board.get(0).get("BVIEWS")%></span>
			<span class="line">|</span> 
			<span class="board_vote">추천 0</span> 
			<span class="line">|</span> 
			<span class="board_time"><%=board.get(0).get("BDAY")%>  <%=board.get(0).get("BTIME")%></span>
		</div>
		<hr />
		<div>
			<div>
			<div id="imageDiv">
				<img src="../img/<%=board.get(0).get("BIMAGE")%>"/>
			</div>
			<br>
				<p class="board_content"><%=board.get(0).get("BCONTENT")%></p>
				<br>
				<br>
				<br>
				<br>
				<div align="center">
       			   <button id="rec_update" type="button" class="btn btn-default btn-sm">
         			  <span class="glyphicon glyphicon-thumbs-up"></span> 추천 <%=board.get(0).get("BVOTE")%>
       			   </button>
				</div>
				<br>
			</div>
		</div>
		<br>
		<span class="comment_count">
		댓글 
		<c:choose>
	        <c:when test="${board.get(0).RNO!=null}">
	            ${fn:length(board)}
	        </c:when>         
	        <c:otherwise>
	           0
	         </c:otherwise>
	    </c:choose>
		개
		</span>
		<br>
		<br>
		
		<table class="table" >
			<colgroup>
				<col style="width: 16%">
				<col>
				<col style="width: 20%">
				<col style="width: 5%">
			</colgroup>
			<tbody>
				<c:forEach var="board_c" items="${board}">
					<tr>
						<td style="display: none;">${board_c.RNO }</td>
						<td class="c_nick text-center">
						<c:if test="${board_c.RMID!=null }">
							<span class="glyphicon glyphicon-user" style="color:green;"></span>
						</c:if>
						${board_c.RNICK }
						</td>
						<td class="c_content">${board_c.RCONTENT }</td>
						<td class="c_time text-center">
							<jsp:useBean id="now" class="java.util.Date" /> 
							<fmt:formatDate value="${now}" pattern="yyyy/MM/dd" var="toDay" /> <c:choose>
								<c:when test="${board_c.RDAY == toDay}">${board_c.RTIME}</c:when>
								<c:otherwise>${board_c.RDAY}</c:otherwise>
							</c:choose></td>
						<c:if test="${board_c.RNO!=null}">
						<td><button onclick="comment_delete(${board_c.RNO })"><i class="glyphicon glyphicon-remove"></i></button></td>

						</c:if>	
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<hr class="matbot" />
		<span  style="font-weight:900;">댓글쓰기</span>
		<hr />
		<br>
		<form>
			<div class="form-group row disnon">
				<div class="col-sm-10">
					<input class="form-control" id="bNo" placeholder="글번호"
						value="<%=board.get(0).get("BNO")%>">
				</div>
			</div>
			<div class="form-group row disnon">
				<div class="col-sm-10">
					<input class="form-control" id="rMid" placeholder="id"
						value="${sessionScope.loginM}">
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-3">
					<input class="form-control" id="rNick" 
						<c:if test="${sessionScope.loginN!=null }">
							value=${sessionScope.loginN} readonly="readonly"
						</c:if>
						placeholder="닉네임">
				</div>
			</div>
			<div class="form-group row" id="pass_choice">

			</div>
			<div class="form-group row">
				<div class="col-sm-12 pull-right">
					<textarea class="form-control pull-right" id="rContent" rows="5"
						placeholder="내용을 작성하세요"></textarea>
				</div>
			</div>

			<div class="form-group row">
				<div class="col-sm-12">
					<a href="#" class="btn btn-default btn-lg pull-right"
						onclick="write_comment()">등록</a>
				</div>
			</div>
		</form>
		<br>
		<br>
		<%@include file= "/WEB-INF/common_view/footer.jsp" %>
	</div>
	<%@include file = "/WEB-INF/script/member_script.jsp" %>
	<%@include file = "/WEB-INF/script/board_script.jsp" %> 
	<%@include file = "/WEB-INF/modal/password_confirm_modal.jsp" %> 
	<%@include file = "/WEB-INF/modal/board_update_modal.jsp" %> 
	<%@include file = "/WEB-INF/modal/delete_comment_confirm_modal.jsp" %> 
	<script type="text/javascript">
	$(function(){
		/*로그인 안했을 때 댓글에 비밀번호 치기*/
		if(!$('#rMid').val()){
			$('#pass_choice').append('<div class="col-sm-3"><input type="password" class="form-control" id="rPassword"	placeholder="비밀번호"></div>')
		};
		/*
		이미지 아이콘 없애기
		*/
		var a = "<%= board.get(0).get("BIMAGE") %>";
		if (a=="Not-Found-Image"){
			$("#imageDiv").remove()
		}
		/*
		추천 버튼 클릭
		*/
		$("#rec_update").click(function(){
			var bNo = $('.board_no').text();
			var param = "bNo="+bNo;
			$.ajax({
				url: "/Vote_Update.do",
                type: "POST",
                data: param,
                success: function (text) {
                	if(text==3){
                		alert('회원만 추천 가능합니다');
                	}
			        location.reload();
                },
			})
		});
		/*
		글 수정 모달 비밀번호 input
		*/
		if(!$('#update_b_id').val()){
			$('#pass_f_up').html('<label for="inputPassword3"	class="col-sm-3 col-form-label text-center">비밀번호</label><div class="col-sm-6"><input type="password" class="form-control" id="bPassword" name = "bPassword" ></div>')
		};

	});


	/**********comment crud****************/
		function write_comment() {
			var bNo = $('#bNo').val();
			var rMid = $('#rMid').val();
			var rNick = $('#rNick').val();
			if (rNick.length==0) {
				alert('닉네임을 입력하세요');
			} else {
				var rPassword = $('#rPassword').val();
				if(rMid==undefined){
					if (rPassword.length==0) {
						alert('비밀번호를 입력하세요');
					}
				} else {
					var rContent = $('#rContent').val();
					if (rContent.length==0) {
						alert('내용을 입력하세요');
					} else {
						var paramsJson = {
							bNo : bNo,
							rMid : rMid,
							rNick : rNick,
							rPassword : rPassword,
							rContent : rContent
						};
						$.ajax({
							url : 'insertBoardComment.do',
							method : 'GET',
							data : paramsJson,
							dataType : 'text',
							success : function(textData) {
								if (textData.trim() == 'false') {
									alert('댓글 등록에 실패했습니다')
								} else {
									alert('작성되었습니다');
									location.reload();
								}
							},
							error : function() {
								alert('error');
							}
						});
					}
				}
			}
		};
		function comment_delete(rNo) {
			confirm('삭제하시겠습니까');
				$.ajax({
					url : '/deleteBoardComment.do',
					method : 'GET',
					data : "rNo="+rNo,
					dataType : 'text',
					success : function(textData){
								if(textData.trim()=='삭제되었습니다'||textData.trim()=='작성자만 삭제 가능합니다'){
									alert(textData);
									location.reload();
								}else{
									$('#delete_comment_confirm').modal();
									$('#delete_rNo').text(textData);//modal의 value값 설정.
								}
								
					},
					error : function() {
						alert('삭제가 실패되었습니다');
					}
					
				})
		};
		function comment_delete_action() {//modal에서 확인 누를 때
			var param = "rPassword="+$('#d_c_rPassword').val()+"&rNo="+$('#delete_rNo').text();
			$.ajax({
				url : '/deleteBoardCommentAction.do',
				method : 'POST',
				data : param,
				dataType : 'text',
				success : function(textData){
							alert(textData);
							location.reload();
				},
				error : function() {
					alert('error');
				}
				
			})
		};
		/***************board ud**************/
		/*
		회원이 작성한 글 수정하기
		*/
		function update_board(){
			var bNo = $('.board_no').text();
			var param = "bNo="+bNo;
			//수정할 권한이 있는가?
			$.get('/udReady.do',
					param,
					function(data){
						if(data=="3"){
							alert("작성자만 수정 가능합니다");
					  } else if (data=="2") {//아이디가 존재하는 글 수정
						  alert('2');
							$('#board_update_modal').modal();
							$('#update_bNo').val(bNo);
					   } else if (data=="1") {
							//modal창.
							//$('#board_update_modal').click();
						   $('#password_confirm_modal').modal();
							$('#password_confirm').click(function(){
								update_board_a();
							});
						}
			})
		};
		/*
		익명 글 수정하기
		*/
		function update_board_a() {
				var bNo = $('.board_no').text();
				var password = $('#d_bPassword').val();
				var param = "bNo="+bNo+"&bPassword="+password;
				$.post('/updateBoardI.do',
						param,
						function(data){
							if(data=="1"){
								$('#board_update_modal').modal();
								$('#update_bNo').val(bNo);
							} else if (data=="2") {
								alert("비밀번호가 일치하지않습니다");
							} else {
								alert("비밀번호가 존재하지 않는 글입니다");
							}
				})
		};
		/*
		회원이 작성한 글 삭제하기
		*/
		function delete_board(){
			var bNo = $('.board_no').text();
			var param = "bNo="+bNo;
			//삭제할 권한이 있는가?
			$.get('/udReady.do',
					param,
					function(data){
						if(data=="3"){
							alert("작성자만 삭제 가능합니다");
					  } else if (data=="2") {//아이디가 존재하는 글 삭제
							if(confirm('정말 삭제하시겠습니까?')){
								var tru_bNo = "bNo="+bNo;
								if(true) {
									$.get('/deleteBoard.do',
											tru_bNo,
											function(text){
												alert(text);
												location.href='/drip_board.do';
									})
								}
							}
					   } else if (data=="1") {
							//modal창.
							$('#password_confirm_modal').modal();
							/*
							모달창에서 패스워드 입력 후 확인 버튼 눌렀을 때
							*/
							$('#password_confirm').click(function(){
								delete_board_a();
							});
						}
			})
		};
		/*
		익명 글 삭제(modal function)
		*/
		function delete_board_a(){
			var bNo = $('.board_no').text();
			var password = $('#d_bPassword').val();
			var param = "bNo="+bNo+"&password="+password;
			$.get('/deleteBoard_a.do',
					param,
					function(data){
						if(data=="1"){
							alert("삭제했습니다");
							location.href='/drip_board.do';
						} else if (data=="2") {
							alert("비밀번호가 일치하지않습니다");
						} else {
							alert("비밀번호가 존재하지 않는 글입니다");
						}
			})
		};

	</script>
</body>
</html>