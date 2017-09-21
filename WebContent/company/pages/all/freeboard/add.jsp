<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Bootstrap Admin Theme</title>

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
	<style>
		#addTable #FBCategory { height: 30px; width: 100px; padding: 5px; }
		#addTable { width: 900px; }
		#addTable td:first-child { border-top: 0px; }
		#addTable input { width: 95%; }
		#addTable #content { width: 95%; height: 500px; }
	</style>
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
                        <h1 class="page-header">글쓰기</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
            <form method="POST" action="/Project/pages/all/freeboard/addok.do">
            <table class="table" id="addTable">
            	<tr>
            		<td>
            			<select name="FBCategory" id="FBCategory" class="form-control">
            				<c:forEach items="${categoryList}" var="category">
							<option>${category.name}</option> 
							</c:forEach>           		
            			</select>
            		</td>
            	</tr>
            	<tr>
	            	<td>
	    				<input type="text" name="title" id="title" class="form-control" placeholder="제목을 입력하세요" required>
	           		</td>
            	</tr>
            	<tr>
            		<td>
            			<textarea name="content" id="content" class="form-control"></textarea>
            		</td>
            	</tr>
            </table>
            </form>
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

