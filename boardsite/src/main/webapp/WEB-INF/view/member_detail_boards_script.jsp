<%@page contentType="text/html;charset=UTF-8" %>
<script type = "text/javascript">
$(function(){
	var g = $('#grade_number').text().trim();
	switch (g){
    case "(Lv7)" :
        $('#grade_image').html('<img src="/img/seeds 64.png"/>');
        break;
    case "(Lv6)" :
    	$('#grade_image').html('<img src="/img/leaf 64.png"/>');
        break;
    case "(Lv5)" :
    	$('#grade_image').html('<img src="/img/tree 64.png"/>');
        break;
    case "(Lv4)" :
    	$('#grade_image').html('<img src="/img/bird 64.png"/>');
        break;
    case "(Lv3)" :
    	$('#grade_image').html('<img src="/img/thunder 64.png"/>');
        break;
    case "(Lv2)" :
    	$('#grade_image').html('<img src="/img/saturn 64.png"/>');
        break;
    case "(Lv1)" :
    	$('#grade_image').html('<img src="/img/cap 64.png"/>');
        break;
	};

});

</script>