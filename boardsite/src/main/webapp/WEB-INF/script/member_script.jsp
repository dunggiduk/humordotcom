<%@page contentType="text/html;charset=UTF-8" %>
<script type = "text/javascript">
/*
admin 회원 검색
*/
$(document).ready(function(){
  $("#InfoInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();//영문을 검색했다면 검색한 것을 소문자로 바꿈.
    $("#infoTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)//indexOf는 일치하는 값이 없으면 -1을 반환함.
    });
  });
});
$(function(){
	/*
	헤더에 로그인 유지하기
	*/
	if($('#logoutH').data('slog').toString().length > 0){
		//history.replaceState({}, null, location.pathname);
		login_header();
	} else {
		logout_header();
	}

});
	/*
	* 로그인 하기
	*/
	function login_member() {
	if($('#login_id').val().length != 0){
		if($('#login_pass').val().length != 0){
			var param = $('#login_form').serialize();
			 $.ajax({
					url : 'login_member.do', 
					method : 'POST',
					data : param,
					dataType : 'TEXT',
					success : function(text) {
							if(text=="비회원"){
								alert("존재하지 않는 회원입니다");
							} else if (text=="탈퇴회원") {
								alert("탈퇴한 회원입니다");
							} else if(text=="틀림") {
								alert("아이디와 비밀번호가 일치하지 않습니다");
							} else {	
								//$("#loginH").data("slog",data);
								//data-slog의 세션아이디가 null이 아니면 show하게되는 상황.
								//자바스크립트 이전에 이미 html파싱이 되어있는 상태.
								//새로고침을 하지 않는 이상 data-slog는 null임.
								//위의 작업을 하지 않고 바로 login()을 하게 된다면 
								//data-slog는 null상태이므로 hide되고 
								//새로고침해야 다시 html을 파싱하므로 21gmldms님 환영합니다 라고 뜸.
								$('#loginH').html("<form id='after_login_form' class='navbar-form navbar-right'><span><a id='login_Hi' href='#'>"+text+"</a>님 환영합니다.</span><button type='submit' class='btn btn-default'>회원관리</button><button onclick='logout_member()' type='button' class='btn btn-default'>로그아웃</button></form>");
								login_header();
								location.reload();//안해주면 board_detail에서 닉네임 자동완성이 안되어있는 오류 발생.
							}
						},
				 	error : function() {
				 		alert('error');
				 	}
				 })
			} else {
				alert('비밀번호를 입력하세요');
			}		
		} else {
			alert('아이디를 입력하세요');
		}
	};
	$("#login_pass").on("keyup",function(e){

		if(e.keyCode == 13){
			login_member();
		}
		
	})
	
	/*
	로그아웃 하기
	*/
	function logout_member(){
		$.post("/logout.do", function(data, textStatus, req) {
			alert(data)
			location.reload();
		})
	};
	/*****************find*****************/
	/*
	아이디 찾기
	*/
	$('#id_find_action').click(function(){
		var mail = $('#id_email').val();
		if(mail==""||mail==undefined){
			alert('이메일을 입력하세요');
		} else {
			var promise = $.ajax({
				url:"/id_find_action.do",
				method: 'post',
				data: "mMail="+mail
			});
			promise.done(function(text){
				$('.id_find_content').children().remove();
				$('.id_find_content').append('<p>가입한 아이디는 <span id="result_id">'+text+'</span>입니다.</p><br><button type="button" onclick="/main.do;" class="btn btn-default">비밀번호 찾기</button>');
			});
			promise.fail(function(){alert('가입된 아이디가 없습니다')});

		}
	});
	/*
	비밀번호 찾기
	*/
	$('#pass_find_action').click(function(){
		var mId = $('#pass_id').val();
		var mMail = $('#pass_email').val();
		var param = "mId="+mId+"&mMail="+mMail;
		var promise = $.ajax({
			url : '/pass_find_action.do',
			method : 'post',
			data : param
		});
		promise.done(function(text){
			if(text==""){
				alert('아이디와 이메일이 일치하지않습니다.');
			}else {
				$('.id_find_content').children().remove();
				$('.id_find_content').append('<p>비밀번호 앞자리 3글자는 <span id="result_id">'+text+'</span>입니다.</p><br><button type="button" onclick="/main.do;" class="btn btn-default">메인으로</button>');
			}
		});
	});

	/*
	header hide&show
	*/
	function login_header(){
		$('#loginH').removeClass("hide");
		$('#loginH').addClass("show");
		$('#logoutH').removeClass("show");
		$('#logoutH').addClass("hide");
	};
	function logout_header(){
		$('#loginH').removeClass("show");
		$('#loginH').addClass("hide");
		$('#logoutH').removeClass("hide");
		$('#logoutH').addClass("show");
	};
	/****************admin***************/
	/*
	회원 탈퇴 처리
	*/
	function admin_delete_m(mId){
		var param = "mId="+mId;
		if(confirm('정말 탈퇴시키겠습니까?')){
			$.post("/admin_delete_member.do",param,function(data){
				if(data=='true'){
					alert('탈퇴처리되었습니다');
					location.reload();
				} else {
					alert('에러입니다');
				}
			})
		} else {
			alert('취소되었습니다');			
		}
	}
</script>