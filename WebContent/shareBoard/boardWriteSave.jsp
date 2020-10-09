<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ include file="../include/dbCon.jsp" %>    
<%
String userid = request.getParameter("userid");
String title = request.getParameter("title");
String category = request.getParameter("category");
String mat = request.getParameter("mat");
String recipe = request.getParameter("recipe");

if( title == null || title.equals("")) {
%>
	<script>
	alert("제목을 입력해주세요.");
	history.back(); // 이전화면 go
	</script>
<%
	return;  // jsp stop;
}

String sql = "DECLARE varRecipe board_tbl.recipe%type;"
			+ "BEGIN 	varRecipe := '"+recipe+"';"
			+ "INSERT INTO board_tbl"
			+ "(unq,title,userid,category,mat,recipe,rdate) "
			+ "VALUES( board_tbl_seq.nextval,'"+title+"','"+userid+"','"+category+"','"+mat+"',varRecipe,sysdate);"
			+ "end;";
			
int result = stmt.executeUpdate(sql);
if( result > 0 ) {
%>
	<script>
	alert("글이 등록되었습니다.");
	location.href = "../newMain/newmain.jsp";
	</script>
<%
}
%>









