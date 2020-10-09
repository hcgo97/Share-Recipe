<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ include file="../include/dbCon.jsp" %>   
<%
String userid = request.getParameter("userid");

String message = "";
if( userid == null || userid.equals("") ) {
	message = "잘못된 경로로 접근 ";
} else {
	
	if(userid.length() < 4 || userid.length() > 12) {
		message = "아이디는 4자 ~ 12자 사이로 해주세요.";
	} else {
		
		String sql = " select count(*) cnt from member_tbl "
				   + " where userid='"+userid+"'";
		ResultSet rs = stmt.executeQuery(sql);
		rs.next();
		
		int cnt = rs.getInt("cnt");
		
		if(cnt == 0) {
			message = "사용가능한 아이디입니다.";
		} else {
			message = "이미 사용중인 아이디입니다.";
		}
	}
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>

			 
<div style="width:100%; vertical-align:middle;  
			line-height:40px; text-align:center;">
	<%=message %>
	<br>
		<input type="button" onclick="self.close()" 
			style="height:30px;" value="닫기" >
</div>
</body>
</html>

