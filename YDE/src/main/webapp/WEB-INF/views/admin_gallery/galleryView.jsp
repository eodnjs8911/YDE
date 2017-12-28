<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
$(function(){
$("#addBtn").click(function(){
	location.href = "/yde/gallery/galleryAdminEditPage.do?galleryNo="+${image.galleryNo};
});
});
</script>
      <h1 class="my-4 text-center text-lg-left">Thumbnail Gallery</h1>
      <div class="row text-center text-lg-left">
         <c:forEach var="image" items="${gallery}">
        <div class="col-lg-2 col-md-4 col-sm-6">
          ${image.galleryNo}
          <a id="addBtn" href="${pageContext.request.contextPath}/gallery/galleryAdminEditPage.do" class="d-block mb-4 h-100">
            <img class="img-fluid img-thumbnail" src="${pageContext.request.contextPath}/resources/images/${image.galleryImage}"alt="${image.galleryImage}"
            style="width: 100%;height: 100%">
          </a>
        </div>
        </c:forEach>
      </div>    
      <br/>
       <button type="button" class="btn btn-default"
       onclick="location.href='${pageContext.request.contextPath}/gallery/galleryAdminPage.do'">
       	사진추가하기</button> 
       	
       	
