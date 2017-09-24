<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <%@ include file="/company/pages/attendance/inc/asset.jsp" %>
	<title>Fine Apple</title>
</head>

<style>
.fileBox .fileName {display:inline-block;width:190px;height:30px;padding-left:10px;margin-right:5px;line-height:30px;border:1px solid #aaa;background-color:#fff;vertical-align:middle}
.fileBox .btn_file {display:inline-block;border:1px solid #000;width:100px;height:30px;font-size:0.8em;line-height:30px;text-align:center;vertical-align:middle}
.fileBox input[type="file"] {position:absolute;width:1px;height:1px;padding:0;margin:-1px;overflow:hidden;clip:rect(0,0,0,0);border:0}
</style>


<body>

    <div id="wrapper">


	    <%@ include file="/company/pages/attendance/inc/navigation.jsp" %>


        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">

                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header"><!-- 헤더 --></h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->


<div class="fileBox">
	<input type="text" class="fileName" readonly="readonly">
	<label for="uploadBtn" class="btn_file">찾아보기</label>
	<input type="file" id="uploadBtn" class="uploadBtn">
</div>

           
            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /#page-wrapper -->
    </div>
    <!-- /#wrapper -->

    <%@ include file="/company/pages/attendance/inc/closing.jsp" %>

</body>

<script>
var uploadFile = $('.fileBox .uploadBtn');
uploadFile.on('change', function(){
	if(window.FileReader){
		var filename = $(this)[0].files[0].name;
	} else {
		var filename = $(this).val().split('/').pop().split('\\').pop();
	}
	$(this).siblings('.fileName').val(filename);
});
    </script>


</html>
