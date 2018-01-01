<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://unpkg.com/sweetalert2@7.3.0/dist/sweetalert2.all.js"> </script >
<script type="text/javascript">
	swal("${title}","${msg}","${type}")
	location.href="${url}"
</script>