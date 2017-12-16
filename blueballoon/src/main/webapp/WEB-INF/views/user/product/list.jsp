<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html class="resp">
<head>
<title>여행상품 리스트</title>
<link
	href="${pageContext.request.contextPath}/resources/user/product/css/list1.css?ver=12"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/resources/user/product/css/list2.css?ver=1"
	rel="stylesheet" type="text/css" />
<script async="" src="https://www.google-analytics.com/analytics.js"></script>
<link rel="stylesheet" type="text/css"
	href="//cdn.tourradar.com/include/pw/serp/async.v1512451938.css">
<link rel="shortcut icon" href="//cdn.tourradar.com/favicon.ico">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$("#flip").click(function() {
			$("#panel").slideToggle(0);
		});
	});

	$(document).ready(function() {
		$("#flipp").click(function() {
			$("#panell").slideToggle(0);
		});
	});

	//메뉴 클릭시
	$(document).ready(function() {
		$("#flip1").click(function() {
			$("#panel1").slideToggle("slow");
		});
	});
	$(document).ready(function() {
		$("#icon1").click(function() {
			$("#panel1").slideToggle("slow");
		});
	});

	$(document).ready(function() {
		$("#flip2").click(function() {
			$("#panel2").slideToggle("slow");
		});
	});
	$(document).ready(function() {
		$("#icon2").click(function() {
			$("#panel2").slideToggle("slow");
		});
	});

	$(document).ready(function() {
		$("#flip3").click(function() {
			$("#panel3").slideToggle("slow");
		});
	});
	$(document).ready(function() {
		$("#icon3").click(function() {
			$("#panel3").slideToggle("slow");
		});
	});

	$(document).ready(function() {
		$("#flip4").click(function() {
			$("#panel4").slideToggle("slow");
		});
	});
	$(document).ready(function() {
		$("#icon4").click(function() {
			$("#panel4").slideToggle("slow");
		});
	});

	$(document).ready(function() {
		$("#flip5").click(function() {
			$("#panel5").slideToggle("slow");
		});
	});
	$(document).ready(function() {
		$("#icon5").click(function() {
			$("#panel5").slideToggle("slow");
		});
	});

	$(document).ready(function() {
		$("#flip6").click(function() {
			$("#panel6").slideToggle("slow");
		});
	});
	$(document).ready(function() {
		$("#icon6").click(function() {
			$("#panel6").slideToggle("slow");
		});
	});

	$(document).ready(function() {
		$("#flip7").click(function() {
			$("#panel7").slideToggle("slow");
		});
	});
	$(document).ready(function() {
		$("#icon7").click(function() {
			$("#panel7").slideToggle("slow");
		});
	});
</script>
<script type="text/javascript">
	function changePage() {
		alert("페이지 변경 함수부분 입니다")
	}
</script>
</head>
<body class="tb resp" data-b-sale="0">
	<div class="darken hid"></div>
	<%@include file="../../header1.jsp"%>

	<main data-page="2583" data-type="country" data-curr="USD"
		data-onpage="15" data-destination="Italy">
	<div class="mapply">
		<div class="sb but">Sort: Popularity</div>
		<div class="fl but">Filters</div>
	</div>
	<div class="header">
		<div class="bgimg bg-all">
			<img src="//cdn.tourradar.com/s3/serp/1436x180/2583_D8MSmSqc.jpg"
				alt="Italy Tours and Trips 2018 ">
		</div>
		<div class="c ">
			<nav>
				<ul itemscope="" itemtype="http://schema.org/BreadcrumbList">
					<li itemprop="itemListElement" itemscope=""
						itemtype="http://schema.org/ListItem"><a itemprop="item"
						href="/"> Home
							<meta itemprop="name" content="TourRadar">
					</a></li>
					<li itemprop="itemListElement" itemscope=""
						itemtype="http://schema.org/ListItem">&nbsp;&nbsp;〉&nbsp; <a
						href="/d/europe" itemprop="item"><span itemprop="name">서울특별시</span></a>
					</li>
					<li itemprop="itemListElement" itemscope=""
						itemtype="http://schema.org/ListItem">&nbsp;&nbsp;〉&nbsp; <span
						itemprop="item"><span itemprop="name">마포구</span></span>
					</li>
				</ul>
			</nav>

			<h1>Seoul Tours</h1>
		</div>
	</div>

	<div class="c">
		<div class="stat">
			<h2>서울의 인기 관광지</h2>
			<div class="sort">
				정렬기준 <select name="sort" data-default="popularity" onchange="sort()">
					<option value="popularity">인기순</option>
					<option value="rec">리뷰순</option>
					<option value="lendesc">최신순</option>
				</select>

			</div>

		</div>
		<div class="list">
			<div class="prod_list" style="height: 1000px;">
				<c:forEach var="prod" begin="1" end="9" step="1">

					<div class="spotListIn">
						<a href="product_content?prod_num=" class="spotIn focusedLink">
							<div class="thumb">
								<img
									src="http://ttcfd.hanatour.com/@cms_300/2015090782/gjeyls/홍대_쇼핑거리_TTB (3).JPG"
									alt="" width="245" style="margin-top: 0px;">
							</div> <span class="spot">합정/홍대</span> <strong class="title">홍대</strong>
							<span class="cover"></span>
							<div class="likeArea simple">
								<ul>
									<li class="awesome">
										<p>
											<span>완전 좋아요</span> <i>128</i>
										</p>
									</li>
									<li class="good">
										<p>
											<span>좋아요</span> <i>24</i>
										</p>
									</li>
									<li class="aweful cur">
										<p>
											<span>별로예요</span> <i>1</i>
										</p>
									</li>
								</ul>
							</div>
						</a>
					</div>
				</c:forEach>
			</div>

			<div class="pag">
				<a href="javascript:void(0)" onclick="changePage()" class="active">1</a><a
					href="changePage()">2</a><a href="javascript:void(0)"
					onclick="changePage()">3</a><a href="javascript:void(0)"
					onclick="changePage()">4</a><a href="changePage()">5</a><a
					href="javascript:void(0)" onclick="changePage()">6</a><a
					href="changePage()">7</a><a href="javascript:void(0)"
					onclick="changePage()">8</a><a href="changePage()">9</a><a
					href="javascript:void(0)" onclick="changePage()"><span>Next
				</span>»</a>
			</div>
			<a class="but blue p hid">Load more</a>
		</div>
		<div class="as">
			<aside id="params">
				<div class="b blue">
					<h5>필터링 기준 :</h5>

				</div>

				<div class="b b_dep">
					<h5 id="flip">추천 여행지</h5>
					<div class="c" id="panel">
						<ul style="padding-bottom: 15px;">
							<li data-pid="december-2017"><a
								href="/m/italy-december-2017" class="span"
								onclick="return false">패키지 여행</a></li>
							<li data-pid="december-2017"><a
								href="/m/italy-december-2017" class="span"
								onclick="return false">관광지</a></li>
							<li data-pid="december-2017"><a
								href="/m/italy-december-2017" class="span"
								onclick="return false">맛집</a></li>
							<li data-pid="december-2017"><a
								href="/m/italy-december-2017" class="span"
								onclick="return false">숙소</a></li>
						</ul>
					</div>
				</div>
				<div class="b op b_thm">
					<h5>지역</h5>
					<div class="c">
						<ul>
							<li data-pid="2"><div class="th" style="background: #f39a2d"></div>
								<a href="/h/italy-cultural" id="flip1" class="span"
								onclick="return false">서울 특별시</a>
								<div class="tr" id="icon1"></div>
								<ul class="sub" id="panel1" style="margin-top: 15px;">

									<li data-pid="7"><span>강남구</span></li>
									<li data-pid="77"><span>종로구</span></li>
									<li data-pid="178"><span>마포구</span></li>
									<li data-pid="6"><span>중구</span></li>
									<li data-pid="38"><span>용산구</span></li>
								</ul></li>
							<li data-pid="1"><div class="th" style="background: #96bc34"></div>
								<a href="/h/italy-cultural" id="flip2" class="span"
								onclick="return false">서울 특별시</a>
								<div class="tr" id="icon2"></div>
								<ul class="sub" id="panel2" style="margin-top: 15px;">
									<li data-pid="7"><span>강남구</span></li>
									<li data-pid="77"><span>종로구</span></li>
									<li data-pid="178"><span>마포구</span></li>
									<li data-pid="6"><span>중구</span></li>
									<li data-pid="38"><span>용산구</span></li>
								</ul></li>
							<li data-pid="5"><div class="th" style="background: #e74c3c"></div>
								<a href="/h/italy-cultural" id="flip3" class="span"
								onclick="return false">서울 특별시</a>
								<div class="tr" id="icon3"></div>
								<ul class="sub" id="panel3" style="margin-top: 15px;">
									<li data-pid="7"><span>강남구</span></li>
									<li data-pid="77"><span>종로구</span></li>
									<li data-pid="178"><span>마포구</span></li>
									<li data-pid="6"><span>중구</span></li>
									<li data-pid="38"><span>용산구</span></li>
								</ul></li>
							<li data-pid="4"><div class="th" style="background: #c681bc"></div>
								<a href="/h/italy-cultural" id="flip4" class="span"
								onclick="return false">서울 특별시</a>
								<div class="tr" id="icon4"></div>
								<ul class="sub" id="panel4" style="margin-top: 15px;">
									<li data-pid="7"><span>강남구</span></li>
									<li data-pid="77"><span>종로구</span></li>
									<li data-pid="178"><span>마포구</span></li>
									<li data-pid="6"><span>중구</span></li>
									<li data-pid="38"><span>용산구</span></li>
								</ul></li>
							<li data-pid="7"><div class="th" style="background: #cccccc"></div>
								<a href="/h/italy-cultural" id="flip5" class="span"
								onclick="return false">서울 특별시</a>
								<div class="tr" id="icon5"></div>
								<ul class="sub" id="panel5" style="margin-top: 15px;">
									<li data-pid="7"><span>강남구</span></li>
									<li data-pid="77"><span>종로구</span></li>
									<li data-pid="178"><span>마포구</span></li>
									<li data-pid="6"><span>중구</span></li>
									<li data-pid="38"><span>용산구</span></li>
								</ul></li>
							<li data-pid="3"><div class="th" style="background: #2c3e50"></div>
								<a href="/h/italy-cultural" id="flip6" class="span"
								onclick="return false">서울 특별시</a>
								<div class="tr" id="icon6"></div>
								<ul class="sub" id="panel6" style="margin-top: 15px;">
									<li data-pid="7"><span>강남구</span></li>
									<li data-pid="77"><span>종로구</span></li>
									<li data-pid="178"><span>마포구</span></li>
									<li data-pid="6"><span>중구</span></li>
									<li data-pid="38"><span>용산구</span></li>
								</ul></li>
							<li data-pid="6"><div class="th" style="background: #ffc101"></div>
								<a href="/h/italy-cultural" id="flip7" class="span"
								onclick="return false">서울 특별시</a>
								<div class="tr" id="icon7"></div>
								<ul class="sub" id="panel7" style="margin-top: 15px;">
									<li data-pid="7"><span>강남구</span></li>
									<li data-pid="77"><span>종로구</span></li>
									<li data-pid="178"><span>마포구</span></li>
									<li data-pid="6"><span>중구</span></li>
									<li data-pid="38"><span>용산구</span></li>
								</ul></li>
						</ul>
					</div>
				</div>


				<div class="b b_dep">
					<h5 id="flipp">여행 후기</h5>
					<div class="c" id="panell">
						<ul style="padding-bottom: 15px;">
							<li data-pid="december-2017"><a
								href="/m/italy-december-2017" class="span"
								onclick="return false">후기 보러가기</a></li>
						</ul>
					</div>
				</div>

			</aside>

		</div>



		<div class="e"></div>
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

	<script>
		setTimeout(
				function() {
					var file = "//cdn.tourradar.com/include/pw/serp/async.v1512838537.css", link = document
							.createElement('link');
					link.setAttribute('rel', 'stylesheet');
					link.setAttribute('type', 'text/css');
					link.setAttribute('href', file);
					document.getElementsByTagName('head')[0].appendChild(link);
				}, 1);
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
		src="//cdn.tourradar.com/include/js/ttip/ttip.v1-1-2.min.js?v=1512838537"></script>
	<div class="tooltip hid"></div>
	<script async=""
		src="//cdn.tourradar.com/include/js/nouislider/nouislider.v8-1-1.min.js?v=1512838537"></script>
</body>
<link type="text/css" rel="stylesheet"
	href="//cdn.tourradar.com/include/pw/serp/async.v1512451938.css">
<link type="text/css" rel="stylesheet"
	href="//cdn.tourradar.com/include/js/ttip/ttip.v1-1-2.min.css?v=1512451938">
<link type="text/css" rel="stylesheet"
	href="//cdn.tourradar.com/include/js/nouislider/nouislider.v8-1-1.min.css?v=1512451938">
</html>