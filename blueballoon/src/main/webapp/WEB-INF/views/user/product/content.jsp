<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>여행상품 상세페이지</title>
<link
	href="${pageContext.request.contextPath}/resources/user/product/css/content.css?ver=12333"
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

</head>
<body class="tb" data-b-sale="">
	<%@include file="../../header1.jsp"%>

	<main data-id="88570" data-code="AA-AIA" data-op="1853" data-curr="USD"
		data-sym="$" data-price="1789" data-value="$54" "="" itemscope=""
		itemtype="http://schema.org/Product">
	<div class="c">
		<nav>
			<ul>
				<li><a itemprop="item" href="/">Home
						<meta itemprop="name" content="TourRadar">
				</a></li>
				<li>&nbsp;&nbsp;〉&nbsp; <a href="/d/europe" itemprop="item"><span
						itemprop="name">서울특별시</span></a></li>
				<li>&nbsp;&nbsp;〉&nbsp; <a href="/d/iceland" itemprop="item"><span
						itemprop="name">마포구</span></a></li>
				<li>&nbsp;&nbsp;〉&nbsp; <a href="/h/iceland-nature-adventure"
					itemprop="item"><span itemprop="name">홍대</span></a></li>
			</ul>
		</nav>
		<h1 itemprop="name" class="ttip" title="" data-action="click"
			data-html="Tour code: AA-AIA">홍대</h1>

	</div>
	<div class="c" style="height: 3500px;">

		<div class="br">
			<div class="b val">
				<h2 style="margin-bottom: 20px;">지도보기</h2>
				<div id="map"></div>
			</div>

		</div>

		<div class="bl">
			<div class="b img">
				<div class="th"></div>
				<div class="pic has-thumbnails" style="height: 400px;">
					<figure>
						<a href="//cdn.tourradar.com/s3/tour/original/92506_5de80f45.jpg"
							class="or"><img
							src="//cdn.tourradar.com/s3/tour/750x400/92506_5de80f45.jpg"
							data-owner="" itemprop="image"
							alt="Nakasendo Self-guided Walking 5 Days (from Kyoto to Tokyo) - Oku Japan"
							class="h"><img
							src="//cdn.tourradar.com/s3/tour/750x400/92506_61364599.jpg"
							class="trav wide" data-owner=""><img
							src="//cdn.tourradar.com/s3/tour/750x400/92506_623387a3.jpg"
							data-src="" class="trav wide h" data-owner=""><img
							src="//cdn.tourradar.com/s3/tour/750x400/92506_c6943165.jpg"
							data-src="" class="trav wide h" data-owner=""><img
							src="//cdn.tourradar.com/s3/tour/750x400/92506_626cf1ab.jpg"
							data-src="" class="trav wide h" data-owner=""><img
							src="//cdn.tourradar.com/s3/tour/750x400/92506_d2f58255.jpg"
							data-src="" class="trav wide h" data-owner=""><img
							src="//cdn.tourradar.com/s3/tour/750x400/92506_e02e717d.jpg"
							data-src="" class="trav wide h" data-owner=""><img
							src="//cdn.tourradar.com/s3/tour/750x400/92506_1dc4466a.jpg"
							data-src="" class="trav wide h" data-owner=""><img
							src="//cdn.tourradar.com/s3/tour/750x400/92506_d01a1c83.jpg"
							data-src="" class="trav wide h" data-owner=""><img
							src="//cdn.tourradar.com/s3/tour/750x400/92506_7a676153.jpg"
							data-src="" class="trav wide h" data-owner=""><img
							src="//cdn.tourradar.com/s3/tour/750x400/92506_57f6613a.jpg"
							data-src="" class="trav wide h" data-owner=""><img
							src="//cdn.tourradar.com/s3/tour/750x400/92506_f1d75fc9.jpg"
							data-src="" class="trav wide h" data-owner=""><img
							src="//cdn.tourradar.com/s3/tour/750x400/92506_fad410b4.jpg"
							data-src="" class="trav wide h" data-owner=""><img
							src="//cdn.tourradar.com/s3/tour/750x400/92506_07f629c8.jpg"
							data-src="" class="trav wide h" data-owner=""><img
							src="//cdn.tourradar.com/s3/tour/750x400/92506_9f36bfff.jpg"
							data-src="" class="trav h" data-owner=""><img
							src="//cdn.tourradar.com/s3/tour/750x400/92506_54e97b15.jpg"
							data-src="" class="trav tall wide h" data-owner=""><img
							src="//cdn.tourradar.com/s3/tour/750x400/92506_54dd1583.jpg"
							data-src="" class="trav tall wide h" data-owner=""><img
							src="//cdn.tourradar.com/s3/tour/750x400/92506_b43d48b6.jpg"
							data-src="" class="trav tall wide h" data-owner=""><img
							src="//cdn.tourradar.com/s3/tour/750x400/92506_95a8fd85.jpg"
							data-src="" class="trav tall wide h" data-owner=""><img
							src="//cdn.tourradar.com/s3/tour/750x400/92506_3f478975.jpg"
							data-src="" class="trav tall wide h" data-owner=""><img
							src="//cdn.tourradar.com/s3/tour/750x400/92506_60697353.jpg"
							data-src="" class="trav wide h" data-owner=""><img
							src="//cdn.tourradar.com/s3/tour/750x400/92506_dcd576ae.jpg"
							data-src="" class="trav wide h" data-owner=""><img
							src="//cdn.tourradar.com/s3/tour/750x400/92506_10a6bb21.jpg"
							data-src="" class="trav wide h" data-owner=""><img
							src="//cdn.tourradar.com/s3/tour/750x400/92506_eaafc348.jpg"
							data-src="" class="trav wide h" data-owner=""><img
							src="data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7"
							data-src="//cdn.tourradar.com/s3/tour/750x400/92506_67539e5b.jpg"
							class="trav h" data-owner=""><img
							src="data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7"
							data-src="//cdn.tourradar.com/s3/tour/750x400/92506_e01e649d.jpg"
							class="trav h" data-owner=""><img
							src="data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7"
							data-src="//cdn.tourradar.com/s3/tour/750x400/92506_ff26a2a2.jpg"
							class="trav h" data-owner=""><img
							src="data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7"
							data-src="//cdn.tourradar.com/s3/tour/750x400/92506_a296ddb3.jpg"
							class="trav h" data-owner=""><img
							src="data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7"
							data-src="//cdn.tourradar.com/s3/tour/750x400/92506_10d4194b.jpg"
							class="trav h" data-owner=""><img
							src="//cdn.tourradar.com/s3/tour/750x400/92506_d459c38b.jpg"
							data-src="" class="trav h" data-owner=""></a>
						<figcaption>Nakasendo Self-guided Walking 5 Days
							(from Kyoto to Tokyo) - Oku Japan</figcaption>
					</figure>
					<meta name="twitter:card" content="summary_large_image">
					<meta name="twitter:site" content="@tourradar">
					<meta name="twitter:image"
						content="//cdn.tourradar.com/s3/tour/750x400/92506_5de80f45.jpg">
					<meta name="twitter:title"
						content="Nakasendo Self-guided Walking 5 Days (from Kyoto to Tokyo)">
					<meta name="twitter:description"
						content=" Start in Kyoto and end in Tokyo!
 
 With the self-guided tour Nakasendo Self-guided Walking 5 Days (from Kyoto to Tokyo), you have a 5 day tour package taking you through
 
 Kyoto, Japan and 11 other 
 destinations in Japan.
 
 ">


					<div class="thumbnails">
						<div
							class="thumbnails__arrow thumbnails__arrow--left js-thumbnails-left invis"
							data-shift="-1"></div>
						<ul class="thumbnails__list">
							<li class="thumbnails__thumbnail unselectable"
								style="margin-left: 0px;"><img width="45" height="45"
								class="thumbnails__image js-thumbnail"
								data-src="//cdn.tourradar.com/s3/tour/45x45/92506_5de80f45.jpg"
								src="//cdn.tourradar.com/s3/tour/45x45/92506_5de80f45.jpg"></li>
							<li
								class="thumbnails__thumbnail unselectable thumbnails__thumbnail--active"><img
								width="45" height="45" class="thumbnails__image js-thumbnail"
								data-src="//cdn.tourradar.com/s3/tour/45x45/92506_61364599.jpg"
								src="//cdn.tourradar.com/s3/tour/45x45/92506_61364599.jpg"></li>
							<li class="thumbnails__thumbnail unselectable"><img
								width="45" height="45" class="thumbnails__image js-thumbnail"
								data-src="//cdn.tourradar.com/s3/tour/45x45/92506_623387a3.jpg"
								src="//cdn.tourradar.com/s3/tour/45x45/92506_623387a3.jpg"></li>
							<li class="thumbnails__thumbnail unselectable"><img
								width="45" height="45" class="thumbnails__image js-thumbnail"
								data-src="//cdn.tourradar.com/s3/tour/45x45/92506_c6943165.jpg"
								src="//cdn.tourradar.com/s3/tour/45x45/92506_c6943165.jpg"></li>
							<li class="thumbnails__thumbnail unselectable"><img
								width="45" height="45" class="thumbnails__image js-thumbnail"
								data-src="//cdn.tourradar.com/s3/tour/45x45/92506_626cf1ab.jpg"
								src="//cdn.tourradar.com/s3/tour/45x45/92506_626cf1ab.jpg"></li>
							<li class="thumbnails__thumbnail unselectable"><img
								width="45" height="45" class="thumbnails__image js-thumbnail"
								data-src="//cdn.tourradar.com/s3/tour/45x45/92506_d2f58255.jpg"
								src="//cdn.tourradar.com/s3/tour/45x45/92506_d2f58255.jpg"></li>
							<li class="thumbnails__thumbnail unselectable"><img
								width="45" height="45" class="thumbnails__image js-thumbnail"
								data-src="//cdn.tourradar.com/s3/tour/45x45/92506_e02e717d.jpg"
								src="//cdn.tourradar.com/s3/tour/45x45/92506_e02e717d.jpg"></li>
							<li class="thumbnails__thumbnail unselectable"><img
								width="45" height="45" class="thumbnails__image js-thumbnail"
								data-src="//cdn.tourradar.com/s3/tour/45x45/92506_1dc4466a.jpg"
								src="//cdn.tourradar.com/s3/tour/45x45/92506_1dc4466a.jpg"></li>
							<li class="thumbnails__thumbnail unselectable"><img
								width="45" height="45" class="thumbnails__image js-thumbnail"
								data-src="//cdn.tourradar.com/s3/tour/45x45/92506_d01a1c83.jpg"
								src="//cdn.tourradar.com/s3/tour/45x45/92506_d01a1c83.jpg"></li>
							<li class="thumbnails__thumbnail unselectable"><img
								width="45" height="45" class="thumbnails__image js-thumbnail"
								data-src="//cdn.tourradar.com/s3/tour/45x45/92506_7a676153.jpg"
								src="//cdn.tourradar.com/s3/tour/45x45/92506_7a676153.jpg"></li>
							<li class="thumbnails__thumbnail unselectable"><img
								width="45" height="45" class="thumbnails__image js-thumbnail"
								data-src="//cdn.tourradar.com/s3/tour/45x45/92506_57f6613a.jpg"
								src="//cdn.tourradar.com/s3/tour/45x45/92506_57f6613a.jpg"></li>
							<li class="thumbnails__thumbnail unselectable"><img
								width="45" height="45" class="thumbnails__image js-thumbnail"
								data-src="//cdn.tourradar.com/s3/tour/45x45/92506_f1d75fc9.jpg"
								src="//cdn.tourradar.com/s3/tour/45x45/92506_f1d75fc9.jpg"></li>
							<li class="thumbnails__thumbnail unselectable"><img
								width="45" height="45" class="thumbnails__image js-thumbnail"
								data-src="//cdn.tourradar.com/s3/tour/45x45/92506_fad410b4.jpg"
								src="//cdn.tourradar.com/s3/tour/45x45/92506_fad410b4.jpg"></li>
							<li class="thumbnails__thumbnail unselectable"><img
								width="45" height="45" class="thumbnails__image js-thumbnail"
								data-src="//cdn.tourradar.com/s3/tour/45x45/92506_07f629c8.jpg"
								src="//cdn.tourradar.com/s3/tour/45x45/92506_07f629c8.jpg"></li>
							<li class="thumbnails__thumbnail unselectable"><img
								width="45" height="45" class="thumbnails__image js-thumbnail"
								data-src="//cdn.tourradar.com/s3/tour/45x45/92506_9f36bfff.jpg"
								src="//cdn.tourradar.com/s3/tour/45x45/92506_9f36bfff.jpg"></li>
							<li class="thumbnails__thumbnail unselectable"><img
								width="45" height="45" class="thumbnails__image js-thumbnail"
								data-src="//cdn.tourradar.com/s3/tour/45x45/92506_54e97b15.jpg"
								src="//cdn.tourradar.com/s3/tour/45x45/92506_54e97b15.jpg"></li>
							<li class="thumbnails__thumbnail unselectable"><img
								width="45" height="45" class="thumbnails__image js-thumbnail"
								data-src="//cdn.tourradar.com/s3/tour/45x45/92506_54dd1583.jpg"
								src="//cdn.tourradar.com/s3/tour/45x45/92506_54dd1583.jpg"></li>
							<li class="thumbnails__thumbnail unselectable"><img
								width="45" height="45" class="thumbnails__image js-thumbnail"
								data-src="//cdn.tourradar.com/s3/tour/45x45/92506_b43d48b6.jpg"
								src="//cdn.tourradar.com/s3/tour/45x45/92506_b43d48b6.jpg"></li>
							<li class="thumbnails__thumbnail unselectable"><img
								width="45" height="45" class="thumbnails__image js-thumbnail"
								data-src="//cdn.tourradar.com/s3/tour/45x45/92506_95a8fd85.jpg"
								src="//cdn.tourradar.com/s3/tour/45x45/92506_95a8fd85.jpg"></li>
							<li class="thumbnails__thumbnail unselectable"><img
								width="45" height="45" class="thumbnails__image js-thumbnail"
								data-src="//cdn.tourradar.com/s3/tour/45x45/92506_3f478975.jpg"
								src="//cdn.tourradar.com/s3/tour/45x45/92506_3f478975.jpg"></li>
							<li class="thumbnails__thumbnail unselectable"><img
								width="45" height="45" class="thumbnails__image js-thumbnail"
								data-src="//cdn.tourradar.com/s3/tour/45x45/92506_60697353.jpg"
								src="//cdn.tourradar.com/s3/tour/45x45/92506_60697353.jpg"></li>
							<li class="thumbnails__thumbnail unselectable"><img
								width="45" height="45" class="thumbnails__image js-thumbnail"
								data-src="//cdn.tourradar.com/s3/tour/45x45/92506_dcd576ae.jpg"
								src="//cdn.tourradar.com/s3/tour/45x45/92506_dcd576ae.jpg"></li>
							<li class="thumbnails__thumbnail unselectable"><img
								width="45" height="45" class="thumbnails__image js-thumbnail"
								data-src="//cdn.tourradar.com/s3/tour/45x45/92506_10a6bb21.jpg"
								src="//cdn.tourradar.com/s3/tour/45x45/92506_10a6bb21.jpg"></li>
							<li class="thumbnails__thumbnail unselectable"><img
								width="45" height="45" class="thumbnails__image js-thumbnail"
								data-src="//cdn.tourradar.com/s3/tour/45x45/92506_eaafc348.jpg"
								src="//cdn.tourradar.com/s3/tour/45x45/92506_eaafc348.jpg"></li>
							<li class="thumbnails__thumbnail unselectable"><img
								width="45" height="45"
								class="thumbnails__image thumbnails__thumbnail--hidden js-thumbnail"
								data-src="//cdn.tourradar.com/s3/tour/45x45/92506_67539e5b.jpg"></li>
							<li class="thumbnails__thumbnail unselectable"><img
								width="45" height="45"
								class="thumbnails__image thumbnails__thumbnail--hidden js-thumbnail"
								data-src="//cdn.tourradar.com/s3/tour/45x45/92506_e01e649d.jpg"></li>
							<li class="thumbnails__thumbnail unselectable"><img
								width="45" height="45"
								class="thumbnails__image thumbnails__thumbnail--hidden js-thumbnail"
								data-src="//cdn.tourradar.com/s3/tour/45x45/92506_ff26a2a2.jpg"></li>
							<li class="thumbnails__thumbnail unselectable"><img
								width="45" height="45"
								class="thumbnails__image thumbnails__thumbnail--hidden js-thumbnail"
								data-src="//cdn.tourradar.com/s3/tour/45x45/92506_a296ddb3.jpg"></li>
							<li class="thumbnails__thumbnail unselectable"><img
								width="45" height="45"
								class="thumbnails__image thumbnails__thumbnail--hidden js-thumbnail"
								data-src="//cdn.tourradar.com/s3/tour/45x45/92506_10d4194b.jpg"></li>
							<li class="thumbnails__thumbnail unselectable"><img
								width="45" height="45"
								class="thumbnails__image thumbnails__thumbnail--hidden js-thumbnail"
								data-src="//cdn.tourradar.com/s3/tour/45x45/92506_d459c38b.jpg"></li>
						</ul>
						<div class="thumbnails__arrow js-thumbnails-right" data-shift="1"></div>
					</div>
				</div>

			</div>

			<div class="b pad hgl">
				
				<h2 class="sm">여행 꿀팁</h2>
				<a class="but r write" href="/review/arctic-adventures?tour=88570" target="_blank" rel="nofollow" 
				style="width: 143px; border-color: red;">바로 예약하기</a>
				<ul>
					<li>꿀팁 1</li>
					<li>꿀팁 2</li>
					<li>꿀팁 3</li>
					
				</ul>
				<dl class="properties">
					<dt class="label">상품 이름</dt>
					<dd class="value age">홍대 맛집</dd>
					<dt class="label">지역</dt>
					<dd class="value accommodation">서울특별시 마포구</dd>
					<dt class="label">주소</dt>
					<dd class="value">서울특별시 마포구 서교동</dd>
					<dt class="label">이메일</dt>
					<dd class="value transport">ㅇㅇㅇ</dd>
					<dt class="label">전화번호</dt>
					<dd class="value transport">ㅇㅇㅇ</dd>
					<dt class="label">가격</dt>
					<dd class="value transport">ㅇㅇㅇ</dd>
					<dt class="label">상품 분류</dt>
					<dd class="value transport">맛집</dd>
					<dt class="label">상세 정보</dt>
					<dd class="value transport">ㅇㅇㅇ</dd>
				</dl>
				<div class="intro" itemprop="description">
					좋아요 버튼 기능 넣을 예정
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
				
				<a class="but r write" href="board_write"
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
				Copyright © TourRadar. All rights reserved. <a href="/legalnotice">Legal
					notice</a>
			</div>
		</div>
	</footer>

	<script>
		function initMap() {
			var uluru = {
				lat : 37.556,
				lng : 126.923
			};
			var map = new google.maps.Map(document.getElementById('map'), {
				zoom : 17,
				center : uluru
			});
			var marker = new google.maps.Marker({
				position : uluru,
				map : map
			});
		}
	</script>
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBZSdS0Rq8yfR9AE2r0Hc26LGNOU8Su6W8&callback=initMap">
		
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
	<noscript>&lt;img height="1" width="1" style="display:none"
		src="https://www.facebook.com/tr?id=806188949420761&amp;ev=PageView&amp;noscript=1"&gt;</noscript>
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