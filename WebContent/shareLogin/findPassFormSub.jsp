<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/dbCon.jsp"%>
<%
String userid=request.getParameter("userid");
String pass = "";
/*String sql="select count(*) cnt from member_tbl where id='"+id+"' ";
ResultSet rs = stmt.executeQuery(sql);
rs.next();
int cnt = rs.getInt("cnt");*/
//if(cnt == 1){
	String sql2="select pass from member_tbl where userid='"+userid+"' ";
	ResultSet rs2 = stmt.executeQuery(sql2);
	if(rs2.next()) {
		pass = rs2.getString("pass");
	}
//}
%>
<%
if(pass != "" ){
%>
<script>
alert("비밀번호는 " + <%=pass%> + " 입니다.");
location = "login.jsp";
</script>
<%
}else{
%>
<script>
	alert("아이디를 정확하게 입력하지 않았습니다.");
	location = "findPassForm.jsp";
</script>
<%
}
%>