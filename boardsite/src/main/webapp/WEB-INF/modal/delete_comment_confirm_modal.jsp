<%@page contentType="text/html;charset=UTF-8"%>


<div class="modal register fade" tabindex="-1" role="dialog" id="delete_comment_confirm">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
	    <div class="modal-header">
	        <h5 class="modal-title disin">비밀번호 확인</h5>
	        <h5 class="modal-title disnon" id="delete_rNo"></h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	    </div>
	    <div class="modal-body">
		    <form id="delete_comment_submit">
				<div class="form-group row disin">
					<label class="col-sm-3 col-form-label text-center">패스워드</label>
					<div class="col-sm-6" >
						<input type="password" class="form-control" id="d_c_rPassword"
							placeholder="패스워드를 입력하세요">
					</div>
				</div>
			</form>
				<div class="modal-footer">
			       	<button type="button" class="btn btn-success" onclick="comment_delete_action();">확인</button>
			        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			    </div>
	    	
		</div>
</div>
</div>
</div>

