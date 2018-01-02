<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
<head>
<title>Review - BlueBalloon</title>
<link rel="stylesheet"
	href="//cdn.tourradar.com//include/css/responsive.min.css?v=1514557673"
	type="text/css" media="all">
<script
	src="https://apis.google.com/_/scs/apps-static/_/js/k=oz.gapi.ko.SXv6EGggdTE.O/m=plus/rt=j/sv=1/d=1/ed=1/am=AQ/rs=AGLTcCM4d_gJSwgxQZOKnWSuoyAU-mhtrg/cb=gapi.loaded_0"
	async=""></script>
<script
	src="https://connect.facebook.net/signals/config/806188949420761?v=2.8.6&amp;r=stable"
	async=""></script>
<script async="" src="//www.google-analytics.com/analytics.js"></script>
<script type="text/javascript">
	function finish() {
		alert("1");
	}
</script>
<link
	href="${pageContext.request.contextPath}/resources/user/board/css/write1.css?ver=1"
	rel="stylesheet" type="text/css" />
</head>
<body class=" ">
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
				'//www.google-analytics.com/analytics.js', 'ga');
		ga('create', 'UA-334117-5', 'auto');
		ga('send', 'pageview');
	</script>
	<%@include file="../../header2.jsp"%>
	<div id="content" class="clearfix content_review ">
		<div class="operator-review step0">
			<div class="operator" operator="1504">
				<div class="img-cnt">
					<img
						src="//cdn.tourradar.com/s3/op/250x115/Italy_on_a_Budget_Tours-76e0.png">
				</div>
			</div>
			<div class="txt">
				<h2>Your opinion matters</h2>
				<p>
					Leave a short review of your Italy on a Budget Tours tour, and help
					others find the right tour for them.<br> We only feature
					reviews from trusted sources.
				</p>
				<a class="but" href="#" onclick="return false"
					data-name="Italy on a Budget Tours">Start your review</a>
			</div>
		</div>
		<div class="verify-email hidden">
			<div class="popup">
				<span class="close">✕</span>
				<h2>Confirm your email address</h2>
				<img src="/images/responsive/review/verify_email.png"
					alt="Confirm your email address">
				<p>
					Almost finished! We've sent you an email to <span></span>, please
					check your inbox and confirm your email address in order to publish
					your review.
				</p>
				<p>
					Didn't receive the email? <a href="#">Resend</a>
				</p>
			</div>
		</div>
		<div class="operator-review step2 hidden">
			<div class="heading form1 form2 ">
				<div class="operator" operator="1504">
					<div class="img-cnt">
						<img
							src="//cdn.tourradar.com/s3/op/250x115/Italy_on_a_Budget_Tours-76e0.png">
					</div>
				</div>
				<div class="txt">
					<h1 class="orig">Help your fellow travellers by sharing your
						experience with Italy on a Budget Tours</h1>
					<h1 class="repl hidden">Rate your experience with Italy on a
						Budget Tours</h1>
					<ul class="subtitle clearfix">
						<li class="com">Italy on a Budget Tours<span></span></li>
						<li class="act">Review your tour<span></span></li>
						<li>Rate your tour and guide<span></span></li>
						<li>Finish</li>
					</ul>
				</div>
			</div>
			<p class="note back-to-review form2 hidden">« Back to review</p>
			<div class="form1">
				<section class="wrapper">
					<article class="arrow1 last">
						<div class="header-cnt">
							<h2>Your review</h2>
							<span class="pic1 middle left15"><svg class="svg-arrow"
									viewBox="0 0 32 32">
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
									class="pic3 err hidden"> Please write your review here
									(15 character minimum) </span>
							</div>
						</div>
						<textarea
							placeholder="Share your experience! Was the trip what you expected? Describe your guide, the transportation, the accommodation, etc..."
							class="review_text"></textarea>
					</article>
					<article class="error-plc-hld center"></article>
					<article class="center button-opt-arrow">
						<button class="maincta">Continue</button>
						<div class="opt hidden">
							<span class="pic1"><svg class="svg-arrow"
									viewBox="0 0 32 32">
									<g>
									<path d="M0 16l16 16v-10h16l0-12h-16v-10z"></path></g></svg></span>
						</div>
					</article>
				</section>
			</div>
			<div class="form2 hidden">
				<section class="wrapper">
					<article class="arrow1">
						<h2>Which tour did you go on?</h2>
						<span class="pic1 middle left15 hidden"><svg
								class="svg-arrow" viewBox="0 0 32 32">
								<g>
								<path d="M0 16l16 16v-10h16l0-12h-16v-10z"></path></g></svg></span><span
							class="pic2 middle left15"><svg class="svg-check"
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
								class="pic3 err hidden"> Please choose your tour </span>
						</div>
						<select id="tours" class="f-height" style="display: none;"><option
								value="">Select the tour</option>
							<option value="53252">Amalfi Coast Tour From Rome</option>
							<option value="89406" selected="">Buongiorno Italia - 7
								Days/ 6nights</option>
							<option value="94417">Discovering Sicily From Catania -
								5days/4nights</option>
							<option value="95427">Florence City Break -
								3days/2nights</option>
							<option value="93024">Fun In Sicily Tour- 5days/4nights</option>
							<option value="89398">Let's Go North - 9 Days/8 Nights</option>
							<option value="75915">Mamma Mia! - 13 Days/12 Nights</option>
							<option value="89403">Rome City Break - 3days/2nights</option>
							<option value="101698">Simply Italy 8days/7nights</option>
							<option value="98321">The Best Of Rome - 4 Days/3nights</option>
							<option value="95392">The Best Of Tuscany - 4d/3n Summer</option>
							<option value="98886">The Best Of Tuscany - 4d/3n Winter
								( Nov-mar )</option>
							<option value="89405">The Italian Lakes Adventure -
								5D/4N Lake Como, Lake Garda and Verona</option>
							<option value="104584">Venice Carnival - 4 Days/3 Nights</option></select>
						<div class="chosen-container chosen-container-single"
							style="width: 100%;" title="" id="tours_chosen">
							<a class="chosen-single" tabindex="-1"><span>Buongiorno
									Italia - 7 Days/ 6nights</span>
								<div>
									<b></b>
								</div></a>
							<div class="chosen-drop">
								<div class="chosen-search">
									<input type="text" autocomplete="off">
								</div>
								<ul class="chosen-results"></ul>
							</div>
						</div>
						<input class="free-entered-tour hidden" on="" type="text"
							placeholder="Please type the name of the tour you were on"
							value="">
						<p class="note two hidden">Want to choose from tours list?</p>
						<p class="note one">Can’t find/remember your tour name?</p>
					</article>
					<article class="arrow2">
						<div class="header-cnt sc-mark1">
							<h2>When did you travel?</h2>
							<span class="pic1 middle left15"><svg class="svg-arrow"
									viewBox="0 0 32 32">
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
									class="pic3 err hidden"> Please choose correct month and
									year </span>
							</div>
						</div>
						<select class="select year"><option value="">Year</option>
							<option value="2014">2014</option>
							<option value="2015">2015</option>
							<option value="2016">2016</option>
							<option value="2017">2017</option>
							<option value="2018">2018</option></select><select class="select month"><option
								value="">Month</option>
							<option value="1">January</option>
							<option value="2">February</option>
							<option value="3">March</option>
							<option value="4">April</option>
							<option value="5">May</option>
							<option value="6">June</option>
							<option value="7">July</option>
							<option value="8">August</option>
							<option value="9">September</option>
							<option value="10">October</option>
							<option value="11">November</option>
							<option value="12">December</option></select>
					</article>
					<article class="arrow3">
						<div class="header-cnt">
							<h2>How would you rate?</h2>
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
									class="pic3 err hidden"> Please rate the following </span>
							</div>
						</div>
						<div class="rate">
							<div class="rating-title">
								Value for money<br>
							</div>
							<span class="stars v starhover" num=""><span>☆</span><span>☆</span><span>☆</span><span>☆</span><span>☆</span></span><span
								class="rating-hint"></span>
						</div>
						<div class="rate">
							<div class="rating-title">
								Transportation<br>
							</div>
							<span class="stars t starhover" num=""><span>☆</span><span>☆</span><span>☆</span><span>☆</span><span>☆</span></span><span
								class="rating-hint"></span>
						</div>
						<div class="rate">
							<div class="rating-title">
								Accommodation <span class="grey">OPTIONAL</span>
							</div>
							<span class="stars a starhover" num=""><span>☆</span><span>☆</span><span>☆</span><span>☆</span><span>☆</span></span><span
								class="rating-hint"></span>
						</div>
						<div class="rate">
							<div class="rating-title">
								Meals <span class="grey">OPTIONAL</span>
							</div>
							<span class="stars m starhover" num=""><span>☆</span><span>☆</span><span>☆</span><span>☆</span><span>☆</span></span><span
								class="rating-hint"></span>
						</div>
					</article>
					<article>
						<h2 class="nofloat">
							Share your stellar trip photos! <span class="grey">OPTIONAL</span>
						</h2>
						<div class="cont">
							<button class="secondary switch-upload-on">Upload photos</button>
							<div class="photo_upload hidden">
								<div class="hidden">
									<figure id="sample" class="user-image">
										<div class="imagetool">
											<div class="rotate">
												<svg class="svg-icon-reload" viewBox="0 0 15 16">
													<g>
													<g transform="translate(-8.000000, -78.000000)">
													<path
														d="M22.4 88.7C22 89.6 21.5 90.4 20.8 91.1 20.1 91.8 19.3 92.3 18.4 92.7 17.5 93.1 16.5 93.3 15.5 93.3 14.5 93.3 13.5 93.1 12.6 92.7 11.7 92.3 10.9 91.8 10.2 91.1 9.5 90.4 9 89.6 8.6 88.7 8.2 87.8 8 86.8 8 85.8 8 84.8 8.2 83.8 8.6 82.9 9 82 9.5 81.2 10.2 80.5 10.9 79.8 11.7 79.3 12.6 78.9 13.5 78.5 14.5 78.3 15.5 78.3 17.2 78.3 18.8 78.8 20.1 79.9L22 78 22 83.2 16.8 83.2 18.7 81.3C17.7 80.6 16.7 80.2 15.5 80.2 14 80.2 12.7 80.8 11.6 81.9 10.5 83 9.9 84.3 9.9 85.8 9.9 87.3 10.5 88.6 11.6 89.7 12.7 90.8 14 91.3 15.5 91.3 17 91.3 18.3 90.8 19.4 89.7 20.5 88.6 21.1 87.3 21.1 85.8L23 85.8C23 86.8 22.8 87.8 22.4 88.7"></path></g></g></svg>
											</div>
											<div class="trash">
												<svg class="svg-icon-trash" viewBox="0 0 15 18">
													<g>
													<g transform="translate(-80.000000, -75.000000)">
													<path
														d="M90.91 77.73L94.66 77.73C94.75 77.73 94.83 77.76 94.9 77.83 94.97 77.9 95 77.98 95 78.07L95 78.75C95 78.85 94.97 78.93 94.9 79 94.84 79.06 94.76 79.09 94.66 79.09L80.34 79.09C80.24 79.09 80.16 79.06 80.1 79 80.03 78.93 80 78.85 80 78.75L80 78.07C80 77.98 80.03 77.9 80.1 77.83 80.17 77.76 80.25 77.73 80.34 77.73L84.09 77.73 84.09 76.36C84.09 75.99 84.23 75.67 84.49 75.4 84.76 75.13 85.08 75 85.45 75L89.55 75C89.92 75 90.24 75.13 90.51 75.4 90.78 75.67 90.91 75.99 90.91 76.36L90.91 77.73 90.91 77.73 90.91 77.73 90.91 77.73ZM81.36 80.45L93.64 80.45 93.64 91.36C93.64 91.74 93.5 92.06 93.23 92.33 92.97 92.6 92.65 92.74 92.27 92.74L82.73 92.74C82.35 92.74 82.03 92.6 81.77 92.33 81.5 92.06 81.36 91.74 81.36 91.36L81.36 80.45 81.36 80.45 81.36 80.45 81.36 80.45ZM82.73 91.36L84.09 91.36 84.09 81.82 82.73 81.82 82.73 81.82 82.73 91.36 82.73 91.36ZM85.45 77.73L89.55 77.73 89.55 76.36 85.45 76.36 85.45 76.36 85.45 77.73 85.45 77.73ZM85.45 91.36L86.82 91.36 86.82 81.82 85.45 81.82 85.45 81.82 85.45 91.36 85.45 91.36ZM88.18 91.36L89.55 91.36 89.55 81.82 88.18 81.82 88.18 81.82 88.18 91.36 88.18 91.36ZM90.91 91.36L92.27 91.36 92.27 81.82 90.91 81.82 90.91 81.82 90.91 91.36 90.91 91.36Z"></path></g></g></svg>
											</div>
										</div>
										<img src="" class="perfect-fit">
									</figure>
								</div>
								<div class="pics">
									<img src="/images/ajax_loader/fbstyle.gif"
										class="preloader hidden">
								</div>
								<div class="more-photos-cnt">
									<button class="secondary switch-upload-area hidden">Add
										more photos</button>
								</div>
							</div>
							<div class="area-d hidden">
								<div class="container-custom-file-button">
									<p class="grey">Drop your files here</p>
									<input type="button"
										class="multi-line-button grey file secondary"
										value="Select files"><input type="file"
										class="custombutton" name="pics[]" multiple=""><span
										class="tip">JPEG and PNG less than 5Mb.</span>
								</div>
							</div>
						</div>
					</article>
					<article class="error-plc-hld center"></article>
					<article class="center">
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
					<article>
						<div class="profile center">
							<div class="guide-avatar"
								style="background-image: url(https://www.tourradar.com/images/new_layout/Reviews_avatar_guide_p_100x100.png)"></div>
						</div>
						<h2 class="center">
							<span class="first-guide">Enjoyed your tour? You can help
								<span>Italy on a Budget Tours</span> win a TourRadar award by
								asking your fellow travellers to leave a review!
							</span>
						</h2>
						<p class="text center">Share this link with your friends from
							the tour so they can leave a review too.</p>
						<div class="center">
							<div id="sharelnk">https://www.tourradar.com/review/italy-on-a-budget-tours</div>
						</div>
						<div class="center">
							<button class="messenger">
								<p class="fb">
									<svg class="svg-icon-fb-message" viewBox="0 0 12.9598 12.96">
										<g>
										<path
											d="M6.47987616,0 C2.90113313,0 0,2.68628 0,6 C0,7.8882 0.942278638,9.57244 2.41486068,10.67228 L2.41486068,12.96 L4.62119814,11.74908 C5.21002167,11.91208 5.83378019,12 6.47987616,12 C10.0586192,12 12.9597523,9.31376 12.9597523,6 C12.9597523,2.68628 10.0586192,0 6.47987616,0 L6.47987616,0 Z M7.12383901,8.08 L5.47368421,6.32 L2.25386997,8.08 L5.79566563,4.32 L7.48606811,6.08 L10.6656347,4.32 L7.12383901,8.08 L7.12383901,8.08 Z"></path></g></svg>
									Message tour friends on Facebook
								</p>
							</button>
						</div>
						<p class="note center">(We’ll prefill the details of the tour,
							so it’s easier for them)</p>
						<p class="or top20 text center">or</p>
						<div class="center">
							<button class="messenger-email">
								<p class="email">
									<svg class="email-svg" xmlns="http://www.w3.org/2000/svg"
										version="1.1" viewBox="0 0 21 14">
										<g fill-rule="evenodd" fill="none">
										<g transform="translate(-614 -778)" fill="#fff">
										<path
											d="m614.7 779.5c0.6 0.3 8.5 4.5 8.8 4.7s0.7 0.2 1.1 0.2c0.4 0 0.8-0.1 1.1-0.2 0.3-0.2 8.2-4.4 8.8-4.7s1.1-1.5 0.1-1.5h-19.7c-1 0-0.5 1.2 0.1 1.5zm19.9 2.6c-0.6 0.3-8.6 4.5-9 4.7-0.4 0.2-0.7 0.2-1 0.2-0.4 0-0.7 0-1.1-0.2s-8.3-4.4-9-4.7c-0.4-0.2-0.4 0-0.4 0.3v8.5c0 0.5 0.7 1.2 1.2 1.2h18.7c0.5 0 1.2-0.7 1.2-1.2v-8.5c0-0.2 0-0.5-0.4-0.3z"></path></g></g></svg>
									Email to tour friends
								</p>
							</button>
						</div>
					</article>
				</section>
				<section class="wrapper">
					<article>
						<h2>Your Review Helps Others</h2>
						<div class="columns top top20"></div>
						<div class="columns">
							<p class="badgetext">Here's How your Review Helps:</p>
							<p class="badgedesc">Other travellers can read your first
								hand experience of the tour</p>
							<p class="badgedesc">Reviews from you and your tour buddies
								help fellow travellers decide if they should take the trip or
								not</p>
							<p class="badgedesc">Your review helps your guide to compete
								in the Guide of the Year Awards</p>
							<p class="badgedesc">Your review will help Italy on a Budget
								Tours in the Tour of the Year Awards</p>
							<p class="badgedesc">The photos on your review help show what
								a tour is really like</p>
						</div>
					</article>
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
		<div class="hidden">
			<div id="send_popup_review" class="review-page">
				<div class="inside">
					<div>
						<h2>Invite friends to leave a review</h2>
					</div>
					<div class="row">
						<div class="first">
							<input class="text" id="email_to" placeholder="Friend's email"
								type="email">
						</div>
						<div class="svg-cont">
							<a id="add_eml_field" href="#" onclick="return false"
								title="add another email field"><svg class="svg-icon-plus3"
									viewBox="0 0 20 20">
									<g id="svg-icon-plus3">
									<path
										d="m5 1.3c1.5-0.9 3.2-1.3 5-1.3 1.8 0 3.5 0.4 5 1.3 1.5 0.9 2.8 2.1 3.6 3.6 0.9 1.5 1.3 3.2 1.3 5s-0.4 3.5-1.3 5c-0.9 1.5-2.1 2.8-3.6 3.6-1.5 0.9-3.2 1.3-5 1.3-1.8 0-3.5-0.4-5-1.3-1.5-0.9-2.8-2.1-3.6-3.6-0.9-1.5-1.3-3.2-1.3-5s0.4-3.5 1.3-5c0.9-1.5 2.1-2.7 3.6-3.6 0 0-1.5 0.9 0 0zm3.3 3.6v3.4h-3.4v3.4h3.4v3.4h3.4v-3.3h3.4v-3.3h-3.3v-3.4h-3.3z"></path></g></svg></a>
						</div>
					</div>
					<div class="sample hidden">
						<div class="row hidden">
							<div class="first">
								<input class="text" id="email_to" placeholder="Friend's email"
									type="email">
							</div>
							<div class="svg-cont">
								<a id="rm_eml_field" href="#" onclick="return false"
									title="remove email field"><svg class="svg-icon-minus3"
										viewBox="0 0 20 20">
										<g id="svg-icon-minus3">
										<path
											d="m5 1.3c1.5-0.9 3.2-1.3 5-1.3 1.8 0 3.5 0.4 5 1.3 1.5 0.9 2.8 2.1 3.6 3.6 0.9 1.5 1.3 3.2 1.3 5 0 1.8-0.4 3.5-1.3 5-0.9 1.5-2.1 2.8-3.6 3.6-1.5 0.9-3.2 1.3-5 1.3-1.8 0-3.5-0.4-5-1.3-1.5-0.9-2.8-2.1-3.6-3.6-0.9-1.5-1.3-3.2-1.3-5 0-1.8 0.4-3.5 1.3-5 0.9-1.5 2.1-2.7 3.6-3.6 0 0-1.5 0.9 0 0zm0 10.3h10.1v-3.4h-10 0v3.4z"></path></g></svg></a>
							</div>
						</div>
					</div>
					<div class="message-box" contenteditable="true"
						operatorname="Italy on a Budget Tours">
						<p>Hi</p>
						<p>
							I've just left a review for the <span class="tour_name"></span>
							tour we did!
						</p>
						<p>You can add your review too - it only takes 2 minutes to
							complete. With this link the details of our tour will be
							prefilled.</p>
						<p class="link"></p>
						<p class="user_name"></p>
					</div>
					<input type="hidden" id="guideurl"
						value="www.tourradar.com/guide-community"><input
						type="hidden" id="guidename" value=""><input type="hidden"
						id="operatorname" value="Italy on a Budget Tours"><input
						type="hidden" id="guidepic" value=""><input type="hidden"
						id="reviewurl" value="www.tourradar.com/review#-0-0-423673">
					<div class="last">
						<a class="but" href="#" onclick="return false"
							id="send_popup_guide"><span class="title">Send email</span></a>
					</div>
				</div>
			</div>
		</div>
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
	<script type="text/javascript" src="https://apis.google.com/js/plus.js"
		gapi_processed="true"></script>
	<script type="text/javascript"
		src="//cdn.tourradar.com//include/js/responsive.min.js?v=1514557673"
		async=""></script>
	<script
		src="//cdn.tourradar.com/include/pw/responsive/script.v1514879356.min.js"
		async=""></script>
	<script type="text/javascript">
		var IntRespHF = setInterval(function() {
			if (typeof $ == 'function') {
				clearInterval(IntRespHF);
				$(document).ready(function() {
					resp_hf = new RespHF();
					resp_hf.init();
				});
			}
		}, 10);
	</script>
</body>
<link type="text/css" rel="stylesheet"
	href="//cdn.tourradar.com/include/pw/responsive/async.v1514879356.css">
</html>