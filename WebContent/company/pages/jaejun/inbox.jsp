<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% session.setAttribute("num", 55); %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>Message | Fine Apple</title>
<style>
	#table th:NTH-CHILD(1) { width: 30px; }
	#table th:NTH-CHILD(2) { width: 520px; }
	#table th:NTH-CHILD(3) { width: 100px; }
	#table th:NTH-CHILD(4) { width: 134px; }
	#table th:NTH-CHILD(5) { width: 135px; }
	#table td, #table th {
		text-align: center;
	}
	#table tr td:NTH-CHILD(2) {
		text-align: left;
	}
	
	#headerInbox {
		border: 0px solid red;
		vertical-align: middle;
	}
	.btns {
		border: 0px solid red;
		margin: 0px 15px;
		display: inline;
		float: right;
	}
</style>
    <!-- Bootstrap Core CSS -->
    <link href="/Project/company/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="/Project/company/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="/Project/company/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="/Project/company/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">

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

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    
<script>

function MsgboxMove() {
	if ($(MsgboxSel).val() == 1){
		location.href="/Project/message/inbox.do";
	} else if ($(MsgboxSel).val() == 2) {
		location.href="/Project/message/inboxsent.do";
	} else if ($(MsgboxSel).val() == 3) {
		location.href="/Project/message/inboxsave.do";
	}
}

var cbAll, cbs;
var btnSend;

window.onload = function(){
	cbAll = document.all.cbAll;
	cbs = document.all.cbs;
	btnSend = document.all.btnSend;
		
	cbAll.onchange = function(){
		if(cbAll.checked) {
			//전부 체크
			for(var i=0; i<cbs.length; i++) {
				cbs[i].checked = true;
			}
		} else {
			//전부 해제
			for(var i=0; i<cbs.length; i++) {
				cbs[i].checked = false;
			}
		}
	};
}

</script>
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

        <div id="page-wrapper">
            <div class="row">
                <div id="headerInbox" class="col-lg-12">
                    <h1 class="page-header">받은쪽지함</h1>
                <!-- /.col-lg-12 -->
	            </div>
            </div>
            <!-- /.row -->
            
            <div class="row" style="position: relative;">
            	<div style="position: absolute; top: -60px; left: 730px;">
            		<select name="MsgboxSel" id="MsgboxSel" style="height: 30px;">
            			<option value="1" selected="selected">받은쪽지함</option>
            			<option value="2">보낸쪽지함</option>
						<option value="3">쪽지보관함</option>
            		</select>
            		<input type="button" value="이동하기" style="height: 30px;" onclick="MsgboxMove();"/>
            	</div>
            </div>
            <!-- /.row -->
            
            <div class="row">
                <div class="col-lg-12">
	            	<div style="color: #2F73C0; margin-bottom: 10px;">* 쪽지는 100일 후 자동 삭제됩니다. 중요한 쪽지는 보관함에 저장하세요.</div> 
	                <table width="100%" id="table" class="table table-striped table-bordered table-hover" id="dataTables-example">
	                    <thead>
	                        <tr>
	                            <th><input type="checkbox" name="cbAll" /></th>
	                            <th>제목</th>
	                            <th>보낸이</th>
	                            <th>받은시간</th>
	                            <th>읽은시간</th>
	                        </tr>
	                    </thead>
	                    <tbody>
	                    	<c:forEach items="${list}" var="dto">
	                        <tr class="odd">
	                            <td><input type="checkbox" name="cbs" /></td>
	                            <td>${dto.title}</td>
	                            <td>보낸이추가</td>
	                            <td>${dto.sentDate}</td>
	                            <td>읽은시간추가</td>
	                        </tr>
	                        </c:forEach>
	                    </tbody>
	                </table>
                </div>
                
                <div class="btns" style="float: left;">
	            	<input type="button" class="btn btn-success" value="보관하기" onclick="location.href='/Project/message/save.do';"/>
		            <input type="button" class="btn btn-danger" value="삭제하기" onclick="location.href='/Project/message/del.do';"/>
		        </div>
		        
	            <div class="btns" style="float: right;">		            
		            <input type="button" class="btn btn-info" value="쪽지쓰기" onclick="location.href='/Project/message/add.do';"/>
		            <input type="button" class="btn btn-default" value="환경설정" onclick="location.href='/Project/message/setting.do';"/>
		        </div>
		           
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            
            
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

    <!-- DataTables JavaScript, 여기에 페이지 다 있음 -->
    <script src="/Project/company/vendor/datatables/js/jquery.dataTables.js"></script>
    <script src="/Project/company/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
    <script src="/Project/company/vendor/datatables-responsive/dataTables.responsive.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="/Project/company/dist/js/sb-admin-2.js"></script>

    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
    <script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
            responsive: true
        });
    });
    </script>




</body>

</html>