<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html class=" logged">
<head>
<title>BlueBalloon - Like Lists</title>
<script async="" src="https://www.google-analytics.com/analytics.js"></script>
<link
	href="${pageContext.request.contextPath}/resources/user/member/css/likelist1.css?ver=124"
	rel="stylesheet" type="text/css" />
</head>
<body data-b-sale="">
	<main> <%@include file="../../header3.jsp"%>
	<div class="c">
		<nav class="nlist">
			<ul itemscope="" itemtype="http://schema.org/BreadcrumbList">
				<li itemprop="itemListElement" itemscope=""
					itemtype="http://schema.org/ListItem"><a itemprop="item"
					href="main">Home </a> &nbsp;&nbsp;〉&nbsp;</li>
				<li itemprop="itemListElement" itemscope=""
					itemtype="http://schema.org/ListItem"><a href="member_profile"
					itemprop="item"><span itemprop="name">My profile</span></a>
					&nbsp;&nbsp;〉&nbsp;</li>
				<li itemprop="itemListElement" itemscope=""
					itemtype="http://schema.org/ListItem"><span itemprop="item"><span
						itemprop="name">My Like Lists</span></span></li>
			</ul>
		</nav>
	</div>
	<div class="c cf">
		<div class="own">
			<div class="ownc">
				<div class="im">
					<span class="initials" style="background: #afd54d">${member_name}</span>
				</div>
				<h1>좋아요 목록</h1>
			</div>
		</div>
		<ul class="cf list">
			<c:forEach items="${likeList }" var="ll">
				<a href="product_content?prod_num=${ll.prod_num }"><li><img
						src="https://s3.ap-northeast-2.amazonaws.com/bbproject2017/bb_product${ll.prod_pick }/${ll.prod_str_img}">
						<div class="name">${ll.prod_name }</div></li></a>
			</c:forEach>
			<li class="add"><a href="product_list" class="but turq">Create
					new Wish List</a></li>
		</ul>
	</div>
	</main>
	<footer>
		<div class="c">
			<div class="cop">Copyright © BlueBalloon. All rights reserved.
			</div>

		</div>
	</footer>
	<script
		src="//cdn.tourradar.com/include/pw/wishlist/user_list/script.v1514483941.min.js"
		async=""></script>
	<script>
		ga('send', 'pageview');
		console.log('PAGEVIEW');

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
</body>
<link type="text/css" rel="stylesheet"
	href="//cdn.tourradar.com/include/pw/wishlist/user_list/async.v1514483941.css">
</html>