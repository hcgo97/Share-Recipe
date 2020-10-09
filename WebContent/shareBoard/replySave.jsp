<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../include/dbCon.jsp" %>

<%
	request.setCharacterEncoding("UTF-8");
	
	String userid = "";
	userid = (String) session.getAttribute("userid");
	
	if(userid == null) {
		%>
		<script>
		alert("로그인 후 댓글 작성이 가능합니다.");
		history.back();
		</script>
	<%
	} else {
	%>
		<%
		String replytext = request.getParameter("replytext");
		String board_unq = request.getParameter("unq");
		String replyer = request.getParameter("userid");
		
		if( replytext == null || replytext.equals("") ) {
		%>
			<script>
			alert("내용을 입력해주세요.");
			history.back(); // 이전화면 go
			</script>
		<%
			return;  // jsp stop;
		}
		
		String sql = " insert into reply "
			       + " ( replyunq,replyer,replytext,redate,board_unq) "
			       + " values "
			       + " ( reply_seq.nextval,'"+replyer+"','"+replytext+"', sysdate ,'"+board_unq+"')  ";
		
		int result = stmt.executeUpdate(sql);
		if( result > 0 ) {
		%>
			<script>
			
			alert("댓글이 작성되었습니다.");
			
			window.location = document.referrer;
		
			</script>
		<%
		}
		%>
	<%
	}
	%>

