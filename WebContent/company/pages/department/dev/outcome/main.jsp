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

	<title>개발부 프로젝트 현황</title>

	<%@ include file="/company/inc/asset_css.jsp" %>

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
                    <h1 class="page-header">개발부 프로젝트 현황</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
			<div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-bar-chart-o fa-fw"></i> Area Chart Example
                            <div class="pull-right">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">
                                        Actions
                                        <span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu pull-right" role="menu">
                                        <li><a href="#">Action</a>
                                        </li>
                                        <li><a href="#">Another action</a>
                                        </li>
                                        <li><a href="#">Something else here</a>
                                        </li>
                                        <li class="divider"></li>
                                        <li><a href="#">Separated link</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div id="morris-area-chart"></div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                    <div class="panel panel-default">
		                <div class="col-lg-12">
		                    <h1 class="page-header">다른 프로젝트 목록</h1>
		                </div>
		                <div class="col-lg-12">
		                    <div class="panel panel-default">
		                        <!-- /.panel-heading -->
		                        <div class="panel-body">
		                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
		                                <thead>
		                                    <tr>
		                                        <th>현황</th>
		                                        <th>주제</th>
		                                        <th>시작일</th>
		                                        <th>종료일</th>
		                                        <th>작성자</th>
		                                    </tr>
		                                </thead>
		                                <tbody>
		                                	<%--  <c:forEach items="" var="">--%>
		                                	<tr>
		                                		<td></td>
		                                		<td></td>
		                                		<td></td>
		                                		<td></td>
		                                		<td></td>
		                                	</tr>
		                                	<%--  </c:forEach>--%>
		                                </tbody>
		                            </table>
		                            <!-- /.table-responsive -->
		                        </div>
		                        <!-- /.panel-body -->
		                    </div>
		                    <!-- /.panel -->
		                </div>
		                <!-- /.col-lg-12 -->
                    </div>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

	<%@ include file="/company/inc/asset_js.jsp" %>

</body>

</html>
