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
			<c:if test="${sresult == 1}">
				<!-- script의 location.href은 Get방식임, 주소표시줄 변경됨 -->
				<script>
					location.href = "/Project/message/inbox.do";
				</script>
				
				<%-- <jsp:forward page=""> 는 Post방식임, 주소표시줄에 변경없음 --%>
				<%-- <jsp:forward page="/message/inbox.do"></jsp:forward> --%>
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


