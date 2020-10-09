<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/dbCon.jsp" %>
<%
String unq = request.getParameter("unq");
String title = request.getParameter("title");
String category = request.getParameter("category");
String mat = request.getParameter("mat");
String recipe = request.getParameter("recipe");


String sql = "DECLARE varRecipe board_tbl.recipe%type;"
			+ "BEGIN 	varRecipe := '"+recipe+"';"
			+ " update board_tbl set "
			+ " 		title='"+title+"', "
			+ " 		category='"+category+"', "
			+ " 		mat='"+mat+"', "
			+ " 		recipe= varRecipe "
			+ " where unq='"+unq+"'; "
			+ " end;";
stmt.executeUpdate(sql);
%>
<script>
alert("글이 수정되었습니다.");
location = "../newMain/newmain.jsp";
</script>









