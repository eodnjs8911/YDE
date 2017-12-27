<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/resources/jquery/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js" ></script>
<script src="${pageContext.request.contextPath}/resources/jquery/jquery-3.2.1.min.js"></script>
<script>
//ckeditorc적용
var editor= null;
$(function(){
	CKEDITOR.replace('galleryContent',{
			filebrowserUploadUrl:'<%=request.getContextPath()%>/admin_gallery/ckeditorUpload?'
				+'up_dir=/resources/images'
				+'&temp_dir=c:/Temp'
	});
});

function form_save(form){
	editor.updateElement();
}
</script>
<div class="container">
  <h2>Gallery Input</h2>
  <form class="form-horizontal" action="${pageContext.request.contextPath}/gallery/insert.do" enctype="multipart/form-data" method="post">
    <div class="form-group">
      <label class="control-label col-sm-2" for="제목">제목</label>
      <div class="col-sm-4">
        <input type="text" class="form-control" id="galleryTitle" placeholder="제목을 입력하세요" name="galleryTitle">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="썸네일">썸네일</label>
      <div class="col-sm-4">          
        <input type="file" class="form-control" id="galleryImage" placeholder="그림파일 이름" name="upload" readonly="readonly">
      </div>
    </div>
    <div class="form-group">
	  <div class="form-group"><label class="control-label col-sm-2" for="내용">내용</label></div>
	  <div>
	  <textarea style="margin-:10px" class="col-sm-10" rows="20" id="galleryContent" name="galleryContent"></textarea>
	  </div>
	</div>
	<div class="form-group">        
      <div class="col-sm-offset-2 col-sm-6">
        <button type="submit" class="btn btn-default">저장</button><button type="reset" class="btn btn-default">재작성</button>
      </div>
    </div>
  </form>
</div>
