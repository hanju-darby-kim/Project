<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	
			var oEditors = [];
			
			nhn.husky.EZCreator.createInIFrame({
			
			    oAppRef: oEditors,
			
			    elPlaceHolder: "content",
			
			    sSkinURI: "/Project/smarteditor/workspace/SmartEditor2Skin.html",
			
			    fCreator: "createSEditor2"
			
			});
			var sDefaultFont = '맑은 고딕';
			var nFontSize = 12;
			oEditors.setDefaultFont(sDefaultFont, nFontSize);

			
</script>