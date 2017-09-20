<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">

	<title>제목 입력</title>

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
                    <h1 class="page-header">제목</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-3 col-md-6">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-3">
					                <i class="fa fa-comments fa-5x"></i>
					            </div>
					            <div class="col-xs-9 text-right">
					                <div class="huge">26</div>
					                <div>New Comments!</div>
					            </div>
					        </div>
					    </div>
					    <a href="#">
					        <div class="panel-footer">
					            <span class="pull-left">View Details</span>
					            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
					            <div class="clearfix"></div>
					        </div>
					    </a>
					</div>
			    </div>
			    <div class="col-lg-3 col-md-6">
			        <div class="panel panel-green">
			            <div class="panel-heading">
			                <div class="row">
			                    <div class="col-xs-3">
			                        <i class="fa fa-tasks fa-5x"></i>
			                    </div>
			                    <div class="col-xs-9 text-right">
			                        <div class="huge">12</div>
			                        <div>New Tasks!</div>
			                    </div>
			                </div>
			            </div>
			            <a href="#">
			                <div class="panel-footer">
			                    <span class="pull-left">View Details</span>
			                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
			                    <div class="clearfix"></div>
			                </div>
			            </a>
			        </div>
			    </div>
			    <div class="col-lg-3 col-md-6">
			        <div class="panel panel-yellow">
			            <div class="panel-heading">
			                <div class="row">
			                    <div class="col-xs-3">
			                        <i class="fa fa-shopping-cart fa-5x"></i>
			                    </div>
			                    <div class="col-xs-9 text-right">
			                        <div class="huge">124</div>
			                        <div>New Orders!</div>
			                    </div>
			                </div>
			            </div>
			            <a href="#">
			                <div class="panel-footer">
			                    <span class="pull-left">View Details</span>
			                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
			                    <div class="clearfix"></div>
			                </div>
			            </a>
			        </div>
			    </div>
			    <div class="col-lg-3 col-md-6">
			        <div class="panel panel-red">
			            <div class="panel-heading">
			                <div class="row">
			                    <div class="col-xs-3">
			                        <i class="fa fa-support fa-5x"></i>
			                    </div>
			                    <div class="col-xs-9 text-right">
			                        <div class="huge">13</div>
			                        <div>Support Tickets!</div>
			                    </div>
			                </div>
			            </div>
			            <a href="#">
			                <div class="panel-footer">
			                    <span class="pull-left">View Details</span>
			                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
			                    <div class="clearfix"></div>
			                </div>
			            </a>
			        </div>
			    </div>
			</div>
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

	<%@ include file="/company/inc/asset_js.jsp" %>

</body>

</html>
