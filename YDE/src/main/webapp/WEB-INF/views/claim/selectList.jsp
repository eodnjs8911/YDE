<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<title>관리자 신고리스트 페이지</title>
</head>
<body>

LIST<br>
신고번호: ${claimList[0].claimNo}&nbsp;&nbsp;
신고내용: ${claimList[0].claimContent}&nbsp;&nbsp;
신고날짜: ${claimList[0].claimWDate}&nbsp;&nbsp;
신고자: ${claimList[0].claimCustomer}&nbsp;&nbsp;
연락처: ${claimList[0].claimPhone}&nbsp;&nbsp;
처리상태: ${claimList[0].claimState}
<br/>

<a href="insert.do">등록</a>
<a href="update.do">상태수정</a>
<a href="delete.do">삭제</a>
<br/>
 <c:forEach items="${claimList}" var="claim">
 	${claim.claimNo} ${claim.claimContent} ${claim.claimWDate} ${claim.claimCustomer} ${claim.claimPhone} ${claim.claimState}
 	
</c:forEach> 
</body>
</html>