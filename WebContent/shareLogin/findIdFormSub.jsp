<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/dbCon.jsp"%>
<%
String email=request.getParameter("email");
String userid = "";
String sql="select count(*) cnt from member_tbl where email='"+email+"' ";
ResultSet rs = stmt.executeQuery(sql);
rs.next();
int cnt = rs.getInt("cnt");
if(cnt == 1){
	String sql2="select userid from member_tbl where email='"+email+"' ";
	ResultSet rs2 = stmt.executeQuery(sql2);
	rs2.next();
	userid = rs2.getString("userid");	
}
%>
<%
if(!"".equals(userid) ){
%>
	<script>
	alert("아이디는 <%=userid%> 입니다.");
	location = "login.jsp";
	</script>
<%
}else{
%>
<script>
	alert("이메일을 정확하게 입력하지 않았습니다.");
	location = "findIdForm.jsp";
</script>
<%
}
%>