<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" media="screen"
	href="${pageContext.request.contextPath}/resources/css/gallery.css" />
<script src="http://code.jquery.com/jquery-3.2.1.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<%@ include file="menu_CS1.jsp"%>
    <div class="container">

      <h1 class="my-4 text-center text-lg-left">Thumbnail Gallery</h1>
	
      <div class="row text-center text-lg-left">
      	<c:forEach var="image" items="${gallery}">
        <div class="col-lg-3 col-md-8 col-sm-12">
          ${image.galleryNo}
          <a href="${pageContext.request.contextPath}/gallery/view/${image.galleryNo}" class="d-block mb-4 h-100">
            <img class="img-fluid img-thumbnail" src="${pageContext.request.contextPath}/resources/images/${image.galleryImage}"alt="">
          </a>
        </div>
        </c:forEach>
      </div>
    </div>

      <!-- Bootstrap core JavaScript -->
    <script src="${pageContext.request.contextPath}/gallery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/gallery/bootstrap.bundle.min.js"></script>

