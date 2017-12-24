<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
<title>후기 보기 - BlueBalloon</title>
<link
	href="${pageContext.request.contextPath}/resources/member/css/join1.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/member/css/join2.css"
	rel="stylesheet" />
<link
	href="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/common/css/async.v1512324069.css"
	rel="stylesheet" />
<link
	href="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/common/css/responsive.min.css"
	rel="stylesheet" />
<link
	href="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/common/css/ttip.min.css"
	rel="stylesheet" />
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
	});
</script>	
</head>
<body class="reg-page-bg ">
	<div id="content" class="clearfix wrapc ">
		<div class="reg-page sign-up clearfix">
			<%@include file="../../header2.jsp"%>
			<div class="inside" style="margin-top: 30px; opacity: 100;">
				<div class="inside-w" style="min-width: 600px;">
					<div id="review">
						<div class="form-title">여행 후기</div>
					</div>
					<div>
						<table border="0" width="100%">
							<tr style="border-bottom: 1px solid black;">
								<td>${map.getBoard.board_title}</td>
								<td style="float: right;">조회수 : ${map.getBoard.board_readcount}/날짜 : ${map.getBoard.board_reg_date}</td>
							</tr>
							<tr style="border-bottom: 1px solid black;">
								<td colspan="2" style="float: right;">좋아요 수 : ${map.getBoard.board_likecount} / ${map.memberName}</td>
							</tr>
							<tr style="border-bottom: 1px solid black;">
								<td colspan="2">${map.getBoard.board_content}</td>
							</tr>
							<tr style="border-bottom: 1px solid black;">
								<c:forEach var="img" items="${map.getImage}">
									<td colspan="2">${img.org_img}</td>
								</c:forEach>
							</tr>
							<tr>
								<td colspan="2" align="right" style="float:right;">
									<input type="button" value="좋아요"
										onclick="window.location='board_likecount?board_num=${map.getBoard.board_num}'">
									<input type="button" value="글목록" 
										onclick="window.location='board_list'">
									<c:if test="${map.memberEmail == map.getBoard.member_email}">
									<input type="button" value="글수정"
										onclick="window.location='board_update?board_num=${map.getBoard.board_num}'">
									<input type="button" value="글삭제" id="deleteBut">
									</c:if>
								</td>
							</tr>
						</table>
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