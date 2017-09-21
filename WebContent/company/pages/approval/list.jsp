<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>SB Admin 2 - Bootstrap Admin Theme</title>
<style>
#tbl th:nth-child(1) { width: 50px; }
	#tbl th:nth-child(2) { width: 400px; }
	#tbl th:nth-child(3) { width: 80px; }
	#tbl th:nth-child(4) { width: 120px; }
	#tbl th:nth-child(5) { width: 50px; }
	
	#tbl th, #tbl td { text-align: center; }
	#tbl td:nth-child(2) { text-align: left; }
</style>
<script>

</script>
    <!-- Bootstrap Core CSS -->
    <link href="/Project/company/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="/Project/company/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/Project/company/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/Project/company/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            
            <!-- upperHeader -->    
            <%@ include file="/company/inc/upperHeader.jsp" %>
			<!-- leftHeader -->
        	<%@ include file="/company/inc/leftHeader.jsp" %>

            
        </nav>

        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">결재 <small>자유 게시판</small></h1>
                    </div>
                    <!-- /.col-lg-12 -->
                    <!-- 테이블 내용 -->
                    
                    
               
               <table id="tbl" class="table table-striped">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>이름</th>
					<th>날짜</th>
					<th>읽음</th>
				</tr>
				<c:forEach items="${list}" var="dto">
				<tr>
					<td>${dto.seq}</td>
					<td>
						<!-- 글 제목 -->
						
						<span title="${dto.fullSubject}" 
							style="margin-left: ${dto.depth * 25}px;"> <!-- 전체 제목 -->
<%-- 						<c:if test="${dto.depth > 0}">
						<img src="/MVCTest/board/images/re.png">
						</c:if> --%>
						<!-- view.do?seq=5&column=content&word=게시판&isSearch=y -->
							<a href="/MVCTest/board/view.do?seq=${dto.seq}&column=${map.column}&word=${map.word}&isSearch=${map.isSearch}">${dto.subject}</a>
						</span>
						${dto.fileImg}
						<span class="badge">${dto.commentCount}</span>
						${dto.hot} <!-- 인기글 -->
						${dto.gapImg} <!-- 새글 -->
					</td>
					<td>${dto.name}</td>
					<td>${dto.regDate}</td>
					<td>${dto.readCount}</td>
				</tr>
				</c:forEach>
				<c:if test="${list.size() == 0}">
<!-- 				<tr>
					<td colspan="5">현재 게시물이 존재하지 않습니다.</td>
				</tr> -->
				</c:if>
			</table>
                    
                    
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="/Project/company/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/Project/company/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="/Project/company/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="/Project/company/dist/js/sb-admin-2.js"></script>

</body>

</html>
