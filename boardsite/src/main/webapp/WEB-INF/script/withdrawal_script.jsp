<%@page contentType="text/html;charset=UTF-8"%>    
     <script type="text/javascript">
     function withdrawal_confirm() {
    	 if($('#confirm').is(':checked')){
    		$('#withdrawal_confirm_modal').modal();
    	 } else {
    		 alert('동의 후 진행하세요');
    	 }
     };
     function password_submit(){
		 $.ajax({
				url : '/drip_member_withdrawal_action.do', 
				method : 'POST',
				data : $('#delete_submit').serialize(),
				dataType : 'TEXT',
				success : function(text) {
					if(text.trim()=='true'){
						alert('탈퇴되었습니다');
						location.href='/drip_board.do';
					} else if (text.trim()=='false') {
						alert('비밀번호가 일치하지 않습니다');
					} else if (text.trim()=='false2') {
						alert('존재하지 않는 회원입니다');
					} else if (text.trim()=='false3') {
						alert('비밀번호를 입력하세요');
					}
					
				},
			 	error : function() {
			 		alert('error');
			 	}
			 })
     }
     </script>