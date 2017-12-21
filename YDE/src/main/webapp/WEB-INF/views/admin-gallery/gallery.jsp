<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/resources/jquery/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<div class="container">
  <h2>Gallery Input</h2>
  <form class="form-horizontal" action="" enctype="multipart/form-data">
    <div class="form-group">
      <label class="control-label col-sm-2" for="제목">제목</label>
      <div class="col-sm-4">
        <input type="text" class="form-control" id="galleryTitle" placeholder="제목을 입력하세요" name="galleryTitle">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="썸네일">썸네일</label>
      <div class="col-sm-4">          
        <input type="file" class="form-control" id="galleryImage" placeholder="그림파일 이름" name="galleryImage" readonly="readonly">
      </div>
    </div>
    <div class="form-group">
	    <label class="control-label col-sm-2" for="내용">내용</label>
	  	<textarea style="margin-:10px" class="col-sm-10" rows="20" id="GalleryContent" name="GalleryContent"></textarea>
	</div>
	<div class="form-group">        
      <div class="col-sm-offset-2 col-sm-6">
        <button type="submit" class="btn btn-default">저장</button>
      </div>
    </div>
  </form>
</div>
