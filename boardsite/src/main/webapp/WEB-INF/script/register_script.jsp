<%@page contentType="text/html;charset=UTF-8" %>
<script src="js/jquery.validate.js"></script>
<script src="js/messages_ko.js"></script>
<script type="text/javascript">
	function register_v(){
		$('#register_form').validate({
			rules: {
				mId: {
					required:true
				},
				mPassword: {
					required:true,
					passwordcheck:true
				},
				mPassword2: {
					required:true,
					equalTo:"#reg_mPassword1"
				},
				mMail: {
					required:true,
					email: true,
					emailcheck:true
				},
				mNick: {
					required:true
				}
			},
			submitHandler: function(frm){
				//frm.submit();
			}

		})
	};
	/*
	회원 가입 하기
	*/
	function register_member() {
	var mId = $('#reg_mId').val();
	var mPassword = $('#reg_mPassword2').val();
	var mMail = $('#reg_mMail').val();
	var mNick = $('#reg_mNick').val();
	var param = {
		mId : mId,
		mPassword : mPassword,
		mMail : mMail,
		mNick : mNick
	};
	$.ajax({
		url : 'insert_member.do',
		method : 'POST',
		data : param,
		dataType : 'text',
		success : function(textData) {
			if(textData==true){
				alert('가입되었습니다')
			} else {
				alert('가입에 실패했습니다')
			}
		},
		error : function(){
			alert('error')
		}
	})
	};
</script>