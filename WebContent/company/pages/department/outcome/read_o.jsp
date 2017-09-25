<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">

	<title>비용청구 확인</title>
	
	<%@ include file="/company/inc/asset_css.jsp" %>
	<%@ include file="/company/inc/asset_js.jsp" %>
	<link href="/Project/company/dist/css/department.css" rel="stylesheet">

</head>

<body>

	<div id="wrapper">
		<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
		<!-- uppderHeader -->
		<%@ include file="/company/inc/upperHeader.jsp" %>

		<%@ include file="/company/inc/leftHeader.jsp" %>
		</nav>

		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header"></h1>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-warning">
						<div class="panel-heading">
							<i class="fa fa-bar-chart-o fa-fw"></i> 비용청구서
						</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<table id="dev_write" width="100%" class="table table-striped table-bordered table-hover">
								<tr>
									<th>번호</th>
									<td>${dto.seq}</td>
								</tr>
								<tr>
									<th>작성자</th>
									<td>${dto.empSeq}</td>
								</tr>
								<tr>
									<th>분류</th>
									<td>${dto.cSeq}</td>
								</tr>
								<tr>
									<th>작성일</th>
									<td>${dto.regDate}</td>
								</tr>
								<tr>
									<th>설명</th>
									<td>${dto.content}</td>
								</tr>
								<tr>
									<th>금액</th>
									<td>${dto.amount}</td>
								</tr>
								<tr>
									<th>청구현황</th>
									<td>${dto.etc}</td>
								</tr>
								<tr>
									<th>최종승인일</th>
									<td>${dto.conDate}</td>
								</tr>
							</table>
							<div id="btns">
								<c:if test="${dto.etc == '부서장 대기' && positionSeq == 2}">
								<!-- 부장일때만 나타남 -->
									<form action="/Project/company/pages/department/read_c.do" method="post">
										<button type="submit" id="confirm" name="confirm" value="no" class="btn btn-danger btn-confirm">반려하기</button>
										<button type="submit" id="confirm" name="confirm" value="yes" class="btn btn-primary btn-confirm">승인하기</button>
										<input type="hidden" id="seq" name="seq" value="${dto.seq}" />
									</form>
								</c:if>
								<input type="button" value="돌아가기" class="btn btn-default" onclick="history.back();"/>
							</div>
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /#page-wrapper -->
	</div>
	<!-- /#wrapper -->

</body>

</html>
