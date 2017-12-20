<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
<style type="text/css">
 
#nav{ text-align:right; margin:0; padding:0; list-style:none;display:inline;} 
#nav, #toggle {display:none;} 
#toggle:checked + #nav{display: inline;}

</style>
</head>
<body>
	<div style=" padding:10px; width: 100%; text-align:right; border-top: 1px solid #0BC3F7; 
	border-bottom: 1px solid #0BC3F7;">
	 <label style="font-size: medium;" for="toggle">고객센터▼</label>
	 <input type="checkbox" id="toggle">
	 <ul id="nav">
	 <li><a onclick="location.href='go.do?go=cs/cs'">공지사항</a></li>
	 <li><a onclick="location.href='#'">자주묻는질문</a></li>
	 <li><a onclick="location.href='#'">이용후기</a></li>
	 <li><a onclick="location.href='#'">현장갤러리</a></li>
	 <li><a onclick="location.href='#'">불편신고</a></li>
	 </ul>
	</div>
	<div style="width: 100%; text-align: left;">
	<font color="#bbb" size="2px">(주)이사스토리 경기 부천시 상동로117번길 61 304호 (상동, 드라마씨티) Tel: ☎ 이사문의: 1800-2450 / ☎ 청소문의: 1833-7856FAX: 02-6499-2678<br/>
	E-Mail: karam21c@nate.com개인정보보호책임자: 정일권<br/>
	사업자등록번호: 509-88-00524  화물자동차운송주선사업허가증 : 제2016-주이-009호   국제물류주선업등록증 : 제3416호  이사비용계산기 특허원 제68833호<br/>
	통신판매업신고번호: 제2017-경기부천-0112호 대표 정은수<br/>
	Copyright(C) 24STORY.CO.KR All rights reserved.</font>
	</div>
</body>
</html>