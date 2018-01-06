<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
<head>
<title>Review - BlueBalloon</title>
<link
	href="${pageContext.request.contextPath}/resources/user/board/css/write1.css?ver=12"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="//cdn.tourradar.com//include/css/responsive.min.css?v=1514557673"
	type="text/css" media="all">
<script
	src="https://apis.google.com/_/scs/apps-static/_/js/k=oz.gapi.ko.SXv6EGggdTE.O/m=plus/rt=j/sv=1/d=1/ed=1/am=AQ/rs=AGLTcCM4d_gJSwgxQZOKnWSuoyAU-mhtrg/cb=gapi.loaded_0"
	async=""></script>
<script type="text/javascript">
	function finish() {
		document.f.board_score.value = $(".stars.v").attr("num");
		document.f.submit();
	}
</script>

</head>
<body class=" ">
	<%@include file="../../header2.jsp"%>
	<div id="content" class="clearfix content_review ">
<form action="board_insert" method="POST" name="f" enctype="multipart/form-data">
		<div class="operator-review step2">
			<div class="heading form1 form2 " style="width:700px">
				<div class="operator" operator="1504">
					<div class="img-cnt">
						<c:set var="prodNum" value="${prod_num}"/>
						<c:choose>
						<c:when test="${prodNum eq '0'}">
						<img src="https://s3.ap-northeast-2.amazonaws.com/bbproject2017/bb_package/${str_img}">
						</c:when>
						<c:when test="${prodNum ne '0'}">
						<img src="https://s3.ap-northeast-2.amazonaws.com/bbproject2017/bb_product${prod_pick}/${str_img}">
						</c:when>
						</c:choose>
					</div>
				</div>
				<div class="txt">
					<h1 class="orig" style="margin-top:25px">여행 후기를 적어주세요</h1>
					<ul class="subtitle clearfix">
						<li class="com">
						<c:set var="prodName" value="${prod_name}"/>
						<c:choose>
						<c:when test="${prodName eq 'null'}">
						${pack_title}
						</c:when>
						<c:when test="${prodName ne 'null'}">
						${prod_name}
						</c:when>
						</c:choose>
						</li>
					</ul>
				</div>
			</div>
			<p class="note back-to-review form2 hidden">« 뒤로 가기</p>
			<div class="form1">
				<section class="wrapper">
					<article class="arrow1 last" style="margin-bottom:40px">
						<div class="header-cnt">
							<div class="btitle" style="margin-bottom:20px">
								<h2>후기 제목</h2>
								<input name="board_title" id="title" placeholder="제목을 입력하세요" maxlength="20">
							</div>
							<h2>후기 작성</h2>
						</div>
						<textarea placeholder="내용을 입력하세요" name="board_content"
							class="review_text"></textarea>
					</article>
						<article class="arrow3">
						<div class="header-cnt" style="margin-bottom:10px">
							<h2>별점을 선택하세요</h2>
							<span class="pic1 middle left15 hidden"><svg
									class="svg-arrow" viewBox="0 0 32 32">
									<g>
									<path d="M0 16l16 16v-10h16l0-12h-16v-10z"></path></g></svg></span><span
								class="pic2 middle left15 hidden"><svg class="svg-check"
									viewBox="0 0 32 32">
									<g>
									<path
										d="M16 0c-8.837 0-16 7.163-16 16s7.163 16 16 16 16-7.163 16-16-7.163-16-16-16zM13 26l-6.625-8.625 2.938-3.063 3.688 4.688 11.563-9.438 1.438 1.438-13 15z"></path></g></svg></span>
							<div class="err-cnt">
								<span class="pic3 middle left15 hidden"><svg
										class="svg-wrong" viewBox="0 0 20 20">
										<g>
										<path
											d="M10,0.666666667 C4.84555556,0.666666667 0.666666667,4.84555556 0.666666667,10 C0.666666667,15.1544444 4.84555556,19.3333333 10,19.3333333 C15.1544444,19.3333333 19.3333333,15.1544444 19.3333333,10 C19.3333333,4.84555556 15.1544444,0.666666667 10,0.666666667 L10,0.666666667 Z M15.3211111,13.4011111 L13.4,15.3222222 L10,11.9211111 L6.59888889,15.3211111 L4.67777778,13.4 L8.08,10 L4.67888889,6.59888889 L6.6,4.67888889 L10,8.07888889 L13.4011111,4.67777778 L15.3222222,6.59888889 L11.92,10 L15.3211111,13.4011111 L15.3211111,13.4011111 Z"></path></g></svg></span><span
									class="pic3 err hidden">별점을 선택하세요 </span>
							</div>
						</div>
						<div class="rate">
							<div class="rating-title">
								여행에 대한 평가<br>
							</div>
							<span class="stars v starhover" num="" id="star1"><span>☆</span><span>☆</span><span>☆</span><span>☆</span><span>☆</span></span><span
								class="rating-hint"></span>
						</div>
					</article>
					<article>
							<input type="hidden" name="board_score" id="board_score" value="">
							<h2 class="nofloat">
								사진 업로드 <span class="grey">OPTIONAL</span>
							</h2>
							<input type="file" name="board_org_img">
					</article>
					<article class="error-plc-hld center"></article>
					<article class="center">
					<input type="hidden" name="pack_num" value="${pack_num}" /> 
						<input type="hidden" name="prod_num" value="${prod_num}" /> <input
							type="hidden" name="member_email" value="${member_email}" />
						<button class="finishButton" onclick="finish()">Finish</button>
					</article>
				</section>
			</div>
			<div class="form3 hidden">
				<div class="heading sc-mark2">
					<svg class="svg-icon-checkmark" viewBox="0 0 32 25">
						<g>
						<path d="M27 4l-15 15-7-7-5 5 12 12 20-20z"></path></g></svg>
					<h3>Thanks for your review!</h3>
				</div>
				<section id="social">
				</section>
				<section class="wrapper">
				</section>
				<div class="r-footer">
					<div class="columns top">
						<p class="footertitle">Not the only tour you’ve been on?</p>
					</div>
					<div class="columns top">
						<p class="footertext">
							You can leave a review for another tour <a class="footer"
								href="/review">here</a>
						</p>
					</div>
				</div>
			</div>
		</div>
		
	</form>
		<script type="text/javascript">
			var js_params = {
				"step" : 2,
				"not_log_in" : 0,
				"user_logged" : "true"
			};

			var IntRespReview = setInterval(function() {
				if (typeof $ == 'function') {
					clearInterval(IntRespReview);
					$(document).ready(function() {
						new RespReview(js_params).init();
					});
				}
			}, 10);
		</script>
	</div>
	<div id="svg_content_load" style="display: none"></div>
	<script type="text/javascript"
		src="//cdn.tourradar.com//include/js/responsive.min.js?v=1514557673"
		async=""></script>
</body>
<link type="text/css" rel="stylesheet"
	href="//cdn.tourradar.com/include/pw/responsive/async.v1514879356.css">
</html>