

<%@page contentType="text/html;charset=UTF-8"%>


<div class="modal register fade" tabindex="-1" role="dialog" id="board_modal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
    <div class="modal-header">
        <h5 class="modal-title" style="display: inline;">게시글 작성</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
    </div>
    <div class="modal-body">
	    <form id = "loveyou" action="insertBoard.do" method="post" enctype="multipart/form-data" >
			
			<div class="form-group row" style="display:none">
				<label for="inputEmail3" class="col-sm-3 col-form-label text-center">아이디</label>
				<div class="col-sm-10">
					<input class="form-control" id="mId" name="mId" placeholder="id"
						value="${sessionScope.loginM}">
				</div>
			</div>
			<br>
			<div class="form-group row">
				<label for="inputEmail3" class="col-sm-3 col-form-label text-center">닉네임</label>
				<div class="col-sm-6">
					<input class="form-control" id="bNick" name = "bNick"
					<c:if test="${sessionScope.loginN!=null }">
					 readonly="readonly"
					</c:if>
						 value="${sessionScope.loginN}">
				</div>
			</div>
			<div class="form-group row" id="any_pass">
			</div>
			<div class="form-group row">
				<label for="inputPassword3"
					class="col-sm-3 col-form-label text-center">제목</label>
				<div class="col-sm-6">
					<input class="form-control" id="bTitle" name = "bTitle">
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
       	    <button type="button" class="btn btn-primary" onclick="board_submit()">작성</button>
        	<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
		</form>
</div>
</div>
</div>

