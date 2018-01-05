<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>BlueBalloon - Contact us</title>
<link
	href="${pageContext.request.contextPath}/resources/user/package/css/booking1.css?ver=12"
	rel="stylesheet" type="text/css" />
<link type="text/css" rel="stylesheet"
	href="//cdn.tourradar.com/include/pw/tour/async.v1515164194.css">
<link type="text/css" rel="stylesheet"
	href="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/common/css/magnific-popup.v1-0-2.min.css">
</head>
<script type="text/javascript">
	function check() {
		alert("유효성 검사 자바스크립트 입니다.")
		document.f.submit();
	}
</script>
<body>
	<c:if test="${req eq 'close'}">
		<c:if test="${!empty msg}">
			<script type="text/javascript">
				alert("${msg}");
			</script>
		</c:if>
		<script type="text/javascript">
			if (window.opener && !window.opener.closed)
				window.opener.location = '${url}';
			window.open("about:blank", "_self").close();
		</script>
	</c:if>
	<div class="mfp-content">
		<div id="ask_popup" class="olark-window default">
			<div class="overlay">
				<form method="post" data-promotion="" data-price="1.00" name="f">
					<h2 class="dif ask">Contact Us</h2>
					<input type="text" name="email_title" id="email_title"
						placeholder="제목을 입력해주세요.">
					<textarea placeholder="내용을 입력해주세요."></textarea>
					<div class="cf"></div>
					<button type="button" class="but blue" onclick="check()">문의하기</button>
					<div class="expect">빠른 시일 내 답변을 드리겠습니다.</div>
				</form>
			</div>
		</div>
</body>
</html>