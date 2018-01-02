<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html class=" logged">
<head>
<title>후기 게시판 -BlueBalloon</title>
<link
	href="${pageContext.request.contextPath}/resources/user/board/css/list1.css?ver=1"
	rel="stylesheet" type="text/css" />
<script
	src="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/common/js/8.js"
	async=""></script>
<script async="" src="https://www.google-analytics.com/analytics.js"></script>
<script>
	//**원하는 페이지로 이동시 검색조건, 키워드 값을 유지하기 위해 
	function list(page) {
		location.href = "board_list?curPage=" + page;
	}
	(function(i, s, o, g, r, a, m) {
		i['GoogleAnalyticsObject'] = r;
		i[r] = i[r] || function() {
			(i[r].q = i[r].q || []).push(arguments)
		}, i[r].l = 1 * new Date();
		a = s.createElement(o), m = s.getElementsByTagName(o)[0];
		a.async = 1;
		a.src = g;
		m.parentNode.insertBefore(a, m)
	})(window, document, 'script',
			'https://www.google-analytics.com/analytics.js', 'ga');
	ga('create', 'UA-334117-5', 'auto');
	ga('send', 'pageview');
</script>
<link rel="stylesheet" type="text/css"
	href="//cdn.tourradar.com/include/pw/serp/async.v1512994931.css">
</head>
<body class="tb" data-b-sale="">
	<%@include file="../../header1.jsp"%>
	<main data-id="155404">
	<div class="top">
		<div class="im"
			style="background-image: url('//cdn.tourradar.com/im/r/pw/river/main-c.jpg')"></div>
		<div class="in">
			<h1></h1>
			<!--게시판 관련-->
			<ul>
				<li></li>
			</ul>
		</div>
	</div>
	<div class="c">
		<div class="list">
			<h2>베스트 리뷰</h2>
			<c:forEach var="best" items="${Listmap.bestReview}">
				<div class="item" data-id="163442">
					<a href="board_content?board_num=${best.board_num}">
					<div class="preview">
							<img
								src="//cdn.tourradar.com/s3/serp/360x210/163442_WkBBbSNA.jpg"
								data-src="//cdn.tourradar.com/s3/serp/360x210/163442_WkBBbSNA.jpg"
								class="bg lazy">
							<div class="mask"></div>
							<div class="title">${best.board_title}</div>
							<div class="river-info">
								<div class="info tours">별점 : ${best.board_readcount}</div>
								<div class="info len">좋아요 수 : ${best.board_likecount}</div>
							</div>
						</div>
						</a>
					<div class="description">
						${best.board_content}
						<a href="board_content?board_num=${best.board_num}">더보기</a>
					</div>
				</div>
			</c:forEach>
		</div>
		<div class="content faq" data-total="16" data-onpage="10">
				<ul>
			<h3>게시판 부분</h3>
			<!-- <p>여기도 뭐 들어갈 건데 일단 보류</p> -->
			<ul>
				<c:forEach var="dto" items="${Listmap.boardList}">
					<li data-id="5036">
						<table class="qst" width="100%">
							<tr>
								<td width="10%">${dto.board_num}</td>
								<td><a href="board_content?board_num=${dto.board_num}">${dto.board_title}</a></td>
								<td style="float: right;">${dto.board_reg_date}</td>
							</tr>
						</table></li>
				</c:forEach>
			</ul>
			<div class="more" align="center">
				<!-- **처음페이지로 이동 : 현재 페이지가 1보다 크면  ◀◀하이퍼링크를 화면에 출력-->
				<c:if test="${Listmap.boardPager.curBlock > 1}">
					<a href="javascript:list('1')" class="but"><span>◀◀</span></a>
				</c:if>

				<!-- **이전페이지 블록으로 이동 : 현재 페이지 블럭이 1보다 크면 ◀하이퍼링크를 화면에 출력 -->
				<c:if test="${Listmap.boardPager.curBlock > 1}">
					<a href="javascript:list('${Listmap.boardPager.prevPage}')"
						class="but"><span>◀</span></a>
				</c:if>

				<!-- **하나의 블럭에서 반복문 수행 시작페이지부터 끝페이지까지 -->
				<c:forEach var="num" begin="${Listmap.boardPager.blockBegin}"
					end="${Listmap.boardPager.blockEnd}">
					<!-- **현재페이지이면 하이퍼링크 제거 -->
					<c:choose>
						<c:when test="${num == Listmap.boardPager.curPage}">
							<!-- 현재 보여지고 있는 페이지는 글자색이 파랑색으로 표시 -->
							<a class="but"><span style="color: blue">${num}</span></a>
						</c:when>
						<c:otherwise>
							<a href="javascript:list('${num}')" class="but"><span>${num}</span></a>
						</c:otherwise>
					</c:choose>
				</c:forEach>

				<!-- **다음페이지 블록으로 이동 : 현재 페이지 블럭이 전체 페이지 블럭보다 작거나 같으면 ▶하이퍼링크를 화면에 출력 -->
				<c:if
					test="${Listmap.boardPager.curBlock <= Listmap.boardPager.totalBlock}">
					<a href="javascript:list('${Listmap.boardPager.nextPage}')"
						class="but"><span>▶</span></a>
				</c:if>

				<!-- **끝페이지로 이동 : 현재 페이지가 전체 페이지보다 작거나 같으면 ▶▶하이퍼링크를 화면에 출력 -->
				<c:if
					test="${Listmap.boardPager.curPage <= Listmap.boardPager.totalPage}">
					<a href="javascript:list('${Listmap.boardPager.totalPage}')"
						class="but"><span>▶▶</span></a>
				</c:if>
			</div>
		</div>
	</div>
	</main>
	<footer>
		<div class="c">
			<div class="cop">
				Copyright © BlueBalloon. All rights reserved. <a href="/legalnotice">Legal
					notice</a>
			</div>
		</div>
	</footer>
	<div class="tooltip hid"></div>
</body>
<link type="text/css" rel="stylesheet"
	href="//cdn.tourradar.com/include/pw/river/async.v1512994931.css">
<link type="text/css" rel="stylesheet"
	href="//cdn.tourradar.com/include/js/ttip/ttip.v1-1-2.min.css?v=1512994931">
</html>