<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>

	<%@ include file="/company/pages/attendance/inc/asset.jsp" %>
	<title>SB Admin 2 - Bootstrap Admin Theme</title>

</head>

<style>

/* 카테고리 옵션 */
#category {
	width: 10%;
	text-align-last: center;
	float: left;
	margin-right: 20px;
}
/* 제목입력 폼 옵션 */
#subject {
	width: 70%;
	margin-bottom: 20px;
	display: inline;
}

/* / * 첨부파일 옆에, 파일필드 숨기기 * /
	.filebox input[type="file"] {
		position: absolute; 
		width: 1px; 
		height: 1px;
		padding: 0; 
		margin: -1px; 
		overflow: hidden;
		clip:rect(0,0,0,0);
		border: 0; 
	} */

/* 첨부파일 추가 버튼 */
#addFile {
	display: inline;
	float: right;
}
/* 첨부파일 목록 박스 */
#file-div {
	margin-top: 20px;
}




</style>








<body>

    <div id="wrapper">
    
		<%@ include file="/company/pages/attendance/inc/navigation.jsp" %>

            

        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
               <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header"></h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
                
           <!-- 카테고리, 제목, 첨부파일 추가 -->
           <div class="row">
				<select class="form-control" name="category" id="category">
				    <option>일반</option>
				    <option>질문</option>
				    <option>건의</option>
				    <option>공지</option>
				</select>           
				<input class="form-control" placeholder="게시글 제목을 입력하세요" name="subject" id="subject">
				
			
           </div>
			<!-- /.row -->           
			
			
			
			
			
			
			<!-- 에디터 -->
	       <div class="row">
				<%@ include file="/company/pages/attendance/inc/bbsEditor.jsp" %>
           </div>
      
          
	       </div>
	       <!-- /.container-fluid -->


     
        </div>
        <!-- /#page-wrapper -->
    </div>
    <!-- /#wrapper -->
    
	<%@ include file="/company/pages/attendance/inc/closing.jsp" %> 
    

</body>

<!-- 에디터를 클릭하면, 자동 포커스 -->
<script>
	$('#editor').click(function() { $('#editor > div.ql-editor.ql-blank').focus(); });
	$('#editor').click(function() { $('#editor > div.ql-editor').focus(); });
</script>



</html>
