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

<a href="insert.do">등록페이지</a>
<a href="update.do">상태수정</a>
<a href="delete.do">삭제</a>
<br/>
 <c:forEach items="${claimList}" var="claim">
 	${claim.claimNo} ${claim.claimContent} ${claim.claimWDate} ${claim.claimCustomer} ${claim.claimPhone} ${claim.claimState}
 	
</c:forEach> 




		
		
<!-- spring, mybatis 데이터뿌리기 체크박스 start -->	
<div class="panel panel-default">
    <div class="panel-heading" style="height: 50px;">
        <div style="float: left;">
            <p>직원 리스트</p>
        </div>
    </div>
    <div class="panel-body">
        <table class="table table-hover">
            <thead>
                <tr>
                    <th>사번</th>
                    <th>이름</th>
                    <th>업무</th>
                    <th>입사일</th>
                    <th>상세 정보</th>
                    <th>수정</th>
                    <th>삭제</th>
                </tr>
            </thead>
            <c:forEach items="${empList}" var="emp">
                <tbody>
                    <tr>
                        <td>${emp.empNo}</td>
                        <td>${emp.eName}</td>
                        <td>${emp.job}</td>
                        <td>${emp.hireDate}</td>
                        <td><button type="button" class="btn btn-default btn-xs empDetail">상세 정보</button></td>
                        <td><button class="btn btn-default btn-xs empUpdate">수정</button></td>
                        <td><button class="btn btn-default btn-xs empDelete">삭제</button></td>
                    </tr>
                </tbody>
            </c:forEach>
        </table>
    </div>
</div>
<!-- spring, mybatis 데이터뿌리기 체크박스 end -->
		






</body>
</html>