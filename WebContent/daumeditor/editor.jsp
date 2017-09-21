<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<!DOCTYPE html PUBLIC "" ""><HTML><HEAD>     
<META http-equiv="Content-Type" content="text/html; charset=utf-8">     
<TITLE>Daum 에디터 - 등록화면 예제</TITLE>     <!--
        다음오픈에디터 사용 튜토리얼은 이 페이지로 대신합니다.
        추가적인 기능 개발 및 플러그인 개발 튜토리얼은 홈페이지를 확인해주세요.
        작업이 완료된 후에는 주석을 삭제하여 사용하십시요.

        다음오픈에디터의 라이선스는 GNU LGPL(Lesser General Public License) 으로
        오픈되어 있는 소스이므로 저작권료 없이 사용이 가능하며, 목적에 맞게 수정하여 사용할 수 있으십니다.
        또한 LGPL에는 수정한 부분의 소스공개를 권장하고 있으나, 강제 사항은 아니므로 공개하지 않으셔도 무방합니다.
        다만 사용하시는 소스 상단 부분에 다음오픈에디터를 사용하셨음을 명시해 주시길 권장 드리며,
        꾸준한 업데이트를 할 예정이니 종종 방문 하셔서 버그가 수정 되고 기능이 추가된 버전들을 다운로드 받아 사용해 주세요.

        라이센스 : GNU LGPL(Lesser General Public License)
        홈페이지 : https://github.com/daumcorp/DaumEditor/
    --> 
    <!--
        에디터 리소스들을 로딩하는 부분으로, 경로가 변경되면 이 부분 수정이 필요.
        주의: 서비스에 이용시 loader 에 붙은 environment=development 값을 제거해야 브라우저 캐시를 사용할 수 있습니다.
    --> 
    <LINK href="css/editor.css" rel="stylesheet" type="text/css" 
charset="utf-8">     
<SCRIPT src="js/editor_loader.js" type="text/javascript" charset="utf-8"></SCRIPT>
 </HEAD> 
<BODY>
<DIV class="body"><!-- 에디터 시작 -->	 <!--
		@decsription
		등록하기 위한 Form으로 상황에 맞게 수정하여 사용한다. Form 이름은 에디터를 생성할 때 설정값으로 설정한다.
	-->
	 
<FORM name="tx_editor_form" id="tx_editor_form" action="http://posttestserver.com/post.php" 
method="post" accept-charset="utf-8"><!-- 에디터 컨테이너 시작 -->		 
<DIV class="tx-editor-container" id="tx_trex_container"><!-- 사이드바 -->			 
<DIV class="tx-sidebar" id="tx_sidebar">
<DIV class="tx-sidebar-boundary"><!-- 사이드바 / 첨부 -->					 
<UL class="tx-bar tx-bar-left tx-nav-attach"><!-- 이미지 첨부 버튼 시작 -->						 <!--
							@decsription
							<li></li> 단위로 위치를 이동할 수 있다.
						-->
						 
<LI class="tx-list">
<DIV class="tx-image tx-btn-trans" id="tx_image" unselectable="on"><A title="사진" 
class="tx-text" href="javascript:;">사진</A></DIV></LI><!-- 이미지 첨부 버튼 끝 -->						 
<LI class="tx-list">
<DIV class="tx-file tx-btn-trans" id="tx_file" unselectable="on"><A title="파일" 
class="tx-text" href="javascript:;">파일</A></DIV></LI>
<LI class="tx-list">
<DIV class="tx-media tx-btn-trans" id="tx_media" unselectable="on"><A title="외부컨텐츠" 
class="tx-text" href="javascript:;">외부컨텐츠</A></DIV></LI>
<LI class="tx-list tx-list-extra">
<DIV class="tx-btn-nlrbg tx-extra" unselectable="on"><A title="버튼 더보기" class="tx-icon" 
href="javascript:;">버튼 더보기</A></DIV>
<UL class="tx-extra-menu tx-menu" style="left: -48px;" unselectable="on"><!--
									@decsription
									일부 버튼들을 빼서 레이어로 숨기는 기능을 원할 경우 이 곳으로 이동시킬 수 있다.
								-->
							 </UL></LI></UL><!-- 사이드바 / 우측영역 -->					 
<UL class="tx-bar tx-bar-right">
<LI class="tx-list">
<DIV class="tx-btn-lrbg tx-fullscreen" id="tx_fullscreen" unselectable="on"><A 
title="넓게쓰기 (Ctrl+M)" class="tx-icon" 
href="javascript:;">넓게쓰기</A></DIV></LI></UL>
<UL class="tx-bar tx-bar-right tx-nav-opt">
<LI class="tx-list">
<DIV class="tx-switchtoggle" id="tx_switchertoggle" unselectable="on"><A title="에디터 타입" 
href="javascript:;">에디터</A></DIV></LI></UL></DIV></DIV><!-- 툴바 - 기본 시작 -->			 <!--
				@decsription
				툴바 버튼의 그룹핑의 변경이 필요할 때는 위치(왼쪽, 가운데, 오른쪽) 에 따라 <li> 아래의 <div>의 클래스명을 변경하면 된다.
				tx-btn-lbg: 왼쪽, tx-btn-bg: 가운데, tx-btn-rbg: 오른쪽, tx-btn-lrbg: 독립적인 그룹

				드롭다운 버튼의 크기를 변경하고자 할 경우에는 넓이에 따라 <li> 아래의 <div>의 클래스명을 변경하면 된다.
				tx-slt-70bg, tx-slt-59bg, tx-slt-42bg, tx-btn-43lrbg, tx-btn-52lrbg, tx-btn-57lrbg, tx-btn-71lrbg
				tx-btn-48lbg, tx-btn-48rbg, tx-btn-30lrbg, tx-btn-46lrbg, tx-btn-67lrbg, tx-btn-49lbg, tx-btn-58bg, tx-btn-46bg, tx-btn-49rbg
			-->
			 
<DIV class="tx-toolbar tx-toolbar-basic" id="tx_toolbar_basic">
<DIV class="tx-toolbar-boundary">
<UL class="tx-bar tx-bar-left">
<LI class="tx-list">
<DIV class="tx-slt-70bg tx-fontfamily" id="tx_fontfamily" unselectable="on"><A 
title="글꼴" href="javascript:;">굴림</A></DIV>
<DIV class="tx-fontfamily-menu tx-menu" id="tx_fontfamily_menu" unselectable="on"></DIV></LI></UL>
<UL class="tx-bar tx-bar-left">
<LI class="tx-list">
<DIV class="tx-slt-42bg tx-fontsize" id="tx_fontsize" unselectable="on"><A 
title="글자크기" href="javascript:;">9pt</A></DIV>
<DIV class="tx-fontsize-menu tx-menu" id="tx_fontsize_menu" 
unselectable="on"></DIV></LI></UL>
<UL class="tx-bar tx-bar-left tx-group-font">
<LI class="tx-list">
<DIV class="&#9;&#9; tx-btn-lbg &#9;tx-bold" id="tx_bold" unselectable="on"><A 
title="굵게 (Ctrl+B)" class="tx-icon" href="javascript:;">굵게</A></DIV></LI>
<LI class="tx-list">
<DIV class="&#9;&#9; tx-btn-bg &#9;tx-underline" id="tx_underline" unselectable="on"><A 
title="밑줄 (Ctrl+U)" class="tx-icon" href="javascript:;">밑줄</A></DIV></LI>
<LI class="tx-list">
<DIV class="&#9;&#9; tx-btn-bg &#9;tx-italic" id="tx_italic" 
unselectable="on"><A title="기울임 (Ctrl+I)" class="tx-icon" 
href="javascript:;">기울임</A></DIV></LI>
<LI class="tx-list">
<DIV class="&#9;&#9; tx-btn-bg &#9;tx-strike" id="tx_strike" 
unselectable="on"><A title="취소선 (Ctrl+D)" class="tx-icon" 
href="javascript:;">취소선</A></DIV></LI>
<LI class="tx-list">
<DIV class="&#9;&#9; tx-slt-tbg &#9;tx-forecolor" id="tx_forecolor" 
unselectable="on"><A title="글자색" class="tx-icon" href="javascript:;">글자색</A><A 
title="글자색 선택" class="tx-arrow" href="javascript:;">글자색 선택</A></DIV>
<DIV class="tx-menu tx-forecolor-menu tx-colorpallete" id="tx_forecolor_menu" 
unselectable="on"></DIV></LI>
<LI class="tx-list">
<DIV class="&#9;&#9; tx-slt-brbg &#9;tx-backcolor" id="tx_backcolor" 
unselectable="on"><A title="글자 배경색" class="tx-icon" href="javascript:;">글자 
배경색</A><A title="글자 배경색 선택" class="tx-arrow" href="javascript:;">글자 배경색 
선택</A></DIV>
<DIV class="tx-menu tx-backcolor-menu tx-colorpallete" id="tx_backcolor_menu" 
unselectable="on"></DIV></LI></UL>
<UL class="tx-bar tx-bar-left tx-group-align">
<LI class="tx-list">
<DIV class="&#9;&#9; tx-btn-lbg &#9;tx-alignleft" id="tx_alignleft" 
unselectable="on"><A title="왼쪽정렬 (Ctrl+,)" class="tx-icon" 
href="javascript:;">왼쪽정렬</A></DIV></LI>
<LI class="tx-list">
<DIV class="&#9;&#9; tx-btn-bg &#9;tx-aligncenter" id="tx_aligncenter" 
unselectable="on"><A title="가운데정렬 (Ctrl+.)" class="tx-icon" 
href="javascript:;">가운데정렬</A></DIV></LI>
<LI class="tx-list">
<DIV class="&#9;&#9; tx-btn-bg &#9;tx-alignright" id="tx_alignright" 
unselectable="on"><A title="오른쪽정렬 (Ctrl+/)" class="tx-icon" 
href="javascript:;">오른쪽정렬</A></DIV></LI>
<LI class="tx-list">
<DIV class="&#9;&#9; tx-btn-rbg &#9;tx-alignfull" id="tx_alignfull" 
unselectable="on"><A title="양쪽정렬" class="tx-icon" 
href="javascript:;">양쪽정렬</A></DIV></LI></UL>
<UL class="tx-bar tx-bar-left tx-group-tab">
<LI class="tx-list">
<DIV class="&#9;&#9; tx-btn-lbg &#9;tx-indent" id="tx_indent" 
unselectable="on"><A title="들여쓰기 (Tab)" class="tx-icon" 
href="javascript:;">들여쓰기</A></DIV></LI>
<LI class="tx-list">
<DIV class="&#9;&#9; tx-btn-rbg &#9;tx-outdent" id="tx_outdent" unselectable="on"><A 
title="내어쓰기 (Shift+Tab)" class="tx-icon" 
href="javascript:;">내어쓰기</A></DIV></LI></UL>
<UL class="tx-bar tx-bar-left tx-group-list">
<LI class="tx-list">
<DIV class="tx-slt-31lbg tx-lineheight" id="tx_lineheight" unselectable="on"><A 
title="줄간격" class="tx-icon" href="javascript:;">줄간격</A><A title="줄간격" class="tx-arrow" 
href="javascript:;">줄간격 선택</A></DIV>
<DIV class="tx-lineheight-menu tx-menu" id="tx_lineheight_menu" unselectable="on"></DIV></LI>
<LI class="tx-list">
<DIV class="tx-slt-31rbg tx-styledlist" id="tx_styledlist" unselectable="on"><A 
title="리스트" class="tx-icon" href="javascript:;">리스트</A><A title="리스트" class="tx-arrow" 
href="javascript:;">리스트 선택</A></DIV>
<DIV class="tx-styledlist-menu tx-menu" id="tx_styledlist_menu" unselectable="on"></DIV></LI></UL>
<UL class="tx-bar tx-bar-left tx-group-etc">
<LI class="tx-list">
<DIV class="&#9;&#9; tx-btn-lbg &#9;tx-emoticon" id="tx_emoticon" unselectable="on"><A 
title="이모티콘" class="tx-icon" href="javascript:;">이모티콘</A></DIV>
<DIV class="tx-emoticon-menu tx-menu" id="tx_emoticon_menu" 
unselectable="on"></DIV></LI>
<LI class="tx-list">
<DIV class="&#9;&#9; tx-btn-bg &#9;tx-link" id="tx_link" unselectable="on"><A 
title="링크 (Ctrl+K)" class="tx-icon" href="javascript:;">링크</A></DIV>
<DIV class="tx-link-menu tx-menu" id="tx_link_menu"></DIV></LI>
<LI class="tx-list">
<DIV class="&#9;&#9; tx-btn-bg &#9;tx-specialchar" id="tx_specialchar" 
unselectable="on"><A title="특수문자" class="tx-icon" 
href="javascript:;">특수문자</A></DIV>
<DIV class="tx-specialchar-menu tx-menu" id="tx_specialchar_menu"></DIV></LI>
<LI class="tx-list">
<DIV class="&#9;&#9; tx-btn-bg &#9;tx-table" id="tx_table" unselectable="on"><A 
title="표만들기" class="tx-icon" href="javascript:;">표만들기</A></DIV>
<DIV class="tx-table-menu tx-menu" id="tx_table_menu" unselectable="on">
<DIV class="tx-menu-inner">
<DIV class="tx-menu-preview"></DIV>
<DIV class="tx-menu-rowcol"></DIV>
<DIV class="tx-menu-deco"></DIV>
<DIV class="tx-menu-enter"></DIV></DIV></DIV></LI>
<LI class="tx-list">
<DIV class="&#9;&#9; tx-btn-rbg &#9;tx-horizontalrule" id="tx_horizontalrule" 
unselectable="on"><A title="구분선" class="tx-icon" 
href="javascript:;">구분선</A></DIV>
<DIV class="tx-horizontalrule-menu tx-menu" id="tx_horizontalrule_menu" 
unselectable="on"></DIV></LI></UL>
<UL class="tx-bar tx-bar-left">
<LI class="tx-list">
<DIV class="&#9;&#9; tx-btn-lbg &#9;tx-richtextbox" id="tx_richtextbox" 
unselectable="on"><A title="글상자" class="tx-icon" 
href="javascript:;">글상자</A></DIV>
<DIV class="tx-richtextbox-menu tx-menu" id="tx_richtextbox_menu">
<DIV class="tx-menu-header">
<DIV class="tx-menu-preview-area">
<DIV class="tx-menu-preview"></DIV></DIV>
<DIV class="tx-menu-switch">
<DIV class="tx-menu-simple tx-selected"><A><SPAN>간단 선택</SPAN></A></DIV>
<DIV class="tx-menu-advanced"><A><SPAN>직접 선택</SPAN></A></DIV></DIV></DIV>
<DIV class="tx-menu-inner"></DIV>
<DIV class="tx-menu-footer"><IMG class="tx-menu-confirm" alt="" src="./images/icon/editor/btn_confirm.gif?rv=1.0.1">
								 <IMG class="tx-menu-cancel" alt="" src="./images/icon/editor/btn_cancel.gif?rv=1.0.1" 
hspace="3">							 </DIV></DIV></LI>
<LI class="tx-list">
<DIV class="&#9;&#9; tx-btn-bg &#9;tx-quote" id="tx_quote" unselectable="on"><A 
title="인용구 (Ctrl+Q)" class="tx-icon" href="javascript:;">인용구</A></DIV>
<DIV class="tx-quote-menu tx-menu" id="tx_quote_menu" 
unselectable="on"></DIV></LI>
<LI class="tx-list">
<DIV class="&#9;&#9; tx-btn-bg &#9;tx-background" id="tx_background" 
unselectable="on"><A title="배경색" class="tx-icon" 
href="javascript:;">배경색</A></DIV>
<DIV class="tx-menu tx-background-menu tx-colorpallete" id="tx_background_menu" 
unselectable="on"></DIV></LI>
<LI class="tx-list">
<DIV class="&#9;&#9; tx-btn-rbg &#9;tx-dictionary" id="tx_dictionary" 
unselectable="on"><A title="사전" class="tx-icon" 
href="javascript:;">사전</A></DIV></LI></UL>
<UL class="tx-bar tx-bar-left tx-group-undo">
<LI class="tx-list">
<DIV class="&#9;&#9; tx-btn-lbg &#9;tx-undo" id="tx_undo" unselectable="on"><A 
title="실행취소 (Ctrl+Z)" class="tx-icon" href="javascript:;">실행취소</A></DIV></LI>
<LI class="tx-list">
<DIV class="&#9;&#9; tx-btn-rbg &#9;tx-redo" id="tx_redo" unselectable="on"><A 
title="다시실행 (Ctrl+Y)" class="tx-icon" 
href="javascript:;">다시실행</A></DIV></LI></UL>
<UL class="tx-bar tx-bar-right">
<LI class="tx-list">
<DIV class="tx-btn-nlrbg tx-advanced" id="tx_advanced" unselectable="on"><A 
title="툴바 더보기" class="tx-icon" href="javascript:;">툴바 
더보기</A></DIV></LI></UL></DIV></DIV><!-- 툴바 - 기본 끝 -->			 <!-- 툴바 - 더보기 시작 -->
			 <DIV class="tx-toolbar tx-toolbar-advanced" id="tx_toolbar_advanced">
<DIV class="tx-toolbar-boundary">
<UL class="tx-bar tx-bar-left">
<LI class="tx-list">
<DIV class="tx-tableedit-title"></DIV></LI></UL>
<UL class="tx-bar tx-bar-left tx-group-align">
<LI class="tx-list">
<DIV class="tx-btn-lbg tx-mergecells" id="tx_mergecells" unselectable="on"><A 
title="병합" class="tx-icon2" href="javascript:;">병합</A></DIV>
<DIV class="tx-mergecells-menu tx-menu" id="tx_mergecells_menu" unselectable="on"></DIV></LI>
<LI class="tx-list">
<DIV class="tx-btn-bg tx-insertcells" id="tx_insertcells" unselectable="on"><A 
title="삽입" class="tx-icon2" href="javascript:;">삽입</A></DIV>
<DIV class="tx-insertcells-menu tx-menu" id="tx_insertcells_menu" unselectable="on"></DIV></LI>
<LI class="tx-list">
<DIV class="tx-btn-rbg tx-deletecells" id="tx_deletecells" unselectable="on"><A 
title="삭제" class="tx-icon2" href="javascript:;">삭제</A></DIV>
<DIV class="tx-deletecells-menu tx-menu" id="tx_deletecells_menu" unselectable="on"></DIV></LI></UL>
<UL class="tx-bar tx-bar-left tx-group-align">
<LI class="tx-list">
<DIV class="tx-slt-70lbg tx-cellslinepreview" id="tx_cellslinepreview" 
unselectable="on"><A title="선 미리보기" href="javascript:;"></A></DIV>
<DIV class="tx-cellslinepreview-menu tx-menu" id="tx_cellslinepreview_menu" 
unselectable="on"></DIV></LI>
<LI class="tx-list">
<DIV class="tx-slt-tbg tx-cellslinecolor" id="tx_cellslinecolor" unselectable="on"><A 
title="선색" class="tx-icon2" href="javascript:;">선색</A>
<DIV class="tx-colorpallete" unselectable="on"></DIV></DIV>
<DIV class="tx-cellslinecolor-menu tx-menu tx-colorpallete" id="tx_cellslinecolor_menu" 
unselectable="on"></DIV></LI>
<LI class="tx-list">
<DIV class="tx-btn-bg tx-cellslineheight" id="tx_cellslineheight" unselectable="on"><A 
title="두께" class="tx-icon2" href="javascript:;">두께</A></DIV>
<DIV class="tx-cellslineheight-menu tx-menu" id="tx_cellslineheight_menu" 
unselectable="on"></DIV></LI>
<LI class="tx-list">
<DIV class="tx-btn-bg tx-cellslinestyle" id="tx_cellslinestyle" unselectable="on"><A 
title="스타일" class="tx-icon2" href="javascript:;">스타일</A></DIV>
<DIV class="tx-cellslinestyle-menu tx-menu" id="tx_cellslinestyle_menu" 
unselectable="on"></DIV></LI>
<LI class="tx-list">
<DIV class="tx-btn-rbg tx-cellsoutline" id="tx_cellsoutline" 
unselectable="on"><A title="테두리" class="tx-icon2" 
href="javascript:;">테두리</A></DIV>
<DIV class="tx-cellsoutline-menu tx-menu" id="tx_cellsoutline_menu" 
unselectable="on"></DIV></LI></UL>
<UL class="tx-bar tx-bar-left">
<LI class="tx-list">
<DIV class="tx-btn-lrbg tx-tablebackcolor" id="tx_tablebackcolor" style="background-color: rgb(154, 165, 234);" 
unselectable="on"><A title="테이블 배경색" class="tx-icon2" href="javascript:;">테이블 
배경색</A></DIV>
<DIV class="tx-tablebackcolor-menu tx-menu tx-colorpallete" id="tx_tablebackcolor_menu" 
unselectable="on"></DIV></LI></UL>
<UL class="tx-bar tx-bar-left">
<LI class="tx-list">
<DIV class="tx-btn-lrbg tx-tabletemplate" id="tx_tabletemplate" unselectable="on"><A 
title="테이블 서식" class="tx-icon2" href="javascript:;">테이블 서식</A></DIV>
<DIV class="tx-tabletemplate-menu tx-menu tx-colorpallete" id="tx_tabletemplate_menu" 
unselectable="on"></DIV></LI></UL></DIV></DIV><!-- 툴바 - 더보기 끝 -->			 <!-- 편집영역 시작 -->
				 <!-- 에디터 Start -->	 
<DIV class="tx-canvas" id="tx_canvas">
<DIV class="tx-loading" id="tx_loading">
<DIV><IMG width="113" height="21" align="absmiddle" src="images/icon/editor/loading2.png"></DIV></DIV>
<DIV class="tx-holder" id="tx_canvas_wysiwyg_holder" 
style="display: block;"><IFRAME name="tx_canvas_wysiwyg" id="tx_canvas_wysiwyg" 
frameborder="0" allowtransparency="true"></IFRAME>		 </DIV>
<DIV class="tx-source-deco">
<DIV class="tx-holder" id="tx_canvas_source_holder"><TEXTAREA id="tx_canvas_source" rows="30" cols="30"></TEXTAREA></DIV></DIV>
<DIV class="tx-holder" 
id="tx_canvas_text_holder"><TEXTAREA id="tx_canvas_text" rows="30" cols="30"></TEXTAREA></DIV></DIV><!-- 높이조절 Start -->
	 
<DIV class="tx-resize-bar" id="tx_resizer">
<DIV class="tx-resize-bar-bg"></DIV><IMG width="58" height="12" id="tx_resize_holder" 
alt="" src="images/icon/editor/skin/01/btn_drag01.gif" unselectable="on">
	 </DIV>
<DIV class="tx-side-bi" id="tx_side_bi">
<DIV style="text-align: right;"><IMG width="78" height="14" align="absmiddle" 
src="images/icon/editor/editor_bi.png" hspace="4">		 </DIV></DIV><!-- 편집영역 끝 -->
			 <!-- 첨부박스 시작 -->				 <!-- 파일첨부박스 Start -->	 
<DIV class="tx-attach-div" id="tx_attach_div">
<DIV class="tx-attach-txt" id="tx_attach_txt">파일 첨부</DIV>
<DIV class="tx-attach-box" id="tx_attach_box">
<DIV class="tx-attach-box-inner">
<DIV class="tx-attach-preview" id="tx_attach_preview">
<P></P><IMG width="147" height="108" src="images/icon/editor/pn_preview.gif" 
unselectable="on"></DIV>
<DIV class="tx-attach-main">
<DIV class="tx-upload-progress" id="tx_upload_progress">
<DIV>0%</DIV>
<P>파일을 업로드하는 중입니다.</P></DIV>
<UL class="tx-attach-top">
<LI class="tx-attach-delete" id="tx_attach_delete"><A>전체삭제</A></LI>
<LI class="tx-attach-size" id="tx_attach_size">							파일: <SPAN class="tx-attach-size-up" 
id="tx_attach_up_size"></SPAN>/<SPAN id="tx_attach_max_size"></SPAN>						 </LI>
<LI class="tx-attach-tools" id="tx_attach_tools"></LI></UL>
<UL class="tx-attach-list" id="tx_attach_list"></UL></DIV></DIV></DIV></DIV><!-- 첨부박스 끝 -->
		 </DIV><!-- 에디터 컨테이너 끝 -->	 </FORM></DIV><!-- 에디터 끝 --> 
<SCRIPT type="text/javascript">
	var config = {
		txHost: '', /* 런타임 시 리소스들을 로딩할 때 필요한 부분으로, 경로가 변경되면 이 부분 수정이 필요. ex) http://xxx.xxx.com */
		txPath: '', /* 런타임 시 리소스들을 로딩할 때 필요한 부분으로, 경로가 변경되면 이 부분 수정이 필요. ex) /xxx/xxx/ */
		txService: 'sample', /* 수정필요없음. */
		txProject: 'sample', /* 수정필요없음. 프로젝트가 여러개일 경우만 수정한다. */
		initializedId: "", /* 대부분의 경우에 빈문자열 */
		wrapper: "tx_trex_container", /* 에디터를 둘러싸고 있는 레이어 이름(에디터 컨테이너) */
		form: 'tx_editor_form'+"", /* 등록하기 위한 Form 이름 */
		txIconPath: "images/icon/editor/", /*에디터에 사용되는 이미지 디렉터리, 필요에 따라 수정한다. */
		txDecoPath: "images/deco/contents/", /*본문에 사용되는 이미지 디렉터리, 서비스에서 사용할 때는 완성된 컨텐츠로 배포되기 위해 절대경로로 수정한다. */
		canvas: {
            exitEditor:{
                /*
                desc:'빠져 나오시려면 shift+b를 누르세요.',
                hotKey: {
                    shiftKey:true,
                    keyCode:66
                },
                nextElement: document.getElementsByTagName('button')[0]
                */
            },
			styles: {
				color: "#123456", /* 기본 글자색 */
				fontFamily: "굴림", /* 기본 글자체 */
				fontSize: "10pt", /* 기본 글자크기 */
				backgroundColor: "#fff", /*기본 배경색 */
				lineHeight: "1.5", /*기본 줄간격 */
				padding: "8px" /* 위지윅 영역의 여백 */
			},
			showGuideArea: false
		},
		events: {
			preventUnload: false
		},
		sidebar: {
			attachbox: {
				show: true,
				confirmForDeleteAll: true
			}
		},
		size: {
			contentWidth: 700 /* 지정된 본문영역의 넓이가 있을 경우에 설정 */
		}
	};

	EditorJSLoader.ready(function(Editor) {
		var editor = new Editor(config);
	});
	
</SCRIPT>
 <!-- Sample: Saving Contents --> 
<SCRIPT type="text/javascript">
	/* 예제용 함수 */
	function saveContent() {
		Editor.save(); // 이 함수를 호출하여 글을 등록하면 된다.
	}

	/**
	 * Editor.save()를 호출한 경우 데이터가 유효한지 검사하기 위해 부르는 콜백함수로
	 * 상황에 맞게 수정하여 사용한다.
	 * 모든 데이터가 유효할 경우에 true를 리턴한다.
	 * @function
	 * @param {Object} editor - 에디터에서 넘겨주는 editor 객체
	 * @returns {Boolean} 모든 데이터가 유효할 경우에 true
	 */
	function validForm(editor) {
		// Place your validation logic here

		// sample : validate that content exists
		var validator = new Trex.Validator();
		var content = editor.getContent();
		if (!validator.exists(content)) {
			alert('내용을 입력하세요');
			return false;
		}

		return true;
	}

	/**
	 * Editor.save()를 호출한 경우 validForm callback 이 수행된 이후
	 * 실제 form submit을 위해 form 필드를 생성, 변경하기 위해 부르는 콜백함수로
	 * 각자 상황에 맞게 적절히 응용하여 사용한다.
	 * @function
	 * @param {Object} editor - 에디터에서 넘겨주는 editor 객체
	 * @returns {Boolean} 정상적인 경우에 true
	 */
	function setForm(editor) {
        var i, input;
        var form = editor.getForm();
        var content = editor.getContent();

        // 본문 내용을 필드를 생성하여 값을 할당하는 부분
        var textarea = document.createElement('textarea');
        textarea.name = 'content';
        textarea.value = content;
        form.createField(textarea);

        /* 아래의 코드는 첨부된 데이터를 필드를 생성하여 값을 할당하는 부분으로 상황에 맞게 수정하여 사용한다.
         첨부된 데이터 중에 주어진 종류(image,file..)에 해당하는 것만 배열로 넘겨준다. */
        var images = editor.getAttachments('image');
        for (i = 0; i < images.length; i++) {
            // existStage는 현재 본문에 존재하는지 여부
            if (images[i].existStage) {
                // data는 팝업에서 execAttach 등을 통해 넘긴 데이터
                alert('attachment information - image[' + i + '] \r\n' + JSON.stringify(images[i].data));
                input = document.createElement('input');
                input.type = 'hidden';
                input.name = 'attach_image';
                input.value = images[i].data.imageurl;  // 예에서는 이미지경로만 받아서 사용
                form.createField(input);
            }
        }

        var files = editor.getAttachments('file');
        for (i = 0; i < files.length; i++) {
            input = document.createElement('input');
            input.type = 'hidden';
            input.name = 'attach_file';
            input.value = files[i].data.attachurl;
            form.createField(input);
        }
        return true;
	}
</SCRIPT>
 
<DIV><BUTTON onclick="saveContent()">SAMPLE - submit contents</BUTTON></DIV><!-- End: Saving Contents --> <!-- Sample: Loading Contents --> 
<TEXTAREA id="sample_contents_source" style="display: none;">	&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&lt;/p&gt;
	&lt;p style="text-align: center;"&gt;
		&lt;img src="http://cfile273.uf.daum.net/image/2064CD374EE1ACCB0F15C8" class="tx-daum-image" style="clear: none; float: none;"/&gt;
	&lt;/p&gt;﻿
	&lt;p&gt;
		&lt;a href="http://cfile297.uf.daum.net/attach/207C8C1B4AA4F5DC01A644"&gt;&lt;img src="snapshot/images/icon/p_gif_s.gif"/&gt; editor_bi.gif&lt;/a&gt;
	&lt;/p&gt;
</TEXTAREA> 
<SCRIPT type="text/javascript">
	function loadContent() {
		var attachments = {};
		attachments['image'] = [];
		attachments['image'].push({
			'attacher': 'image',
			'data': {
				'imageurl': 'http://cfile273.uf.daum.net/image/2064CD374EE1ACCB0F15C8',
				'filename': 'github.gif',
				'filesize': 59501,
				'originalurl': 'http://cfile273.uf.daum.net/original/2064CD374EE1ACCB0F15C8',
				'thumburl': 'http://cfile273.uf.daum.net/P150x100/2064CD374EE1ACCB0F15C8'
			}
		});
		attachments['file'] = [];
		attachments['file'].push({
			'attacher': 'file',
			'data': {
				'attachurl': 'http://cfile297.uf.daum.net/attach/207C8C1B4AA4F5DC01A644',
				'filemime': 'image/gif',
				'filename': 'editor_bi.gif',
				'filesize': 640
			}
		});
		/* 저장된 컨텐츠를 불러오기 위한 함수 호출 */
		Editor.modify({
			"attachments": function () { /* 저장된 첨부가 있을 경우 배열로 넘김, 위의 부분을 수정하고 아래 부분은 수정없이 사용 */
				var allattachments = [];
				for (var i in attachments) {
					allattachments = allattachments.concat(attachments[i]);
				}
				return allattachments;
			}(),
			"content": document.getElementById("sample_contents_source") /* 내용 문자열, 주어진 필드(textarea) 엘리먼트 */
		});
	}
</SCRIPT>
 
<DIV><BUTTON onclick="loadContent()">SAMPLE - load contents to 
editor</BUTTON></DIV><!-- End: Loading Contents --> </BODY></HTML>
