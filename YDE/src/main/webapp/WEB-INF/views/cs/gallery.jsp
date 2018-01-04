<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" media="screen"
   href="${pageContext.request.contextPath}/resources/css/gallery.css" />
   <style type="text/css">
#gallery {
	cursor: pointer;
	text-decoration: none;
	color: #2F322A;
	display: block;
}
#gallery :hover {
	text-decoration: none;
	color: gray;
}

</style>
<%@ include file="menu_CS1.jsp"%>
<img src="${pageContext.request.contextPath}/resources/images/gallery.png" width="100%">
<!--       <h1 class="my-4 text-center text-lg-left">Thumbnail Gallery</h1> -->
   
      <div class="row text-center text-lg-left">
         <c:forEach var="image" items="${gallery}">
        <div class="col-lg-4 col-md-6 col-sm-12">
          <a id="gallery" href="${pageContext.request.contextPath}/gallery/view/${image.galleryNo}" class="d-block mb-4 h-100">
            <img class="img-fluid img-thumbnail" src="${pageContext.request.contextPath}/resources/images/${image.galleryImage}" alt="IMAGE_${image.galleryImage}"
            style="width: 100%;height: 100%">
			<font size="2px" style="padding: 5px;">${image.galleryTitle}</font>
          </a>
        </div>
        </c:forEach>
      </div>
