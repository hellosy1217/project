<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="https://s3.ap-northeast-2.amazonaws.com/hellosy1217.blueballoon/common/css/responsive.min.css" rel="stylesheet" />
<script src="https://unpkg.com/sweetalert2@7.3.0/dist/sweetalert2.all.js"> </script >
<script>
<script type="text/javascript">
function check(){
	if (f.tomail.value==""){
		swal(
				 '이런...',
				 '제목을 입력해주세요!',
				 'error'
				)
		f.tomail.focus()
		return false
	}
	if (f.title.value==""){
		swal(
				 '이런...',
				 '제목을 입력해 주세요!',
				 'error'
				)
		f.title.focus()
		return false
	}
	if (f.content.value==""){
		swal(
				 '이런...',
				 '내용을 입력해 주세요!',
				 'error'
				)
		f.content.focus()
		return false
		}
	}
	return true
}
</script>

<title>메일 보내기</title>
</head>
<body class="c">
<div style="width:900px;margin: 50px 450px;text-align:  center;background: #fafafa;padding:  30px;">
  <h4 style="font-size: 20px; margin-bottom: 20px;">메일 보내기</h4>
  <form action="BB_member_mail" method="post" name="f">
    <div align="center" class="c" style="
"><!-- 받는 사람 이메일 -->
      <input type="text" name="tomail" value="chikachika@gmail.com" class="form-control" style="
    width: 700px;
    padding: 19px;
">
    </div>     
    <div align="center" class="c"><!-- 제목 -->
      <input type="text" name="title" size="120" placeholder="제목을 입력해주세요" class="form-control" style="
    width: 700px;
    padding: 19px;
">
    </div>
    <p>
    </p><div align="center" class="c"><!-- 내용 --> 
      <textarea name="content" cols="120" rows="12" placeholder="내용#" class="form-control" style="
    width: 700px;
    padding: 15px;
"></textarea>
    </div>
    <p>
    </p><div align="center" class="c">
      <input type="submit" value="메일 보내기" class="btn btn-warning" onclick="javascript:check()" style="
    padding: 11px 20px;
    margin-bottom:  20px;
">
      <br><a href="BB_member_list" style="font-size: 15px;">목록으로</a>
    </div>
  </form>
</div>
