<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/dbCon.jsp" %>

<%
	request.setCharacterEncoding("UTF-8");
	String pass = request.getParameter("pass");
	String userid = (String) session.getAttribute("userid");
%>
<%
String sql = "update member_tbl set pass = '"+pass+"' where userid='"+userid+"'";
stmt.executeUpdate(sql);
%>
<script>
alert("비밀번호가 수정되었습니다.");
location="updateForm.jsp";
</script>




	