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

	/* 주간, 월간 인기글 게시판의 너비를 줄여 한 줄에 나타나도록 한다.*/
	.head-board {
	width:50%;
	float:left;
	}
	#head-board-left {padding-left:0px; padding-right:10px;}
	#head-board-right {padding-left:10px; padding-right:0px;}
	
	/* 메인 게시판의 양옆 패딩을 제거. */
	#center-board {padding-left:0px; padding-right:0px;}
	#center-panel-heading {padding-bottom:15px; padding-top:15px;}
	
	
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
                        <h1 class="page-header" style="border-margin:0px; border:0px;"></h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->

				<div class="row" id="head-board">
					<!-- 주간인기글 테이블 -->
					<div class="col-lg-6 head-board" id="head-board-left">
						<div class="panel panel-default">
							<div class="panel-heading text-center">주간 인기글</div>
							<!-- /.panel-heading -->
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table">
										<thead>
											<tr>
												<th>분류</th>
												<th class="text-center">제목</th>
												<th>갱신</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>일반</td>
												<td>연차 알차게 쓰는 방법(feat.여행)</td>
												<td>15:31</td>
											</tr>
											<tr>
												<td>일반</td>
												<td>코무합니다. 귀여운 고양이ㅎㅎ</td>
												<td>01:27</td>
											</tr>
											<tr>
												<td>일반</td>
												<td>노곤해지는 점심, 짧은 유머 하나올려봐요</td>
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
					<div class="col-lg-6 head-board" id="head-board-right">
						<div class="panel panel-default">
							<div class="panel-heading text-center">최근에 <p class="text-primary">답변</p>을 받은 </div>
							<!-- /.panel-heading -->
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table">
										<thead>
											<tr>
												<th>분류</th>
												<th class="text-center">제목</th>
												<th>갱신</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>질문</td>
												<td>쌍용홈페이지는 대체 왜 이 모양이죠?</td>
												<td>09-11</td>
											</tr>
											<tr>
												<td>건의</td>
												<td>특근 식비에 대한 개선안</td>
												<td>09-19</td>
											</tr>
											<tr>
												<td>질문</td>
												<td>하루 지각하면 월급 얼마나 깎여요?</td>
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

				<div class="row">
					<div class="col-lg-12" id="center-board">
						<div class="panel panel-default">
							<div class="panel-heading text-center">자유게시판</div>
							<!-- /.panel-heading -->
							<div class="panel-body" id="center-panel-heading">
								<table width="100%"
									class="table table-striped table-bordered table-hover"
									id="dataTables-example">
									<thead>
										<tr>
											<th>Rendering engine</th>
											<th>Browser</th>
											<th>Platform(s)</th>
											<th>Engine version</th>
											<th>CSS grade</th>
										</tr>
									</thead>
									<tbody>
										<tr class="odd gradeX">
											<td>Trident</td>
											<td>Internet Explorer 4.0</td>
											<td>Win 95+</td>
											<td class="center">4</td>
											<td class="center">X</td>
										</tr>
										<tr class="even gradeC">
											<td>Trident</td>
											<td>Internet Explorer 5.0</td>
											<td>Win 95+</td>
											<td class="center">5</td>
											<td class="center">C</td>
										</tr>
										<tr class="odd gradeA">
											<td>Trident</td>
											<td>Internet Explorer 5.5</td>
											<td>Win 95+</td>
											<td class="center">5.5</td>
											<td class="center">A</td>
										</tr>
										<tr class="even gradeA">
											<td>Trident</td>
											<td>Internet Explorer 6</td>
											<td>Win 98+</td>
											<td class="center">6</td>
											<td class="center">A</td>
										</tr>
										<tr class="odd gradeA">
											<td>Trident</td>
											<td>Internet Explorer 7</td>
											<td>Win XP SP2+</td>
											<td class="center">7</td>
											<td class="center">A</td>
										</tr>
										<tr class="even gradeA">
											<td>Trident</td>
											<td>AOL browser (AOL desktop)</td>
											<td>Win XP</td>
											<td class="center">6</td>
											<td class="center">A</td>
										</tr>
										<tr class="gradeA">
											<td>Gecko</td>
											<td>Firefox 1.0</td>
											<td>Win 98+ / OSX.2+</td>
											<td class="center">1.7</td>
											<td class="center">A</td>
										</tr>
										<tr class="gradeA">
											<td>Gecko</td>
											<td>Firefox 1.5</td>
											<td>Win 98+ / OSX.2+</td>
											<td class="center">1.8</td>
											<td class="center">A</td>
										</tr>
										<tr class="gradeA">
											<td>Gecko</td>
											<td>Firefox 2.0</td>
											<td>Win 98+ / OSX.2+</td>
											<td class="center">1.8</td>
											<td class="center">A</td>
										</tr>
										<tr class="gradeA">
											<td>Gecko</td>
											<td>Firefox 3.0</td>
											<td>Win 2k+ / OSX.3+</td>
											<td class="center">1.9</td>
											<td class="center">A</td>
										</tr>
										<tr class="gradeA">
											<td>Gecko</td>
											<td>Camino 1.0</td>
											<td>OSX.2+</td>
											<td class="center">1.8</td>
											<td class="center">A</td>
										</tr>
										<tr class="gradeA">
											<td>Gecko</td>
											<td>Camino 1.5</td>
											<td>OSX.3+</td>
											<td class="center">1.8</td>
											<td class="center">A</td>
										</tr>
										<tr class="gradeA">
											<td>Gecko</td>
											<td>Netscape 7.2</td>
											<td>Win 95+ / Mac OS 8.6-9.2</td>
											<td class="center">1.7</td>
											<td class="center">A</td>
										</tr>
										<tr class="gradeA">
											<td>Gecko</td>
											<td>Netscape Browser 8</td>
											<td>Win 98SE+</td>
											<td class="center">1.7</td>
											<td class="center">A</td>
										</tr>
										<tr class="gradeA">
											<td>Gecko</td>
											<td>Netscape Navigator 9</td>
											<td>Win 98+ / OSX.2+</td>
											<td class="center">1.8</td>
											<td class="center">A</td>
										</tr>
										<tr class="gradeA">
											<td>Gecko</td>
											<td>Mozilla 1.0</td>
											<td>Win 95+ / OSX.1+</td>
											<td class="center">1</td>
											<td class="center">A</td>
										</tr>
										<tr class="gradeA">
											<td>Gecko</td>
											<td>Mozilla 1.1</td>
											<td>Win 95+ / OSX.1+</td>
											<td class="center">1.1</td>
											<td class="center">A</td>
										</tr>
										<tr class="gradeA">
											<td>Gecko</td>
											<td>Mozilla 1.2</td>
											<td>Win 95+ / OSX.1+</td>
											<td class="center">1.2</td>
											<td class="center">A</td>
										</tr>
										<tr class="gradeA">
											<td>Gecko</td>
											<td>Mozilla 1.3</td>
											<td>Win 95+ / OSX.1+</td>
											<td class="center">1.3</td>
											<td class="center">A</td>
										</tr>
										<tr class="gradeA">
											<td>Gecko</td>
											<td>Mozilla 1.4</td>
											<td>Win 95+ / OSX.1+</td>
											<td class="center">1.4</td>
											<td class="center">A</td>
										</tr>
										<tr class="gradeA">
											<td>Gecko</td>
											<td>Mozilla 1.5</td>
											<td>Win 95+ / OSX.1+</td>
											<td class="center">1.5</td>
											<td class="center">A</td>
										</tr>
										<tr class="gradeA">
											<td>Gecko</td>
											<td>Mozilla 1.6</td>
											<td>Win 95+ / OSX.1+</td>
											<td class="center">1.6</td>
											<td class="center">A</td>
										</tr>
										<tr class="gradeA">
											<td>Gecko</td>
											<td>Mozilla 1.7</td>
											<td>Win 98+ / OSX.1+</td>
											<td class="center">1.7</td>
											<td class="center">A</td>
										</tr>
										<tr class="gradeA">
											<td>Gecko</td>
											<td>Mozilla 1.8</td>
											<td>Win 98+ / OSX.1+</td>
											<td class="center">1.8</td>
											<td class="center">A</td>
										</tr>
										<tr class="gradeA">
											<td>Gecko</td>
											<td>Seamonkey 1.1</td>
											<td>Win 98+ / OSX.2+</td>
											<td class="center">1.8</td>
											<td class="center">A</td>
										</tr>
										<tr class="gradeA">
											<td>Gecko</td>
											<td>Epiphany 2.20</td>
											<td>Gnome</td>
											<td class="center">1.8</td>
											<td class="center">A</td>
										</tr>
										<tr class="gradeA">
											<td>Webkit</td>
											<td>Safari 1.2</td>
											<td>OSX.3</td>
											<td class="center">125.5</td>
											<td class="center">A</td>
										</tr>
										<tr class="gradeA">
											<td>Webkit</td>
											<td>Safari 1.3</td>
											<td>OSX.3</td>
											<td class="center">312.8</td>
											<td class="center">A</td>
										</tr>
										<tr class="gradeA">
											<td>Webkit</td>
											<td>Safari 2.0</td>
											<td>OSX.4+</td>
											<td class="center">419.3</td>
											<td class="center">A</td>
										</tr>
										<tr class="gradeA">
											<td>Webkit</td>
											<td>Safari 3.0</td>
											<td>OSX.4+</td>
											<td class="center">522.1</td>
											<td class="center">A</td>
										</tr>
										<tr class="gradeA">
											<td>Webkit</td>
											<td>OmniWeb 5.5</td>
											<td>OSX.4+</td>
											<td class="center">420</td>
											<td class="center">A</td>
										</tr>
										<tr class="gradeA">
											<td>Webkit</td>
											<td>iPod Touch / iPhone</td>
											<td>iPod</td>
											<td class="center">420.1</td>
											<td class="center">A</td>
										</tr>
										<tr class="gradeA">
											<td>Webkit</td>
											<td>S60</td>
											<td>S60</td>
											<td class="center">413</td>
											<td class="center">A</td>
										</tr>
										<tr class="gradeA">
											<td>Presto</td>
											<td>Opera 7.0</td>
											<td>Win 95+ / OSX.1+</td>
											<td class="center">-</td>
											<td class="center">A</td>
										</tr>
										<tr class="gradeA">
											<td>Presto</td>
											<td>Opera 7.5</td>
											<td>Win 95+ / OSX.2+</td>
											<td class="center">-</td>
											<td class="center">A</td>
										</tr>
										<tr class="gradeA">
											<td>Presto</td>
											<td>Opera 8.0</td>
											<td>Win 95+ / OSX.2+</td>
											<td class="center">-</td>
											<td class="center">A</td>
										</tr>
										<tr class="gradeA">
											<td>Presto</td>
											<td>Opera 8.5</td>
											<td>Win 95+ / OSX.2+</td>
											<td class="center">-</td>
											<td class="center">A</td>
										</tr>
										<tr class="gradeA">
											<td>Presto</td>
											<td>Opera 9.0</td>
											<td>Win 95+ / OSX.3+</td>
											<td class="center">-</td>
											<td class="center">A</td>
										</tr>
										<tr class="gradeA">
											<td>Presto</td>
											<td>Opera 9.2</td>
											<td>Win 88+ / OSX.3+</td>
											<td class="center">-</td>
											<td class="center">A</td>
										</tr>
										<tr class="gradeA">
											<td>Presto</td>
											<td>Opera 9.5</td>
											<td>Win 88+ / OSX.3+</td>
											<td class="center">-</td>
											<td class="center">A</td>
										</tr>
										<tr class="gradeA">
											<td>Presto</td>
											<td>Opera for Wii</td>
											<td>Wii</td>
											<td class="center">-</td>
											<td class="center">A</td>
										</tr>
										<tr class="gradeA">
											<td>Presto</td>
											<td>Nokia N800</td>
											<td>N800</td>
											<td class="center">-</td>
											<td class="center">A</td>
										</tr>
										<tr class="gradeA">
											<td>Presto</td>
											<td>Nintendo DS browser</td>
											<td>Nintendo DS</td>
											<td class="center">8.5</td>
											<td class="center">C/A<sup>1</sup>
											</td>
										</tr>
										<tr class="gradeC">
											<td>KHTML</td>
											<td>Konqureror 3.1</td>
											<td>KDE 3.1</td>
											<td class="center">3.1</td>
											<td class="center">C</td>
										</tr>
										<tr class="gradeA">
											<td>KHTML</td>
											<td>Konqureror 3.3</td>
											<td>KDE 3.3</td>
											<td class="center">3.3</td>
											<td class="center">A</td>
										</tr>
										<tr class="gradeA">
											<td>KHTML</td>
											<td>Konqureror 3.5</td>
											<td>KDE 3.5</td>
											<td class="center">3.5</td>
											<td class="center">A</td>
										</tr>
										<tr class="gradeX">
											<td>Tasman</td>
											<td>Internet Explorer 4.5</td>
											<td>Mac OS 8-9</td>
											<td class="center">-</td>
											<td class="center">X</td>
										</tr>
										<tr class="gradeC">
											<td>Tasman</td>
											<td>Internet Explorer 5.1</td>
											<td>Mac OS 7.6-9</td>
											<td class="center">1</td>
											<td class="center">C</td>
										</tr>
										<tr class="gradeC">
											<td>Tasman</td>
											<td>Internet Explorer 5.2</td>
											<td>Mac OS 8-X</td>
											<td class="center">1</td>
											<td class="center">C</td>
										</tr>
										<tr class="gradeA">
											<td>Misc</td>
											<td>NetFront 3.1</td>
											<td>Embedded devices</td>
											<td class="center">-</td>
											<td class="center">C</td>
										</tr>
										<tr class="gradeA">
											<td>Misc</td>
											<td>NetFront 3.4</td>
											<td>Embedded devices</td>
											<td class="center">-</td>
											<td class="center">A</td>
										</tr>
										<tr class="gradeX">
											<td>Misc</td>
											<td>Dillo 0.8</td>
											<td>Embedded devices</td>
											<td class="center">-</td>
											<td class="center">X</td>
										</tr>
										<tr class="gradeX">
											<td>Misc</td>
											<td>Links</td>
											<td>Text only</td>
											<td class="center">-</td>
											<td class="center">X</td>
										</tr>
										<tr class="gradeX">
											<td>Misc</td>
											<td>Lynx</td>
											<td>Text only</td>
											<td class="center">-</td>
											<td class="center">X</td>
										</tr>
										<tr class="gradeC">
											<td>Misc</td>
											<td>IE Mobile</td>
											<td>Windows Mobile 6</td>
											<td class="center">-</td>
											<td class="center">C</td>
										</tr>
										<tr class="gradeC">
											<td>Misc</td>
											<td>PSP browser</td>
											<td>PSP</td>
											<td class="center">-</td>
											<td class="center">C</td>
										</tr>
										<tr class="gradeU">
											<td>Other browsers</td>
											<td>All others</td>
											<td>-</td>
											<td class="center">-</td>
											<td class="center">U</td>
										</tr>
									</tbody>
								</table>
								<!-- /.table-responsive -->
								<div class="well">
									<h4>DataTables Usage Information</h4>
									<p>
										DataTables is a very flexible, advanced tables plugin for
										jQuery. In SB Admin, we are using a specialized version of
										DataTables built for Bootstrap 3. We have also customized the
										table headings to use Font Awesome icons in place of images.
										For complete documentation on DataTables, visit their website
										at <a target="_blank" href="https://datatables.net/">https://datatables.net/</a>.
									</p>
									<a class="btn btn-default btn-lg btn-block" target="_blank"
										href="https://datatables.net/">View DataTables
										Documentation</a>
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
            <!-- /.container-fluid -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <%@ include file="/company/pages/attendance/inc/closing.jsp" %>

</body>

</html>
