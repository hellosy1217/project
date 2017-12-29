<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
<head>
<title>review - BlueBalloon</title>
<link
	href="${pageContext.request.contextPath}/resources/member/css/join1.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/member/css/join2.css"
	rel="stylesheet" />
<link
	href="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/common/css/async.v1512324069.css"
	rel="stylesheet" />
<link
	href="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/common/css/responsive.min.css"
	rel="stylesheet" />
<link
	href="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/common/css/ttip.min.css"
	rel="stylesheet" />
<style>
.star-input>.input, .star-input>.input>label:hover, .star-input>.input>input:focus+label,
	.star-input>.input>input:checked+label {
	display: inline-block;
	vertical-align: middle;
	background: url('resources/user/board/img/grade_img.png') no-repeat;
}

.star-input {
	display: inline-block;
	white-space: nowrap;
	width: 225px;
	height: 40px;
	padding: 25px;
	line-height: 30px;
}

.star-input>.input {
	display: inline-block;
	width: 150px;
	background-size: 150px;
	height: 28px;
	white-space: nowrap;
	overflow: hidden;
	position: relative;
}

.star-input>.input>input {
	position: absolute;
	width: 1px;
	height: 1px;
	opacity: 0;
}

star-input>.input.focus {
	outline: 1px dotted #ddd;
}

.star-input>.input>label {
	width: 30px;
	height: 0;
	padding: 28px 0 0 0;
	overflow: hidden;
	float: left;
	cursor: pointer;
	position: absolute;
	top: 0;
	left: 0;
}

.star-input>.input>label:hover, .star-input>.input>input:focus+label,
	.star-input>.input>input:checked+label {
	background-size: 150px;
	background-position: 0 bottom;
}

.star-input>.input>label:hover ~label{
	background-image: none;
}

.star-input>.input>label[for="p1"] {
	width: 30px;
	z-index: 5;
}

.star-input>.input>label[for="p2"] {
	width: 60px;
	z-index: 4;
}

.star-input>.input>label[for="p3"] {
	width: 90px;
	z-index: 3;
}

.star-input>.input>label[for="p4"] {
	width: 120px;
	z-index: 2;
}

.star-input>.input>label[for="p5"] {
	width: 150px;
	z-index: 1;
}

.star-input>output {
	display: inline-block;
	width: 60px;
	font-size: 18px;
	text-align: right;
	vertical-align: middle;
}
</style>
</head>
<body class="reg-page-bg ">
	<div id="content" class="clearfix wrapc ">
		<div class="reg-page sign-up clearfix">
			<%@include file="../../header2.jsp"%>
			<div class="inside" style="margin-top: 30px; opacity: 100;">
				<div class="inside-w" style="min-width: 400px;">
					<form class="clearfix" action="board_insert" method="POST" name="f"
						enctype="multipart/form-data">
						<input type="hidden" name="prod_num" value="${prod_num}" />
						<input type="hidden" name="member_email" value="${member_email}" />
						<div>
							<h3>후기 제목</h3>
							<input name="board_title" id="title" size="40"
								placeholder="제목을 입력하세요">
						</div>
						<div>
							<h3>이 곳에 만족하셨나요?</h3>
							<span class="star-input"> <span class="input"> 
							<input type="radio" name="star" value="1" id="p1"> 
							<label for="p1">1</label> 
							<input type="radio" name="star" value="2" id="p2">
							<label for="p2">2</label> 
							<input type="radio" name="star" value="3" id="p3">
							<label for="p3">3</label>
							<input type="radio" name="star" value="4" id="p4">
							<label for="p4">4</label>
							<input type="radio" name="star" value="5" id="p5">
							<label for="p5">5</label>
							</span>
							</span>
						</div>
						<div>
							<h3>내용</h3>
							<textarea name="board_content" id="content" rows="4" cols="10"
								placeholder="내용을 입력하세요"></textarea>
						</div>
						<div>
							<h3>사진 업로드 (선택 항목)</h3>
							<input type="file" name="board_org_img">
						</div>
						<input type="hidden">

						<div class="input-c" style="width: 170px; margin-top: 10px;">
							<a class="reg-page-button" href="#" onclick="f.submit()"
								id="g_send" style="margin-left: 117px;"><span class="title">리뷰등록</span></a>
						</div>

					</form>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var js_params = {
			"RegistrationType" : "sign_up"
		};
		var IntRespApp = setInterval(function() {
			if (typeof $ == 'function') {
				clearInterval(IntRespApp);
				$(document).ready(function() {
					new RespRegistration(js_params).init();
				});
			}
		}, 10);
	</script>
	<script type="text/javascript" src="https://apis.google.com/js/plus.js"
		gapi_processed="true"></script>
	<script src="<c:url value="/user/board/js/star.js"/>"></script>
</body>