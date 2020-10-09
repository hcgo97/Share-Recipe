<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/dbCon.jsp" %>


<%
//세션, 겟파라미터
String unq = request.getParameter("unq");
String userid3 = request.getParameter("userid");


request.setCharacterEncoding("UTF-8");

String userid2 = "";
userid2 = (String) session.getAttribute("userid");

%>


<%

if( unq == null || unq.equals("") ) {
%>
	<script>
	alert("잘못된 경로로 접근하였습니다.");
	history.back();
	</script>
<%
	return;
}
%>


<%
//로그인 안되있거나 로그인된 아이디 != 글작성자 일경우
if(userid2 == null) {
	%>
	
	<script>
		alert("로그인해주세요.");
		history.back();
	</script>
	
<%
} else if(!userid2.equals(userid3)) {
	%>
	
	<script>
		alert("삭제할 권한이 없습니다.");
		history.back();
	</script>
	
<%
} else {
	
	String sql2 = " delete from board_tbl  where unq='"+unq+"' ";
	stmt.executeUpdate(sql2);
	%>
	<script>
	alert("글이 삭제되었습니다.");
	location = "../newMain/newmain.jsp";
	</script>

<%
}
%>

