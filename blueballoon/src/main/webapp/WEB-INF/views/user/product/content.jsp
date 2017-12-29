<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
<title>여행상품 상세페이지</title>
<link
	href="${pageContext.request.contextPath}/resources/user/product/css/content.css?ver=1233"
	rel="stylesheet" />
<script async="" src="https://www.google-analytics.com/analytics.js"></script>
<script
	src="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/common/js/1.js"
	async=""></script>
<script
	src="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/user/product/pikaday.v1-4-2.min.js"
	async=""></script>
<script
	src="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/user/product/ttip.v1-1-2.min.js"
	async=""></script>
<script>
	window.addEventListener
			&& addEventListener(
					"error",
					function(e) {
						window
								.setTimeout(
										function() {
											if (document.documentElement.className
													.match(/translated/)) {
												return;
											}

											e
													&& window.tracker
													&& tracker(
															'addEvent',
															'JSError',
															(e.filename || 'code'),
															(e.message || 'No message'),
															{
																filename : e.filename,
																lineno : e.lineno,
																colono : e.colono,
																error : e.error
															});

											var info = {
												"url" : document.location.href,
												"languge" : navigator.language,
												"useragent" : navigator.userAgent,
												"platform" : navigator.platform,
												"oscpu" : navigator.oscpu,
												"referrer" : document.referrer,
												"error[message]" : e.message,
												"error[colno]" : e.colno,
												"error[lineno]" : e.lineno,
												"error[filename]" : e.filename,
												"error[stack]" : e.error ? e.error.stack
														: null
											};

											var encodedInfo = [];
											for ( var key in info) {
												var value = info[key];
												value = ((typeof value === 'undefined') || value === null) ? ''
														: encodeURIComponent(value);
												encodedInfo
														.push(encodeURIComponent(key)
																+ '=' + value);
											}
											var postParams = encodedInfo
													.join('&');

											var request = new XMLHttpRequest();
											request.open('POST',
													'/utils/jserror', true);
											request
													.setRequestHeader(
															'Content-Type',
															'application/x-www-form-urlencoded; charset=UTF-8');
											request.send(postParams);
										}, 1);
					});
</script>
<script>
	document.cookie = 'GE-gq-0n6OlTjaA4T5i06WHeg=0; max-age=2592000; path=/';
</script>
<script>
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
	ga('set', 'exp', 'gq-0n6OlTjaA4T5i06WHeg.0');

	ga('set', 'dimension10', '88570');
	ga('set', 'dimension11', 'Europe');
	ga('set', 'dimension18', 'offerdetail');
	ga('set', 'dimension19', '1789.12');
	ga('set', 'dimension14', 'Arctic_Adventures');
	ga('set', 'dimension15', 'SS');

	ga('send', 'pageview');
</script>
<script>
	!function(f, v, n) {
		if (f.fbq)
			return;
		n = f.fbq = function() {
			n.callMethod ? n.callMethod.apply(n, arguments) : n.queue
					.push(arguments)
		};
		if (!f._fbq)
			f._fbq = n;
		n.push = n;
		n.loaded = !0;
		n.version = '2.0';
		n.queue = [];
	}(window);
	fbq('init', '806188949420761');
	fbq('track', "PageView");
</script>
<script type="text/javascript"
	src="https://www.google.com/uds/?file=visualization&amp;v=1&amp;packages=corechart&amp;async=2"></script>
<link type="text/css"
	href="https://www.google.com/uds/api/visualization/1.0/40ff64b1d9d6b3213524485974f36cc0/ui+ko.css"
	rel="stylesheet">
<script type="text/javascript"
	src="https://www.google.com/uds/api/visualization/1.0/40ff64b1d9d6b3213524485974f36cc0/format+ko,default+ko,ui+ko,corechart+ko.I.js"></script>
<link
	href="https://ajax.googleapis.com/ajax/static/modules/gviz/1.0/core/tooltip.css"
	rel="stylesheet" type="text/css">

<!-- 좋아요 버튼 아이콘  -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script>
	$(document).ready(function() {
		$("#flip").click(function() {
			$("#panel").slideToggle(0);
		});
	});
</script>
</head>
<body class="tb" data-b-sale="">
	<c:choose>
		<c:when test="${member_num == 0}">
			<%@include file="../../header1.jsp"%>
		</c:when>
		<c:otherwise>
			<%@include file="../../header3.jsp"%>
		</c:otherwise>
	</c:choose>

	<main data-id="88570" data-code="AA-AIA" data-op="1853" data-curr="USD"
		data-sym="$" data-price="1789" data-value="$54" "="" itemscope=""
		itemtype="http://schema.org/Product">
	<div class="c">
		<nav>
			<ul>
				<li><a itemprop="item" href="main">Home
						<meta itemprop="name" content="TourRadar">
				</a></li>
				<c:forTokens items="${getProd.prod_cate}" delims="-" var="c"
					varStatus="status">
					<li>&nbsp;&nbsp;〉&nbsp; <c:choose>
							<c:when test="${status.count==1}">
								<a href="product_list?cate_state=${c}" itemprop="item">
							</c:when>
							<c:otherwise>
								<a href="product_list?cate_city=${c}" itemprop="item">
							</c:otherwise>
						</c:choose><span itemprop="name">${c}</span></a></li>
				</c:forTokens>
				<li>&nbsp;&nbsp;〉&nbsp; <a
					href="product_content?prod_num=${getProd.prod_num}" itemprop="item"><span
						itemprop="name">${getProd.prod_name}</span></a></li>
			</ul>
		</nav>
		<h1 itemprop="name" class="ttip" title="" data-action="click"
			data-html="Tour code: AA-AIA">${getProd.prod_name}</h1>

	</div>
	<div class="c" style="height: 3500px;">
		<div class="br">
			<div class="b val">
				<h2 style="margin-bottom: 20px;">지도보기</h2>
				<!-- <div id="map" style="width: 320px; height: 302px;"></div> -->

				<div class="map_wrap">
					<div id="map"
						style="width: 320px; height: 302px; position: relative; overflow: hidden;"></div>
					<!-- 지도타입 컨트롤 div 입니다 -->
					<div class="custom_typecontrol radius_border">
						<span id="btnRoadmap" class="selected_btn"
							onclick="setMapType('roadmap')">지도</span> <span id="btnSkyview"
							class="btn" onclick="setMapType('skyview')">스카이뷰</span>
					</div>
					<!-- 지도 확대, 축소 컨트롤 div 입니다 -->
					<div class="custom_zoomcontrol radius_border">
						<span onclick="zoomIn()"><img
							src="http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_plus.png"
							alt="확대"></span> <span onclick="zoomOut()"><img
							src="http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_minus.png"
							alt="축소"></span>
					</div>
				</div>
			</div>
		</div>
		<div class="bl">
			<div class="b img">
				<div class="pic has-thumbnails" style="height: 400px;">
					<img
						src="https://s3.ap-northeast-2.amazonaws.com/bbproject2017/bb_product${getProd.prod_pick}/${getProd.prod_str_img}">
				</div>
			</div>
			<div class="b pad hgl">

				<dl class="properties">
					<dt class="label">상품 이름</dt>
					<dd class="value age">${getProd.prod_name}</dd>
					<dt class="label">지역</dt>
					<dd class="value accommodation">
					<c:forTokens items="${getProd.prod_cate}" delims="-" var="c">
					${c} 
					</c:forTokens>
					</dd>
					<dt class="label">주소</dt>
					<dd class="value">${getProd.prod_old_address}</dd>
					<dt class="label">이메일</dt>
					<dd class="value transport">${getProd.prod_email}</dd>
					<dt class="label">전화번호</dt>
					<dd class="value transport">${getProd.prod_phone}</dd>
					<dt class="label">가격</dt>
					<dd class="value transport">
					<fmt:formatNumber value="${getProd.prod_price}" pattern="#,###.##"/>원
					</dd>
					<dt class="label">상품 분류</dt>
					<!--<dd class="value transport">${getProd.prod_pick}</dd>-->
					<c:if test="${getProd.prod_pick == 1}">
						<dd class="value transport">지역</dd>
					</c:if>
					<c:if test="${getProd.prod_pick == 2}">
						<dd class="value transport">맛집</dd>
					</c:if>
					<c:if test="${getProd.prod_pick == 3}">
						<dd class="value transport">숙소</dd>
					</c:if>
				</dl>
				<h2 class="sm">상세 정보</h2>
				<br>
				<p style="width: 500px; display: inline-block;">${getProd.prod_content}</p>
				<div class="likeC">
					<a href="product_like?prod_num=${getProd.prod_num}">
						<div id="like">
							<c:if test="${like == 'Y'}">
								<i class="fa fa-thumbs-o-up like_icon" style="color: #409cd1;"></i>
							</c:if>
							<c:if test="${like == 'N'}">
								<i class="fa fa-thumbs-o-up like_icon" style="color: #ddd;"></i>
							</c:if>

						</div>
					</a>
					<div class="sub_text">
						좋아요 <span>${likeCount}</span>
					</div>
				</div>
				<div style="padding-top: 45px;">
					<a class="but r write" href="product_booking?prod_num=141"
						target="_blank" rel="nofollow"
						style="width: 140px; position: unset; float: right;">바로 예약하기</a>
				</div>
			</div>
			<div class="b pad rev" data-total="51" data-onpage="10">
				<div class="atm-m-stars">
					<div class="star full"></div>
					<div class="star full"></div>
					<div class="star full"></div>
					<div class="star full"></div>
					<div class="star half"></div>
				</div>
				<h2>리뷰</h2>
				<a class="but r write" href="board_write?prod_num=1&prod_pick=1"
					target="_blank" rel="nofollow">리뷰 작성하기</a>
				<ul>
					<li class="cf " data-id="74123" itemprop="review" itemscope=""
						itemtype="http://schema.org/Review"><meta
							itemprop="datePublished" content="2017-11-28T12:39:25+01:00">
						<div class="im cl" data-type="trv" data-id="426837">
							<div class="cnt">
								<span class="initials" style="background: #3a6e8c">T</span>
							</div>
							<div class="nm" itemprop="author">사용자</div>
						</div>
						<div class="inf">
							<div class="wr">2017년 1월 1일에 작성</div>
							<div class="rat cf" itemprop="reviewRating" itemscope=""
								itemtype="http://schema.org/Rating">
								<div class="atm-m-stars">
									<div class="star full"></div>
									<div class="star full"></div>
									<div class="star full"></div>
									<div class="star full"></div>
									<div class="star half"></div>
								</div>
								<div class="w">
									<span itemprop="ratingValue">4.5</span>
								</div>
							</div>
							<p></p>
							<div itemprop="reviewBody">왈랄라랄ㄹ라</div>

							<div class="use cf">
								<a class="but" data-vote="yes" data-curr="0">좋아요<span></span></a><a
									class="but" data-vote="no" data-curr="0"><span></span></a>
							</div>
						</div></li>
				</ul>
				<div class="more">
					<a class="board_list?prod_num=">리뷰 더보기</a>
				</div>
			</div>
			<div class="b pad itn" data-tagible-script="">
				<h2>여행 일정 (패키지 상품일때만 적용)</h2>
				<ol>
					<li class="">소개
						<div class="i">
							<p>여행 일정에 대한 소개</p>
						</div>
					</li>
				</ol>
				<ol class="det">
					<li class="active">1일차 : 관광지/맛집/숙소 등등
						<div class="i">
							<div class="im">
								<div class="arrow right"></div>
								<div class="arrow left"></div>
								<div
									style="background-image: url(//cdn.tourradar.com/s3/serp/360x210/5804_TCtEXRle.jpg)"
									class="l show"></div>
								<div
									data-bg="background-image:url(//cdn.tourradar.com/s3/city/1938/6004117_280.jpg)"
									class="l"></div>
								<div
									data-bg="background-image:url(//cdn.tourradar.com/s3/city/1938/18714839_280.jpg)"
									class="l"></div>
							</div>
							일정에 대한 상세 소개
							<div class="point">
								<b>주소</b><span class="name"> 숙소 주소 입력 </span><span class="time"></span>
							</div>
						</div>
					</li>
					<li class="active">2일차 : 관광지/맛집/숙소 등등
						<div class="i">
							<div class="im">
								<div class="arrow right"></div>
								<div class="arrow left"></div>
								<div
									style="background-image: url(//cdn.tourradar.com/s3/serp/360x210/6456_hLk2VDw4.jpg)"
									class="l show"></div>
								<div
									data-bg="background-image:url(//cdn.tourradar.com/s3/city/6232/40553619_280.jpg)"
									class="l"></div>
								<div
									data-bg="background-image:url(//cdn.tourradar.com/s3/city/6232/52917867_280.jpg)"
									class="l"></div>
								<div
									data-bg="background-image:url(//cdn.tourradar.com/s3/serp/360x210/5813_XvvfqmqP.jpg)"
									class="l"></div>
								<div class="ann">사진에 대한 간략한 소개</div>
							</div>
							일정 상세 내용
						</div>
					</li>
					<li class="active">3일차 : 관광지/맛집/숙소 등등
						<div class="i">일정 상세 내용</div>
					</li>
					<li class="active">4일차 : 마지막
						<div class="i">
							사진이나 내용 들어갈 곳 <br> <br> -End of services-
						</div>
					</li>
				</ol>
			</div>

			<div class="b pad faq" data-total="67" data-onpage="3">
				<h2>질문과 답변 고려중..</h2>
				<p>이 투어에 대해 궁금한 점을 입력해보세요</p>
				<form class="search-form">
					<input type="text" name="search" placeholder="질문이 무엇입니까?"
						autocomplete="off" style="margin-right: -4px;">
					<ul class="types" style="display: none;"></ul>
					<button type="submit" class="but blue">검색</button>
				</form>
				<ul>
					<li data-id="19030"><div class="date">2017년 12월 16일</div>
						<h3 class="qst">왠지 이 기능 안넣을거 같지 않습니까?</h3>
						<div class="ans">
							<p>모루게쒀여 약갼 안넣을거 같기두 하구..</p>
							<div class="use">
								<a href="#" title="Helpful" class="help-sm" data-curr="1"><span
									class="help-sm-label">도움이 됐어요</span><span
									class="help-sm-counter">1</span></a>
							</div>
						</div></li>
					<li data-id="19031"><div class="date">2017년 12월 16일</div>
						<h3 class="qst">지금 새벽 3시인데 졸리지 않습니까?</h3>
						<div class="ans">
							<p>약갼 진샤 졸뤼긴 한데 모루게쒀여 할게 너무 많기두 하구~</p>
							<div class="use">
								<a href="#" title="Helpful" class="help-sm" data-curr="0"><span
									class="help-sm-label">도움이 됐어요</span><span
									class="help-sm-counter">0</span></a>
							</div>
						</div></li>
					<li data-id="19032"><div class="date">April 1, 2017</div>
						<h3 class="qst">질문?</h3>
						<div class="ans">
							<p>답변</p>
							<div class="use">
								<a href="#" title="Helpful" class="help-sm" data-curr="5"><span
									class="help-sm-label">도움이 됐어요</span><span
									class="help-sm-counter">5</span></a>
							</div>
						</div></li>
				</ul>
				<div class="more">
					<a class="but">질문과 답변 더보기</a>
				</div>
				<a class="but ask-q blue hid" href="#cs_popup">Ask a question</a>
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
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bac524d796bfc8a7d5809708b224646c&libraries=services"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		// 지도를 생성합니다    
		var map = new daum.maps.Map(mapContainer, mapOption);

		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new daum.maps.services.Geocoder();

		// 주소로 좌표를 검색합니다
		geocoder.addressSearch('${getProd.prod_old_address}', function(result,
				status) {

			// 정상적으로 검색이 완료됐으면 
			if (status === daum.maps.services.Status.OK) {

				var coords = new daum.maps.LatLng(result[0].y, result[0].x);

				// 결과값으로 받은 위치를 마커로 표시합니다
				var marker = new daum.maps.Marker({
					map : map,
					position : coords
				});

				// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				map.setCenter(coords);
			}
		});

		// 지도타입 컨트롤의 지도 또는 스카이뷰 버튼을 클릭하면 호출되어 지도타입을 바꾸는 함수입니다
		function setMapType(maptype) {
			var roadmapControl = document.getElementById('btnRoadmap');
			var skyviewControl = document.getElementById('btnSkyview');
			if (maptype === 'roadmap') {
				map.setMapTypeId(daum.maps.MapTypeId.ROADMAP);
				roadmapControl.className = 'selected_btn';
				skyviewControl.className = 'btn';
			} else {
				map.setMapTypeId(daum.maps.MapTypeId.HYBRID);
				skyviewControl.className = 'selected_btn';
				roadmapControl.className = 'btn';
			}
		}

		// 지도 확대, 축소 컨트롤에서 확대 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
		function zoomIn() {
			map.setLevel(map.getLevel() - 1);
		}

		// 지도 확대, 축소 컨트롤에서 축소 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
		function zoomOut() {
			map.setLevel(map.getLevel() + 1);
		}
	</script>


	<script>
		(function(event, event2) {
			function cb(e) {
				this.removeEventListener(event, cb);
				this.removeEventListener(event2, cb);
				(new Image(1, 1)).src = "//bat.bing.com/action/0?ti=5089755&Ver=2";

				!function(b, e, v, t, s) {
					t = b.createElement(e);
					t.async = !0;
					t.src = v;
					s = b.getElementsByTagName(e)[0];
					s.parentNode.insertBefore(t, s)
				}(document, 'script',
						'https://connect.facebook.net/en_US/fbevents.js');
			}
			window.addEventListener(event, cb);
			window.addEventListener(event2, cb);
		})("mousemove", "touchmove");
	</script>
	<script async=""
		src="//cdn.tourradar.com/include/js/ttip/ttip.v1-1-2.min.js?v=1512312729"></script>
	<script async=""
		src="//cdn.tourradar.com/include/js/pikaday/pikaday.v1-4-2.min.js?v=1512312729"></script>
	<div class="pika-single is-hidden is-bound"
		style="position: static; left: auto; top: auto;"></div>
	<div class="tooltip hid"></div>
	<script async="" src="https://www.google.com/jsapi"></script>
</body>
<link type="text/css" rel="stylesheet"
	href="//cdn.tourradar.com/include/pw/tour/async.v1512312729.css">
<link type="text/css" rel="stylesheet"
	href="//cdn.tourradar.com/include/js/ttip/ttip.v1-1-2.min.css?v=1512312729">
<link type="text/css" rel="stylesheet"
	href="//cdn.tourradar.com/include/js/pikaday/scss/pikaday.v1-4-2.min.css?v=1512312729">
</html>