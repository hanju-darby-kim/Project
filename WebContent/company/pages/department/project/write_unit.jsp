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

	<title>프로젝트 단위 업무 작성</title>

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
					<div class="panel panel-primary">
						<div class="panel-heading">
							<i class="fa fa-bar-chart-o fa-fw"></i> 단위 업무 추가
						</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<form action="/Project/company/pages/department/project/write_unit_go.do" method="post">
								<table id="dev_write" width="100%" class="table table-striped table-bordered table-hover">
									<tr>
										<!-- 자동입력 -->
										<th>담당자</th>
										<td><input type="text" name="emp" id="emp" class="form-control" required readonly /></td>
									</tr>
									<tr>
										<th>프로젝트 설정</th>
										<td>
											<!-- foreach로 현재 진행중인 프로젝트만 불러오기 -->
											<select name="project" id="project" class="form-control">
												<option value=""></option>
												<option value=""></option>
											</select>
										</td>
									</tr>
									<tr>
										<th>설명</th>
										<td><textarea name="content" id="content" class="form-control" rows="10" required></textarea></td>
									</tr>
								</table>
								<div id="btns">
									<input type="button" value="돌아가기" class="btn btn-default" onclick="history.back();"/>
									<input type="submit" value="작성하기" class="btn btn-primary" />
								</div>
							</form>
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
