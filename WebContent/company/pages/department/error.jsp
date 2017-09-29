<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/company/inc/asset_js.jsp" %>
<title>오류 페이지</title>
</head>

<script>
	$(document).ready(function() {
		$.alert("${msg}");		
    location.href=history.back();
	}
</script>
<body>
<!-- 스크립트로 가져온 alert(confirm 창)을 띄우고 index로 돌아갈지 이전페이지로 돌아갈지 확인하고 보내줌 -->
</body>
</html>