

<%@page contentType="text/html;charset=UTF-8"%>


<div class="modal register fade" tabindex="-1" role="dialog" id="board_update_modal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
    <div class="modal-header">
        <h5 class="modal-title" style="display: inline;">게시글 수정</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
    </div>
    <div class="modal-body">
	    <form id = "update_b_form" action="/updateBoard.do" method="post" enctype="multipart/form-data" >
			<div class="form-group row" style="display:none">
				<label class="col-sm-3 col-form-label text-center">글 번호</label>
				<div class="col-sm-10">
					<input class="form-control" name="bNo" id="update_bNo">
				</div>
			</div>
			<div class="form-group row" style="display:none">
				<label class="col-sm-3 col-form-label text-center">아이디</label>
				<div class="col-sm-10">
					<input class="form-control" name="mId" id="update_b_id"
						value="${sessionScope.loginM}">
				</div>
			</div>
			<div class="form-group row" style="display:none">
				<label class="col-sm-3 col-form-label text-center">등급</label>
				<div class="col-sm-10">
					<input class="form-control" name="bGrade"
						value="${sessionScope.loginG}">
				</div>
			</div>
			<br>
			<div class="form-group row">
				<label for="inputEmail3" class="col-sm-3 col-form-label text-center">닉네임</label>
				<div class="col-sm-6">
					<input class="form-control" id="bNick" name = "bNick"
						 <c:if test="${sessionScope.loginN!=null }">
							value=${sessionScope.loginN} readonly="readonly"
						</c:if> placeholder="닉네임">
				</div>
			</div>
			<div class="form-group row"id="pass_f_up">
			</div>
			<div class="form-group row">
				<label class="col-sm-3 col-form-label text-center">제목</label>
				<div class="col-sm-6">
					<input class="form-control" id="bTitle" name = "bTitle" >
				</div>
			</div>
			<br>
			<div class="container-fluid">
				<div class="col-sm-10 center-block">
					<textarea class="form-control" id="bContent" rows="5" name = "bContent"
						placeholder="***광고나 음란성 혹은 잔인한 이미지가 포함된 글은 발견 즉시 삭제되며 회원일 경우 탈퇴 처리됩니다.***"></textarea>
				</div>
			</div>
			<br>
			<div class="input-group">
			  <div class="custom-file col-sm-9">
			    <input type="file" name ="file" class="custom-file-input" id="upload_File"
			      aria-describedby="inputGroupFileAddon01">
			    <label class="custom-file-label" for="upload_File"  data-browse="탐색"></label>
			  </div>
			</div>
	</div>
	  <div class="modal-footer">
       	    <button type="submit" class="btn btn-primary" >작성</button>
        	<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
		</form>
</div>
</div>
</div>

