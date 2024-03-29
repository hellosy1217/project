<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html class="resp">
<head>
<title>여행상품 리스트</title>
<link
	href="${pageContext.request.contextPath}/resources/user/product/css/list1.css?ver=23"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/resources/user/product/css/list2.css?ver=1"
	rel="stylesheet" type="text/css" />
<!-- 좋아요 버튼 아이콘  -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<script async="" src="https://www.google-analytics.com/analytics.js"></script>
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
		$("#icon1").click(function() {
			$("#panel1").slideToggle("slow");
		});
		$("#flip2").click(function() {
			$("#panel2").slideToggle("slow");
		});
		$("#icon2").click(function() {
			$("#panel2").slideToggle("slow");
		});
		$("#flip3").click(function() {
			$("#panel3").slideToggle("slow");
		});
		$("#icon3").click(function() {
			$("#panel3").slideToggle("slow");
		});
		$("#flip4").click(function() {
			$("#panel4").slideToggle("slow");
		});
		$("#icon4").click(function() {
			$("#panel4").slideToggle("slow");
		});
		$("#flip5").click(function() {
			$("#panel5").slideToggle("slow");
		});
		$("#icon5").click(function() {
			$("#panel5").slideToggle("slow");
		});
		$("#flip6").click(function() {
			$("#panel6").slideToggle("slow");
		});
		$("#icon6").click(function() {
			$("#panel6").slideToggle("slow");
		});
		$("#flip7").click(function() {
			$("#panel7").slideToggle("slow");
		});
		$("#icon7").click(function() {
			$("#panel7").slideToggle("slow");
		});
	});
</script>
<script type="text/javascript">
	function change(cate_state,cate_city,prod_pick,currentPage) {
		var lh = 'product_list?';
		if(cate_state!=''){
			lh += 'cate_state='+cate_state;
		}
		if(cate_city!=''){
			if(cate_state!=null||cate_state!='')
				lh+='&';
			lh+='cate_city='+cate_city;
		}
		if(cate_state!=''||cate_city!='')
			lh+='&';
		lh+='prod_pick='+prod_pick;
		
		lh+='&currentPage='+currentPage;
		
		lh+='&sort='+document.getElementById('sort').options[ document.getElementById('sort').selectedIndex].value;

		location.href=lh;
	}
</script>
</head>
<body class="tb resp" data-b-sale="0">
	<div class="darken hid"></div>
	<c:choose>
		<c:when test="${member_num==0}">
			<%@include file="../../header1.jsp"%>
		</c:when>
		<c:otherwise>
			<%@include file="../../header3.jsp"%>
		</c:otherwise>
	</c:choose>
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
						href="main"> Home
							<meta itemprop="name" content="TourRadar">
					</a></li>
					<li itemprop="itemListElement" itemscope=""
						itemtype="http://schema.org/ListItem">&nbsp&nbsp〉&nbsp<a href="#"
						itemprop="item"
						onclick="change('${cate_state}','${cate_city}',${prod_pick},${currentPage},${prod_pick },1)"><span
							itemprop="name">${cate_state}</span></a>
					</li>
					<c:if test="${!empty cate_city }">
						<li itemprop="itemListElement" itemscope=""
							itemtype="http://schema.org/ListItem">&nbsp&nbsp〉&nbsp<span
							itemprop="item"><span itemprop="name">${cate_city }</span></span>
						</li>
					</c:if>
				</ul>
			</nav>
			<h1>${cate_state }&nbsp${cate_city }</h1>
		</div>
	</div>

	<div class="c">
		<div class="stat">
			<c:set var="sor" value="최신순,인기순" />
			<div class="sort">
				정렬기준 <select name="sort" id="sort"
					onchange="change('${cate_state}','${cate_city }',${prod_pick },1)">
					<c:forTokens items="${sor}" delims="," var="srt">
						<c:choose>
							<c:when test="${srt eq sort}">
								<option value="${srt }" selected="selected">${srt }</option>
							</c:when>
							<c:otherwise>
								<option value="${srt }">${srt }</option>
							</c:otherwise>
						</c:choose>
					</c:forTokens>
				</select>
			</div>
		</div>

		<div class="as">
			<aside id="params">
				<div class="b blue">
					<c:set var="fil" value="관광지,맛집,숙소" />
					<h5>
						필터링 기준 :
						<c:forTokens items="${fil}" delims="," varStatus="vs" var="ff">
							<c:if test="${prod_pick eq vs.count}">
							${ff}
						</c:if>
						</c:forTokens>
					</h5>
				</div>
				<div class="b b_dep">
					<h5 id="flip">추천 여행지</h5>
					<div class="c" id="panel">
						<ul style="padding-bottom: 15px;">
							<li data-pid="december-2017"><a href="pack_list"
								class="span" onclick="return false">패키지 여행</a></li>
							<c:set var="pick" value="관광지,맛집,숙소" />
							<c:forTokens items="${pick}" delims="," varStatus="st" var="p">
								<li><a class="span"
									onclick="change('${cate_state}','${cate_city}',${st.count},1)">${p}</a></li>
							</c:forTokens>

						</ul>
					</div>
				</div>
				<div class="b op b_thm">
					<h5>지역</h5>
					<div class="c" id="cate_list">
						<ul>
							<c:set var="color"
								value="#f39a2d;#96bc34;#e74c3c;#c681bc;#cccccc;#2c3e50;#ffc101" />
							<c:set var="city" value="서울특별시,경기도,강원도,경상도,전라도,충청도,제주도" />
							<c:forTokens items="${city}" delims="," var="c"
								varStatus="status">
								<li><c:forTokens items="${color}" var="col" delims=";"
										varStatus="st">
										<c:if test="${status.count eq st.count}">
											<div class="th" style="background: ${col}"></div>
										</c:if>
									</c:forTokens> <a href="#" id="flip${status.count}" class="span">${c}</a>
									<div class="tr" id="icon${status.count}"></div>
									<ul class="sub" id="panel${status.count}"
										style="margin-top: 15px;">
										<c:forEach items="${listCate}" var="list">
											<c:if test="${list.cate_state == c}">
												<li><span><a
														onclick="change('${list.cate_state}','${list.cate_city}',${prod_pick},${currentPage})">${list.cate_city}</a></span></li>
											</c:if>
										</c:forEach>
									</ul></li>
							</c:forTokens>
						</ul>
					</div>
				</div>
				<div class="b b_dep">
					<h5 id="flipp">여행 후기</h5>
					<div class="c" id="panell">
						<ul style="padding-bottom: 15px;">
							<li><a href="board_list" class="span">후기 보러가기</a></li>
						</ul>
					</div>
				</div>
			</aside>
		</div>

		<div class="list">
			<div class="prod_list" style="height: 1000px;">
				<c:forEach var="prod" items="${listProd}">
					<div class="spotListIn">
						<a href="product_content?prod_num=${prod.prod_num}"
							class="spotIn focusedLink">
							<div class="thumb">
								<img
									src="https://s3.ap-northeast-2.amazonaws.com/bbproject2017/bb_product${prod.prod_pick}/${prod.prod_str_img}"
									alt="" width="245" style="margin-top: 0px;">
							</div> <span class="spot"><c:forTokens items="${prod.prod_cate}"
									delims="-" var="pc">
									${pc} 
									</c:forTokens></span> <strong class="title">${prod.prod_name}</strong> <span
							class="cover"></span>
							<div class="likeArea simple">
								<ul>
									<li><i class="fa fa-thumbs-up" aria-hidden="true"
										style="font-size: 16px;"></i></li>
									<li class="good">
										<p>
											<i>${prod.prod_likeCount}</i>
										</p>
									</li>
								</ul>
							</div>
						</a>
					</div>
				</c:forEach>
			</div>
			<div class="pag">
				<c:if test="${currentPage > 9}">
					<a
						onclick="change('${cate_state}','${cate_city}',${prod_pick},${currentPage-1})"">«<span>Previous</span></a>
				</c:if>
				<c:forEach var="page" begin="${startPage}" end="${endPage}" step="1">
					<c:choose>
						<c:when test="${currentPage eq page}">
							<a href="javascript:void(0)"
								onclick="change('${cate_state}','${cate_city}',${prod_pick},${currentPage})"
								class="active">${page}</a>
						</c:when>
						<c:otherwise>
							<a href="javascript:void(0)"
								onclick="change('${cate_state}','${cate_city}',${prod_pick},${page})">${page}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${endPage ne pageNum}">
					<a href="javascript:void(0)"
						onclick="change('${cate_state}','${cate_city}',${prod_pick},${currentPage+1})"><span>Next
					</span>»</a>
				</c:if>
			</div>
			<a class="but blue p hid">Load more</a>
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
	<script async=""
		src="//cdn.tourradar.com/include/js/ttip/ttip.v1-1-2.min.js?v=1512838537"></script>
	<div class="tooltip hid"></div>
	<script async=""
		src="//cdn.tourradar.com/include/js/nouislider/nouislider.v8-1-1.min.js?v=1512838537"></script>
</body>

<link type="text/css" rel="stylesheet"
	href="//cdn.tourradar.com/include/js/ttip/ttip.v1-1-2.min.css?v=1512451938">
<link type="text/css" rel="stylesheet"
	href="//cdn.tourradar.com/include/js/nouislider/nouislider.v8-1-1.min.css?v=1512451938">
</html>