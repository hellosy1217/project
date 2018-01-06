<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html class=" logged">
<head>
<title>후기 게시판 -BlueBalloon</title>
<link
   href="${pageContext.request.contextPath}/resources/user/board/css/list1.css?ver=221"
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

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>

$(document).ready(function(){
   //검색창에 마우스를 올리고 내리면 색 변경되기
   $('.search').mouseover(function(){
      $(this).css('-webkit-text-fill-color','#409cd1');
      $(this).parent().css('color','#409cd1');
   });   
   $('.searchF3').mouseover(function(){
      $(this).css({'border-color':'#409cd1'});
   });
   
   //마우스를 내렸을 때 원상태로
   $('.search2').mouseout(function(){
      $(this).css('-webkit-text-fill-color','#ccc');
      $(this).parent().css('color','#ccc');
   });
   $('.searchF3').mouseout(function(){
      $(this).css({'border-color':'#ddd'});
   });
});

</script>

<link rel="stylesheet" type="text/css"
   href="//cdn.tourradar.com/include/pw/serp/async.v1512994931.css">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
</head>
<body class="tb" data-b-sale="">
   <c:choose>
      <c:when test="${member_num==0}">
         <%@include file="../../header1.jsp"%>
      </c:when>
      <c:otherwise>
         <%@include file="../../header3.jsp"%>
      </c:otherwise>
   </c:choose>
   <main data-id="155404"> <!--   <div class="top">
      <div class="im"
         style="background-image: url('//cdn.tourradar.com/im/r/pw/river/main-c.jpg')"></div>
      <div class="in">
         <h1>여행 후기</h1>         
      </div>

   </div>
 -->

   <div class="header">
      <div class="bgimg bg-all">
         <img src="//cdn.tourradar.com/im/r/pw/river/main-c.jpg"
            alt="Italy Tours and Trips 2018 ">
      </div>
      <div class="c">

         <h1>travel review</h1>
      </div>
   </div>

   <div class="c">
      <div class="list">
         <h2>Best Review</h2>
         <c:forEach var="best" items="${Listmap.bestReview}">
            <div class="item" data-id="163442">
               <a href="board_content?board_num=${best.board_num}">
                  <div class="preview">
                     <img
                        src="https://s3.ap-northeast-2.amazonaws.com/bbproject2017/bb_product${best.pick_num}/${best.board_image}"
                        class="bg lazy">
                     <div class="mask"></div>
                  </div>
                 <div class="circle">
                     <c:choose>
                  <c:when test="${empty myMember.member_str_img}">
                     <img src="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/common/img/person.jpg">
                  </c:when>
                  <c:otherwise>
                     <img src="https://s3.ap-northeast-2.amazonaws.com/bbproject2017/bb_member/${myMember.member_str_img}">
                  </c:otherwise>
               </c:choose>
                  </div>
                  
               </a>
               <div class="description">
                      <div class="info tours">
                               별점 : ${best.board_score}
                     </div>
                     <div class="title">${best.board_title}</div>   
                     <div>
                     	   <c:choose>
           						  <c:when test="${fn:length(best.board_content) > 20}">
										${fn:substring(best.board_content,0,19)}...
           						</c:when>
           						<c:otherwise>
           							${best.board_content} 
           						</c:otherwise> 
          					</c:choose>
                        <a href="board_content?board_num=${best.board_num}">더보기</a>
                   </div>
               </div>
            </div>
         </c:forEach>
      </div>
      <div class="content faq" data-total="16" data-onpage="10">
         <ul>
            <h3 style="display:inline-block;">Review</h3>
            <div style="float:right;">
            	<form name="searchOption" action="board_list" method="get">
            	<div class="searchF3 searchF3_2 search_bar">
            		<i class="fa fa-search searchI searchGryI">
            			<input class="search search2 search2_1" name="keyword" placeholder="검색어를 입력해 주세요." />
            		</i>
         		</div>
         		<a class="but" onclick="searchForm.submit()">검색</a>
         		</form>
         	</div>
            <!-- <p>여기도 뭐 들어갈 건데 일단 보류</p> -->
            <ul>
               <li style="background-color: #fafafa; border-top: 1px solid #ccc;">
                  <table class="qst" width="100%">
                        <tr>
                           <td width="15%">번호</td>
                           <td width="70%" class="title">제목</td>
                           <td>날짜</td>
                        </tr>
                     </table>
               </li>
               <c:forEach var="dto" items="${Listmap.boardList}">
                  <li data-id="5036">
                     <table class="qst" width="100%">
                        <tr>
                           <td width="15%">${dto.board_num}</td>
                           <td width="70%" class="title">
                              <a href="board_content?board_num=${dto.board_num}">${dto.board_title}</a>
                           </td>
                           <td>${dto.board_reg_date}</td>
                        </tr>
                     </table>
                  </li>
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