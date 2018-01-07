<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/common/css/responsive.min.css" rel="stylesheet" />
<title>메일 보내기</title>
</head>
<body>
<div align="center">
  <h4>메일 보내기</h4>
  <form action="BB_member_mail" method="post">
    <div align="center"><!-- 받는 사람 이메일 -->
      <input type="text" name="tomail" size="120" style="width:100%" value="${email}" class="form-control" >
    </div>     
    <div align="center"><!-- 제목 -->
      <input type="text" name="title" size="120" style="width:100%" placeholder="제목을 입력해주세요" class="form-control" >
    </div>
    <p>
    <div align="center"><!-- 내용 --> 
      <textarea name="content" cols="120" rows="12" style="width:100%; resize:none" placeholder="내용#" class="form-control"></textarea>
    </div>
    <p>
    <div align="center">
      <input type="submit" value="메일 보내기" class="btn btn-warning">
      <br><a href="BB_member_list">목록으로</a>
    </div>
  </form>
</div>
