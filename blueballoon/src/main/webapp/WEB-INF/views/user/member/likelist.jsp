<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html class=" logged">
<head>
<title>BlueBalloon - ${getMember.name}'s Like Lists</title>
<script async="" src="https://www.google-analytics.com/analytics.js"></script>
<link
	href="${pageContext.request.contextPath}/resources/user/member/css/likelist1.css?ver=12"
	rel="stylesheet" type="text/css" />
</head>
<body data-b-sale="">
	<main> <%@include file="../../header3.jsp"%>
	<div class="c">
		<nav>
			<ul itemscope="" itemtype="http://schema.org/BreadcrumbList">
				<li itemprop="itemListElement" itemscope=""
					itemtype="http://schema.org/ListItem"><a itemprop="item"
					href="/">Home </a> &nbsp;&nbsp;〉&nbsp;</li>
				<li itemprop="itemListElement" itemscope=""
					itemtype="http://schema.org/ListItem"><a href=""
					itemprop="item"><span itemprop="name">Like Lists</span></a>
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
					<span class="initials" style="background: #afd54d">N</span>
				</div>
				<h1>My Wish Lists</h1>
			</div>
		</div>
		<ul class="tabs cf">
			<li><a href="/wishlists">Popular</a></li>
			<li><a href="/wishlists/tourradar-picks">TourRadar Picks</a></li>
			<li class="active">My Wish Lists</li>
		</ul>
		<ul class="cf list">
			<a href="/wishlists/966138"><li><img
					src="/im/r/ph/360x210.png">
					<div class="name">My Next Trip</div></li></a>
			<a href="/wishlists/966139"><li><img
					src="/im/r/ph/360x210.png">
					<div class="name">Dream Tours</div></li></a>
			<li class="add"><a class="but turq">Create new Wish List</a></li>
		</ul>
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