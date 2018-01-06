<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	response.setStatus(HttpServletResponse.SC_OK);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Blueballoon - 500 error page</title>
<style>
.img {
	position: relative;
	background-image:
		url(https://s3.ap-northeast-2.amazonaws.com/bbproject2017/bb_error/500error.jpg);
	height: 100vh;
	background-size: cover;
}

.img .content {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-32%, 180%);
	font-size: 5rem;
	color: black;
	z-index: 2;
	text-align: center;
}
</style>
<script type="text/javascript">
	function out() {
		location.href="main";
	}
</script>
</head>
<body>
	<div class="img">
		<div class="content" onclick="out()">
			<img src="https://s3.ap-northeast-2.amazonaws.com/bbproject2017/bb_other/take1.png" height="103px" width="340px">
		</div>
	</div>
</body>
</html>