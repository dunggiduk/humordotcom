<%@page contentType="text/html;charset=UTF-8"%>
<script type="text/javascript">
	$(function() {
		if ($('#login_Hi').text() == 'admin') {
			$('.header-nav')
					.append(
							'<li><a href="/member_manage.do" id="mm">회원 관리</a></li>')
		}
		/*
		$('#mm').click(function(){
			$.post('/member_manage.do')
			
		})
		*/
	})
	
</script>