<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/dbCon.jsp" %>

<%
String userid = request.getParameter("userid");
String pass = request.getParameter("pass");
String name = request.getParameter("name");
String email = request.getParameter("email");


if( userid == null || pass == null || name == null || email == null ) {
%>
		<script>
		alert("다시 시도해 주세요. ~");
		history.back();
		</script>
<%	
	return;
}
// select count(*) from memberInfo where userid='test11';
String sql2 = " select count(*) cnt from memberInfo "
			+ " where userid='"+userid+"' ";
ResultSet rs = stmt.executeQuery(sql2);

int cnt = 0;
if( rs.next() ) {
	cnt = rs.getInt("cnt");
}
if( cnt > 0 ) {
%>
	<script>
	alert("이미 사용중인 아이디입니다.\n 다시 시도해주세요.");
	history.go(-1); // 이전화면
	</script>
<%
	return;
}
String sql = " insert into member_tbl  values  "
           + "('"+userid+"','"+pass+"','"+name+"','"+email+"','0')";    

int result = stmt.executeUpdate(sql);
if(result > 0) {
%>
	<script>
	alert("회원가입 성공");
	location = "login.jsp";
	</script>

<%
}
%>


