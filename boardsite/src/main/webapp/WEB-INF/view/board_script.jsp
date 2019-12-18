<%@page contentType="text/html;charset=UTF-8"%>
<script type="text/javascript">

$(function(){
	if(!$('#mId').val()){
		$('#any_pass').append('<label for="inputPassword3"class="col-sm-3 col-form-label text-center">비밀번호</label>	<div class="col-sm-6"><input type="password" class="form-control" id="bPassword" name = "bPassword"></div>')
	};
	/*
 	이미지 업로드 할 때 이름 수정
 	*/
	$("#upload_File").on('change', function(){  // 값이 변경되면
		if(window.FileReader){  // modern browser
			var filename = $(this)[0].files[0].name;
		} else {  // old IE
			var filename = $(this).val().split('/').pop().split('\\').pop();  // 파일명만 추출
		}
		// 추출한 파일명 삽입
		$("#upload_File").val(filename);
	});

});

/*
	게시판 작성하기
 */
 function board_submit() {
	
	 var bNick = $('#bNick').val();
	 if(bNick.trim()==null || bNick.trim()==''){
		 alert('닉네임을 입력하세요');
	 } else {
		 var bPassword = $('#bPassword').val();
		 var mId = $('#mId').val();
		 if(mId.length==0 && bPassword.length==0){
			 alert('패스워드를 입력하세요');
		 } else {
			 var bTitle = $('#bTitle').val();
			 if(bTitle.trim()==null || bTitle.trim()==''){
				 alert('제목을 입력하세요');
			 } else {
				 var bContent = $('#bContent').val();
				 if(bContent.trim()==null || bContent.trim()==''){
					 alert('내용을 입력하세요');
				 } else {
					 $("#b_write_form").submit();
					 alert('작성되었습니다');
					 location.reload();
				 }
			 }
		 }
	 }
 };


</script>