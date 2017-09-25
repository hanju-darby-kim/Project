<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	h3{
		margin: 0px; margin-top: 15px;
	}
</style>
<script>

</script>
</head>

<body>
	<div id="main">
		<section>
			<c:if test="${result == 1}">
				<script>
					location.href = "/Project/message/inbox.do";
				</script>
			</c:if>
			
			<c:if test="${result == 0}">
				<script>
					history.back();
				</script>
			</c:if>
		</section>
	</div>
</body>
</html>


