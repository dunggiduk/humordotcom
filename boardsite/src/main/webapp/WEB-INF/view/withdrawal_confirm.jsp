<%@page contentType="text/html;charset=UTF-8"%>


<div class="modal register fade" tabindex="-1" role="dialog" id="withdrawal_confirm_modal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
	    <div class="modal-header">
	        <h5 class="modal-title" style="display: inline;">비밀번호 확인</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	    </div>
	    <div class="modal-body">
		    <form id="delete_submit">
				<div class="form-group row" style="display: inline;">
					<label class="col-sm-3 col-form-label text-center">패스워드</label>
					<div class="col-sm-6" >
						<input class="form-control" style="display:none" name="mId" value="${sessionScope.loginM }">
						<input type="password" class="form-control" name="mPassword"
							placeholder="패스워드를 입력하세요">
					</div>
				</div>
			</form>
				<div class="modal-footer">
			       	<button type="button" class="btn btn-success" onclick="password_submit();">확인</button>
			        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			    </div>
	    	
		</div>
</div>
</div>
</div>

