<%@page contentType="text/html;charset=UTF-8"%>	
<script type="text/javascript">
	$(function(){
		recCount();
		/*
		로그인 시 헤더 유지
		*/
		/*
		var id = $('#loginH').data('slog');
		if(id){
			$('#loginH').html("<form id='after_login_form' class='navbar-form navbar-right'><span><a id='login_Hi' href='#'>${sessionScope.loginM}</a>님 환영합니다.</span><button type='submit' class='btn btn-default'>회원관리</button><button onclick='logout_member()' type='button' class='btn btn-default'>로그아웃</button></form>");
		} else {
			$('#loginH').html("<form id='login_form' class='navbar-form navbar-right'><div class='form-group'><input id = 'login_id' name = 'mId' type='text' class='form-control' placeholder='아이디'><input id = 'login_pass' name = 'mPassword' type='text' class='form-control' placeholder='비밀번호'></div><button type='submit' class='btn btn-default' onclick='login_member()'>로그인</button><button type='button' class='btn btn-default' data-toggle='modal' data-target='#register_modal'>회원가입</button></form>");
		};
		*/
		var a = "<%=Board.get(0).get("BIMAGE")%>";
		if (a=="Not-Found-Image"){
			$("#imageDiv").remove()
		}
		/*
		추천 버튼 클릭
		*/
		$("#rec_update").click(function(){
			var id = $('#loginH').data('slog');
			var bNo = $('.board_no').text();
			var param = "bNo="+bNo+"&mId="+id;
			$.ajax({
				url: "/Vote_Update.do",
                type: "POST",
                data: param,
                success: function () {
			        recCount();
			        location.reload();
                },
			})
		});
		
	});
		// 게시글 추천수
	    function recCount() {
	    	var bNo = $('.board_no').text();
			$.ajax({
				url: "/Vote_Count.do",
                type: "POST",
                data: "bNo="+bNo,
                success: function (count) {
                	$(".vote_count").html(count);
                },
			})
	    };

	/**********comment crud****************/
		function write_comment() {
			var bNo = $('#bNo').val();
			alert(bNo)
			var mId = $('#mId').val();
			alert(mId);
			var rNick = $('#rNick').val();
			if (rNick.trim() == null || rNick.trim() == "") {
				alert('닉네임을 입력하세요');
			} else {
				var rPassword = $('#rPassword').val();
				if (rPassword.trim() == null || rPassword.trim() == "") {
					alert('비밀번호를 입력하세요');
				} else {
					var rContent = $('#rContent').val();
					if (rContent.trim() == null || rContent.trim() == "") {
						alert('내용을 입력하세요');
					} else {
						var paramsJson = {
							bNo : bNo,
							mId : mId,
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
			alert(rNo);
			confirm('삭제하시겠습니까');
				if(true) {
				$.ajax({
					url : '/deleteBoardComment.do',
					method : 'GET',
					data : rNo,
					dataType : 'text',
					success : function(textData){
						if(textData.trim()=='true'){
								alert('삭제되었습니다');
								location.reload();
						}
					},
					error : function() {
						alert('삭제가 실패되었습니다');
					}
					
				})
				} else {
				}
		};
		/***************board ud**************/
		/*
		글 수정하기
		*/
		function update_board() {
			var board_nick = $('.board_nick').text();
			var board_password = <%=Board.get(0).get("BPASSWORD")%>
			var board_title = $('.board_title').text();
			var board_content = $('.board_content').text();
			alert('닉네임='+board_nick+' 비밀번호='+board_password+' 글제목='+board_title+' 글내용='+board_content);
			$('#bPassword').val() = board_password;
			$('#bTitle').val() = board_title;
			$('#bContent').val() = board_content;
		};
		/*
		회원이 작성한 글 삭제하기
		*/
		function delete_board(){
			var bNo = <%=Board.get(0).get("BNO")%>;
			var writerOk = $('#loginH').data('slog');
			var param = "bNo="+bNo+"&mId="+writerOk;
			//삭제할 권한이 있는가?
			$.get('/udReady.do',
					param,
					function(data){
						if(data=="3"){
							alert("작성자만 삭제 가능합니다");
						//익명X글 삭제
					  } else if (data=="2") {
							confirm('정말 삭제하시겠습니까?');
							var tru_bNo = "bNo="+bNo;
							if(true) {
								$.get('/deleteBoard.do',
										tru_bNo,
										function(text){
											alert(text);
											location.href='/drip_board.do';
								})
							}
					   } else if (data=="1") {
							//modal창.
							$('#boardDeleteHideButton').click();
						}
			})
		};
		/*
		익명 글 삭제(modal function)
		*/
		function delete_board_a(){
			var bNo = <%=Board.get(0).get("BNO")%>;
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