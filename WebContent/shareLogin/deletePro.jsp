<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/dbCon.jsp" %>
    
<%
	request.setCharacterEncoding("UTF-8");
	
	String userid = "";
	userid = (String) session.getAttribute("userid");
%>

<%
String pass = request.getParameter("pass");

//  unq , pass => count

String sql1 = " select count(*) as cnt from member_tbl "
		    + " where userid='"+userid+"' and  pass='"+pass+"' ";

ResultSet rs1 = stmt.executeQuery(sql1);
rs1.next();
int cnt = rs1.getInt("cnt"); // 0 , 1

if( cnt == 0 ) {
%>
	<script>
	alert("암호를 다시 입력해주세요.");
	history.back();
	</script>
<%
	return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
</head>
<body>

<script>
		<%
		String sql = " delete from member_tbl "
					+ " where userid = '" + userid + "' ";
		
		stmt.executeUpdate(sql);
		%>
		
		alert("회원탈퇴 되었습니다.");
		
		<%
		session.invalidate();
		%>
		
		location = "../newMain/newmain.jsp";

</script>

</body>
</html>