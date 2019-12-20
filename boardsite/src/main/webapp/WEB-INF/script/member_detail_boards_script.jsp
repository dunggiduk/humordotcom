<%@page contentType="text/html;charset=UTF-8" %>
<script type = "text/javascript">
$(function(){
	var g = $('#grade_number').text().trim();
	switch (g){
    case "(Lv7)" :
        $('#grade_image').html('<img src="/img/7 64.png"/>');
        break;
    case "(Lv6)" :
    	$('#grade_image').html('<img src="/img/6 64.png"/>');
        break;
    case "(Lv5)" :
    	$('#grade_image').html('<img src="/img/5 64.png"/>');
        break;
    case "(Lv4)" :
    	$('#grade_image').html('<img src="/img/4 64.png"/>');
        break;
    case "(Lv3)" :
    	$('#grade_image').html('<img src="/img/3 64.png"/>');
        break;
    case "(Lv2)" :
    	$('#grade_image').html('<img src="/img/2 64.png"/>');
        break;
    case "(Lv1)" :
    	$('#grade_image').html('<img src="/img/1 64.png"/>');
        break;
	};

});

</script>