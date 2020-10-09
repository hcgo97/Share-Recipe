<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/dbCon.jsp"%>
<%
String userid = request.getParameter("userid");
String pass = request.getParameter("pass");


String sql = "select count(*) cnt from member_tbl "
		   + " where userid='"+userid+"' and pass='"+pass+"' ";
ResultSet rs = stmt.executeQuery(sql);

rs.next();
int cnt = rs.getInt("cnt");
if( cnt == 0 ) {
%>
		<script>
		alert("다시 시도해 주세요.");
		location='login2.jsp';
		</script>
<%
		return;
}

	session.setAttribute("userid",userid);
%>

<script>
alert("<%=userid %>로 로그인 되었습니다");
location = "../newMain/newmain.jsp";
</script>
