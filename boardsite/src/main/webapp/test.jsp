<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
    <!-- enctype="multipart/form-data" 파일업로드 필수 옵션 -->
    <!-- application/x-www-form-urlencoded 기본옵션 -->
    <form id = "f" action="insertBoard.do" method="post" enctype="multipart/form-data">
        <input type="file" name="file">
        <input type="button" value="업로드" onclick="javascript:bb()">    
    </form>
    <script type="text/javascript">
    	function bb() {
    		alert("a")
    		//이 둘중 하나로 요청하면되요
    		//$("#f").submit();
    		//document.getElementById("f").submit();
    	}
    </script>
</body>
</html>