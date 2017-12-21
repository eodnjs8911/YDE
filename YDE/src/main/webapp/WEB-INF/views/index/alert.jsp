<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<script>
alert("${param.msg}");
location.assign("${param.url}");
</script>
</head>
<body>

</body>
</html>