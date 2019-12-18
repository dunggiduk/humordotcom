<%@page contentType="text/html;charset=UTF-8"%>


<div class="modal register fade" id="register_modal">
  <div class="modal-dialog">
    <div class="modal-content">
    
    <div class="modal-header">
        <h5 class="modal-title">회원 가입</h5>
        <button type="button" class="close" data-dismiss="modal"></button>
    </div>
    
    <div class="modal-body">
		<form id="register_form" action="/insert_member.do" method="post">
			<div class="form-group row">
				<label class="col-sm-3 col-form-label text-center">아이디</label>
				<div class="col-sm-5">
					<input class="form-control" id="reg_mId" name="mId"
						value="">
				</div>
			</div>
			<br>
			<div class="form-group row">
				<label class="col-sm-3 col-form-label text-center">비밀번호</label>
				<div class="col-sm-5">
					<input type="password" class="form-control" id="reg_mPassword1" name="mPassword"
						>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-3 col-form-label text-center">비밀번호 확인</label>
				<div class="col-sm-5">
					<input type="password" class="form-control" id="reg_mPassword2" name="mPassword2"
						>
				</div>
			</div>
			<br>
			<div class="form-group row">
				<label class="col-sm-3 col-form-label text-center">이메일</label>
				<div class="col-sm-5">
					<input type="email" class="form-control" id="reg_mMail" name="mMail">
				</div>
			</div>
			<br>
			<div class="form-group row">
				<label class="col-sm-3 col-form-label text-center">닉네임</label>
				<div class="col-sm-5">
					<input class="form-control" id="reg_mNick" name="mNick">
				</div>
			</div>


		
	</div>
	  <div class="modal-footer">
       	    <button type="submit" class="btn btn-default">가입하기</button>
        	<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
		</form>
</div>
</div>
</div>

