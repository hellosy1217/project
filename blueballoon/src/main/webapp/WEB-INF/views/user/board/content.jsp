<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
<title>후기 보기 -BlueBalloon</title>
<link
   href="${pageContext.request.contextPath}/resources/user/product/css/content.css?ver=12333"
   rel="stylesheet" />
<link
   href="${pageContext.request.contextPath}/resources/user/board/css/list1.css?ver=125"
   rel="stylesheet" type="text/css" />
<link
   href="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/common/css/async.v1512324069.css"
   rel="stylesheet" />
<link
   href="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/common/css/responsive.min.css"
   rel="stylesheet" />
<link
   href="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/common/css/ttip.min.css"
   rel="stylesheet" />
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<style>
.hide {
   display: none;
}
</style>
<script type="text/javascript"
   src="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/common/js/responsive.min.js"></script>
<script type="text/javascript">
   $(document).ready(function(){
      $('#deleteBut').click(function(){
         var res = confirm('정말 삭제하시겠습니까?');
         
         if(res){
            location.href= 'board_delete?board_num=${map.getBoard.board_num}';
         }
      })

      $('#commentBut').click(function(){
         $("#commentForm").toggleClass("hide");
      })
      
       $('#productBut').click(function(){
         var res = confirm('상품페이지로 이동하시겠습니까?');
         if(res){
            location.href= 'product_content?prod_num=${map.getBoard.prod_num}';
         }
      })
    
       $('#packageBut').click(function(){
         	alart("패키지로 이동하겠습니다.");
         		location.href= 'package_content?pack_num=${map.getBoard.pack_num}'; //패키지 content로 가기
      })
   });
   
   function emailHidden(email){
      var result = email.substr(0,3);
      return result;
   }
</script>
</head>
<body class="reg-page-bg ">
   <div id="content" class="clearfix wrapc ">
      <div class="reg-page sign-up clearfix">
         <%@include file="../../header2.jsp"%>
         <div class="inside" style="margin-top: 30px; opacity: 100;">
            <div class="inside-w">
               <div id="review">
                  <div class="form-title">여행 후기
              	 <c:set var="prodNum" value="${map.getBoard.prod_num}"/>
						<c:choose>
						<c:when test="${prodNum eq '0'}">
							<a class="but" id="packageBut" style="width: 100px; height:45px; float: right;">패키지 보러가기</a>
						</c:when>
						<c:when test="${prodNum ne '0'}">
							<a class="but" id="productBut" style="width: 100px; height:45px; float: right;">상품 보러가기</a>
						</c:when>
						</c:choose>
                  </div>
               </div>
               
               <div>
               		<div>
               			<img
                        src="https://s3.ap-northeast-2.amazonaws.com/bbproject2017/bb_product${map.prod_pick}/${map.str_img}"
                        >
               		</div>
               </div>
               
               <div class="bbox">
               <div class="circle">
                     <c:choose>
                  <c:when test="${empty myMember.member_str_img}">
                     <img src="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/common/img/person.jpg">
                  </c:when>
                  <c:otherwise>
                     <img src="https://s3.ap-northeast-2.amazonaws.com/bbproject2017/bb_member/${myMember.member_str_img}">
                  </c:otherwise>
               </c:choose>
               <p>${map.memberName}</p>
                     </div>
                  <table border="0" width="84%" style="margin-top:10px;">
                     <tr>
                        <td
                           style="font-weight: bold; font-size:18px; color:#3a3a3a;">${map.getBoard.board_title}</td>
                        <td class="date">
                        	<span style="padding-right:5px;">${map.getBoard.board_reg_date}</span>
                        </td>

                     </tr>
                     <tr>
                        <td colspan="2" nowrap height="auto"
                           style="font-size: 15px; padding: 17px 0 8px; color: #464646; width:611px;">
                           ${map.getBoard.board_content}
                        </td>
                     </tr>
                     
                     <c:if test="${map.existImg ne 'N'}">
                     <tr style="padding-left: 20px;">
                        <td style="padding: 20px;"><img
                           src="https://s3.ap-northeast-2.amazonaws.com/bbproject2017/bb_board/${map.getBoard.board_str_img}" style="width:450px;height: 260px; "/></td>
                     </tr>
                     </c:if>
                     <tr>
                        <td>
                           
                           <div class="blike">
                              <a href="board_likecount?board_num=${map.getBoard.board_num}">
                                 <i class="fa fa-thumbs-o-up like_icon"></i> 
                              </a>
                              <span>${map.getBoard.board_likecount}</span>    
                           </div> 
                           <div class="rcount">
                           	<i class="fa fa-eye eye_icon" aria-hidden="true"></i>
                           	<span>${map.getBoard.board_readcount}</span>
                           </div>
                           
                        </td>
                        <td style="float: right;">
                        	<a class="but" id="commentBut" style="width: 100px; padding-bottom: 10px;">댓글 쓰기</a>
                           <c:if test="${map.memberEmail == map.getBoard.member_email}">
                              <a class="but" id="editBut" href="board_update?board_num=${map.getBoard.board_num}" 
                                 style="width: 65px; margin-top: 15px; margin-right: 4px">글수정</a>
                              <a class="but" id="deleteBut" style="width: 65px; margin-top: 15px; margin-right: 4px">글삭제</a>
                           </c:if>
                        </td>
                     </tr>
                  </table>
                  <br>
                  <div class="hide" id="commentForm">
                  <table border="0" width="100%" >
                     <c:forEach var="cdto" items="${map.getCommentList}">
                        <tr>
                           <td style="font-weight: bold; font-size: 16px; padding-left: 20px;">${cdto.member_email}</td>
                        </tr>
                        <tr>
                           <td style="font-size: 15px; padding-left: 20px;">${cdto.comment_content}</td>
                        </tr>
                        <tr style="border-bottom: 1px solid #7E7E7E;">
                           <td style="font-size: 15px; padding-left: 20px;">${cdto.comment_reg_date}</td>
                           <c:if test="${map.memberEmail == cdto.member_email}">
                           <td style="float:right;"><a class="but" id="deleteComment" href="comment_delete?comment_num=${cdto.comment_num}" style="width: 65px; margin-right: 4px">삭제</a></td>
                           </c:if>
                        </tr>
                     </c:forEach>
                     </table>
                     <br>
                     <form name="comment1" action="comment_write" method="post">
                        <table border="0" width="100%">
                           <tr style="border-top: 0.5px solid #A6A6A6;">
                              <td><input type="hidden" name="board_num" value="${map.getBoard.board_num}"> 
                                 <textarea name="comment_content" rows="4" style="width: 100%; margin-bottom: 0;"
                                    placeholder="댓글을 달아주세요"></textarea>
                                 </td>
                           </tr>
                           <tr style="border-bottom: 0.5px solid #A6A6A6;">
                              <td style="float: right;">
                              <a class="but" style="width: 90px;" onclick="comment1.submit()">댓글 등록</a>
                              </td>
                           </tr>
                        </table>
                     </form>
                  </div>
                  <div></div>
               </div>
            </div>
         </div>
      </div>
   </div>
   <script type="text/javascript">
      var js_params = {
         "RegistrationType" : "sign_up"
      };
      var IntRespApp = setInterval(function() {
         if (typeof $ == 'function') {
            clearInterval(IntRespApp);
            $(document).ready(function() {
               new RespRegistration(js_params).init();
            });
         }
      }, 10);
   </script>
   <script type="text/javascript" src="https://apis.google.com/js/plus.js"
      gapi_processed="true"></script>
</body>

</html>