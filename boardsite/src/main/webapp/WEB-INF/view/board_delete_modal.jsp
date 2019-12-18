<%@page contentType="text/html;charset=UTF-8"%>


<div class="modal register fade" tabindex="-1" role="dialog" id="board_delete_modal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
    <div class="modal-header">
        <h5 class="modal-title" style="display: inline;">비밀번호 확인</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
    </div>
    <div class="modal-body">
	    <form>
			
			<div class="form-group row" style="display: inline;">
				<label for="inputEmail3" class="col-sm-3 col-form-label text-center">비밀번호</label>
				<div class="col-sm-8" >
					<input type="password" class="form-control" id="d_bPassword"
						placeholder="작성시 설정한 비밀번호를 입력하세요">
				</div>
			</div>

		</form>
	</div>
	  <div class="modal-footer">
       	    <button type="button" class="btn btn-primary" onclick="delete_board_a();">삭제하기</button>
        	<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
</div>
</div>
</div>

