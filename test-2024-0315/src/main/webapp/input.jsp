<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.Import"%>
<%@page import="java.sql.*" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>명함 관리 - 입력</title>
</head>
<body>

	<nav>
		<ul>
			<li><a href="index.jsp">홈으로</a></li>
		</ul>
	</nav>

<h1>명함 입력</h1>
<form action="<%= request.getRequestURI() %>" method="post">
<table border="1">
<tr>
<th>ID</th>
<td><input type="text" name="txtId" value="" /></td>
</tr>

<tr>
<th>이름</th>
<td><input type="text" name="txtName" value="" /></td>
</tr>

<tr>
<th>폰번호</th>
<td><input type="text" name="txtTelNo" value="" /></td>
</tr>

<tr>
<th>이메일</th>
<td><input type="text" name="txtEmail" value="" /></td>
</tr>
</table>

<br />
<input type="submit" value="입력" />
</form>

<%
// Oracle DB 연결 정보
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String loginid = "system";
String password = "1234";
// 입력값 변수
String id = request.getParameter("txtId");
String name = request.getParameter("txtName");
String telNo = request.getParameter("txtTelNo");
String email = request.getParameter("txtEmail");
// DB 연결 및 객체 생성
Connection conn = null;
Statement stat = null;
%>

<%

try {
	// 드라이버 로딩
	Class.forName("oracle.jdbc.driver.OracleDriver");
	// DB 연결
	conn = DriverManager.getConnection(url, loginid, password);
	// SQL 쿼리

	String sql = "INSERT INTO namecard (id, name, telno, mail) VALUES (" + id +", '"+ name + "', '" + telNo + "', '" + email +"')";

	
	// Statement 객체 생성 및 SQL 쿼리 실행
	stat = conn.createStatement();
	StringBuffer sb = new StringBuffer();
	sb.append(sql);
	stat.executeUpdate(sb.toString());
	// 성공 메시지
	%>
	
	<script>
	alert("저장되었습니다!");
	</script>
	<%
} 
catch (Exception e) {
	// 에러 처리
	e.printStackTrace();
	// 에러 메시지
	%>
	<%
}

finally {
// DB 연결 종료
if (stat != null) stat.close();
if (conn != null) conn.close();
}
%>

</body>
</html>
