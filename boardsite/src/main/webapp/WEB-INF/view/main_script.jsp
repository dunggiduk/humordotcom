<%@page contentType="text/html;charset=UTF-8"%>
<script type="text/javascript">
$(function(){
	if('${sessionScope.loginG}'=='manager'){
		$('#vote_box').append('<button type="button" id="vote_set" class="btn btn-default" margin-left: 10px;">수정</button>');
		
	};
	/*
	이번주의 투표
	*/
	$('#week_vote_button').click(function(){
		var mId = '${sessionScope.loginM}';
		if(mId){
		var wValue = $(':radio[name="radioValue"]:checked').val();
			if(wValue){
				var promise1 = $.ajax({
					url:"/WeekVselectWBymId.do",
					method : 'POST',
					data : "mId="+mId
				});
				promise1.done(function(text){alert(text)});
				promise1.fail(function(){
						var promise2 = $.ajax({
							url:"/WeekV_action.do",
							method : 'POST',
							data : "mId="+mId+"&wValue="+wValue
						});	
						promise2.done(function(){
							alert("투표했습니다");
							weekV_result();
							});
						promise2.fail(function(){alert("에러입니다")});
				
				});

			} else {
				alert('투표가 필요합니다');
			}
		} else {
			alert('로그인이 필요합니다');
		}
	});
	$('#vote_set').click(function(){
		$('#vote_box').html('1<input id="vote_one"><br>2<input id="vote_two"><button id="vvote_sub" type="button" class="btn btn-default">수정완료</button>');
	});
	$(document).on("click",'#vvote_sub',function(){
		var vote_one = $('#vote_one').val();
		var vote_two = $('#vote_two').val();
		$('#vote_box').html('<p id="vote_one_r" class = "marginB"><input type = "radio" value=1></p><p id="vote_two_r"><input type = "radio" style="margin-bottom: 15px;" value=2></p>')
		$('#vote_one_r').text(vote_one);
		$('#vote_two_r').text(vote_two);
	});
	$(document).on("click",'#Wvote_result',function(){
		weekV_result();
	});
	$(document).on("click",'#Wvote_back',function(){
		Wvote_back();
	});
	setInterval(StartClock(), 10000);
});
function weekV_result(){
	var promise = $.ajax({
		url : '/WeekVResult.do',
		method : 'POST'
	})
	promise.done(function(data){
		$('#vote_content').html('<p>총 투표 : '+data.all+'</p><span style="float:left;">'+data.one+'</span><span style="float:right;">'+data.two+'</span><div class="progress"><div class="progress-bar progress-bar-success" role="progressbar" style="width:'+data.oneP+'%">부먹 </div><div class="progress-bar progress-bar-warning" role="progressbar" style="width:'+data.twoP+'%">찍먹</div></div><button id ="Wvote_back" class="btn btn-default">뒤로가기</button>');
	})
};
function Wvote_back() {
	$('#vote_content').html('<p id="vote_one_r" class = "marginB"><input type = "radio" name="radioValue" value=1>  부먹</p><p id="vote_two_r"><input type = "radio" name="radioValue" style="margin-bottom: 15px;" value=2>  찍먹</p><button type="button" class="btn btn-default" id="week_vote_button" style="margin-right: 6px; font-size: 12px; padding:4px 10px;">투표</button><button class="btn btn-default" id="Wvote_result" style="font-size: 12px; padding:4px 10px;">결과</button>')
};
function StartClock() {
	var promise = $.ajax({
		url:'/naver_search.do',
		method: 'POST'
	});
	promise.done(function(data){
		var result= '<div class = "col-sm-6"><ul>';
		for(var i=0; i<10; i++){
			var idx = i+1
			var str='<li  id="search_li">'+idx+" "+data.naverS[i]+'</li>';
			result += str;
		}
		result += '</ul></div>';
		result += '<div class = "col-sm-6"><ul>';
		for(var i=10; i<20;i++){
			var idx = i+1
			var str='<li  id="search_li">'+idx+" "+data.naverS[i]+'</li>';
			result += str;
		}
		result += '</ul></div>';
	$("#searchList").html(result);
	})
};
</script>