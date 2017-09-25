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
	
	<!-- datepicker -->
	<link href="/Project/company/dist/css/datepicker.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<script>
	window.onload =  function() {
		$('#datepicker1, #datepicker2').datepicker({
			 format: "yyyy-mm-dd",
			 language: "kr"
		});
		
		$("#purpose").on("keyup", function() {
			
			//최대 글자 수 넘으면 자르고 알림
			if($(this).val().length > 100) {
				alert("최대 100자까지 입력 가능합니다.");
	            $(this).val($(this).val().substring(0, 100));
	        }

			//입력한 글자 수 출력
			$("#count").html($("#purpose").val().length + " / 100");
		});
		
		
	};
</script>
<style>
	#datepicker { border: 1px solid #ccc; }
	.datepicker-days { letter-spacing: -1px; }
	/* .day.active { background-color: skyblue; } */
	#purpose { resize: none; width: 720px; height: 100px; display: inline; }
	
	#surveyWrapper .short { width: 100px; }
	#surveyWrapper #purpose { float: left; }
	#surveyWrapper #count { margin: 78px 0px 0px 5px; float: left; }
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
                        <h1 class="page-header">설문조사</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
            <div id="surveyWrapper">
            	<table id="tblHeader" class="table table-bordered">
            		<!-- 주제 -->
            		<tr>
            			<th>주제</th>
            			<td><input type="text" maxlength="100" class="form-control" name="subject" id="subject"></td>
            		</tr>
            		<!-- 목적 -->
            		<tr>
            			<th>목적</th>
            			<td>
            				<div>
            					<textarea class="form-control" id="purpose" name="purpose"></textarea>
            					<div id="count" style="border: 1px solid gray;"></div>
            					<div style="clear: both;"></div>
            				</div>
            			</td>
            		</tr>
            		<!-- 시작일 -->
            		<tr>
            			<th>시작일</th>
            			<td><input id="datepicker1" class="datepicker" type="text" name="startDate"></td>	 
            		</tr>
            		<!-- 종료일 -->
            		<tr>
            			<th>종료일</th>
            			<td><input id="datepicker2" class="datepicker" type="text" name="endDate"></td>      		 
            		</tr>
					<tr>
						<th>대상 부서</th>
						<td>
							<select name="targetDepartment" id="targetDepartment" class="form-control short">
								<option value="0">전체</option>
								<c:forEach items="${dlist}" var="list">
								<option value="${list.seq}">${list.department}</option>
								</c:forEach>
							</select>
						</td>
					</tr>
 					<tr>
						<th>대상 직급</th>
						<td>
							<select name="targetPosition" id="targetPosition" class="form-control short">
								<option value="0">전체</option>
								<c:forEach items="${plist}" var="list">
								<option value="${list.seq}">${list.position}</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="checkbox" id="anonymity" name="anonymity" value="y"> <!-- 체크안하면 null -->
	 						<label for="anonymity">익명 조사</label>
	 					</td>
					</tr>
            	</table>
            </div>
            
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
    
    <!-- datepicker -->
	<script src="/Project/company/dist/js/bootstrap-datepicker.js"></script>
	<script src="/Project/company/dist/js/bootstrap-datepicker.kr.js"></script>
	
</body>

</html>
