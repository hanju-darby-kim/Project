<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <%@ include file="/company/pages/attendance/inc/asset.jsp" %>
	<title>SB Admin 2 - Bootstrap Admin Theme</title>
</head>

<style>
	
	/* 테이블의 내부여백을 줄여서, 결과적으로 전체 덩치를 줄인다. */
	.table-responsive .table, .panel-body {
		margin-bottom:0px; margin-top:0px;	/* 상하마진 0 */
		padding-bottom:0px; padding-top:0px;	/* 상하패딩 0 */
	}
	/* 주간 인기글, 월간 인기글의 너비를 50%로 줄인다. */
	.head-board, .col-lg-6 {
		min-width:50%;
		width: 50%;
		display: inline;
		
	
	}
	
	.head-board {
	}
	
	/* 테이블 헤더의 텍스트와, '제목' 컬럼을 중앙정렬 */
	.panel-heading {
	
	
	}


</style>

<script>


</script>

<body>

    <div id="wrapper">


	    <%@ include file="/company/pages/attendance/inc/navigation.jsp" %>


        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">

                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header" style="border-margin:0px;"></h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->

				<div class="row" id="head-board">
					<!-- 주간인기글 테이블 -->
					<div class="col-lg-6 head-board">
						<div class="panel panel-default">
							<div class="panel-heading text-center">주간 인기글asdf</div>
							<!-- /.panel-heading -->
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table">
										<thead>
											<tr>
												<th>분류</th>
												<th>작성자</th>
												<th class="text-center">제목</th>
												<th>갱신</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>일반</td>
												<td>김선영</td>
												<td>연차 알차게 쓰는 방법(feat.여행)</td>
												<td>15:31</td>
											</tr>
											<tr>
												<td>일반</td>
												<td>이해나</td>
												<td>코무합니다. 귀여운 고양이ㅎㅎ</td>
												<td>01:27</td>
											</tr>
											<tr>
												<td>일반</td>
												<td>박세인</td>
												<td>노곤해지는 점심, 짧은 유머 하나..</td>
												<td>14:03</td>
											</tr>
										</tbody>
									</table>
								</div>
								<!-- /.table-responsive -->
							</div>
							<!-- /.panel-body -->
						</div>
						<!-- /.panel -->
					</div>
					<!-- /.col-lg-6 -->
					<!-- 월간인기글 테이블 -->
					<div class="col-lg-6 head-board" >
						<div class="panel panel-default">
							<div class="panel-heading text-center">월간 인기글</div>
							<!-- /.panel-heading -->
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table">
										<thead>
											<tr>
												<th>분류</th>
												<th>작성자</th>
												<th class="text-center">제목</th>
												<th>갱신</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>질문</td>
												<td>심재준</td>
												<td>쌍용홈페이지는 대체 왜 이 모양..</td>
												<td>09-11</td>
											</tr>
											<tr>
												<td>건의</td>
												<td>박의영</td>
												<td>특근 식비에 대한 개선안</td>
												<td>09-19</td>
											</tr>
											<tr>
												<td>질문</td>
												<td>장윤하</td>
												<td>하루 지각하면 월급 얼마나 깎..</td>
												<td>09-15</td>
											</tr>
										</tbody>
									</table>
								</div>
								<!-- /.table-responsive -->
							</div>
							<!-- /.panel-body -->
						</div>
						<!-- /.panel -->
					</div>
					<!-- /.col-lg-6 -->
				</div>
				<!-- /.rows -->


			</div>
            <!-- /.container-fluid -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <%@ include file="/company/pages/attendance/inc/closing.jsp" %>

</body>

</html>
