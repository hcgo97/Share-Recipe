<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/dbCon.jsp" %>

<!-- 검색기능,제외기능-->
<%
String idcheck = request.getParameter("idcheck");
String searchText = request.getParameter("searchText");// 검색 단어
String division = request.getParameter("division"); // 검색 분류
String chk = request.getParameter("notin");

String sql = "select unq,id,title,category,mat,recipe,hits,to_char(rdate,'yyyy-mm-dd') rdate from board_tbl ";
				if(division != null && chk == null) {
				String[] array = searchText.split(",");
				sql += " where "+division+" like '";
				if(array != null){
					for(int i = 0; i<array.length; i++){
						if(i == array.length-1  ){
							sql += "%"+array[i]+"%' ";
						}else{
							sql += "%"+array[i];
							}
						}
				}else{
					sql += "%"+searchText+"%' ";

				}
			}
			if(division != null && chk != null ){
				sql += " where "+division+" " + " not like '%"+searchText+"%' " ;	
			}
			sql += " order by unq desc" ;
			
			
ResultSet rs = stmt.executeQuery(sql);


if(searchText == null) {
searchText ="";	
}
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색창</title>

<script type="text/javascript" src="jquery/lib/jquery.js"></script>
<script type='text/javascript' src='jquery/lib/jquery.bgiframe.min.js'></script>
<script type='text/javascript' src='jquery/lib/jquery.ajaxQueue.js'></script>
<script type='text/javascript' src='jquery/jquery.autocomplete.js'></script>
<link rel="stylesheet" type="text/css" href="jquery/jquery.autocomplete.css" />

</head>
<script>
function fn_search(){	
	var f = document.frm_search;
	if (f.searchText.value == "") {
		alert ("검색어를 입력해주세요");
		f.searchText.focus();
		return false;
		
	}
	if(f.division.value == "") {
		alert ("분류를 선택해주세요");
		f.division.focus();
		history.back();
		return false;
	}
		alert("검색이 완료되었습니다.");
		f.submit();
	}

 </script>

<body>
	<script>
	var availableTags = [
							'계란',
							'계란볶음밥',
							'계란국',
							'계란찜',
							'떡',
							'치킨',
							'닭고기',
							'돼지고기',
							'소고기',
							'당근',
							'양파',
							'고구마',
							'감자',
							'식빵',
							'라면',
							'치즈',
							'파스타',
							'토마토',
							'스팸',
							'김치',
							'까르보나라',
							'짬뽕',
							'짜장면'
						];
	</script>
	
	<form name = "frm_search" method="post" >
			
		<select name="division">
 		<option value="" selected>===선택 === </option>
 		<option value="title">제목</option>
		<option value="mat">재료</option>
		<option value="recipe">레시피</option>
		</select>
	
 		<input type = "text" id="searchbox" name="searchText" value="<%=searchText %>" class="text" placeholder="검색어를 입력하세요" >
		<input type="hidden" id="idcheck" value="<%=idcheck %>">
		<input type = "submit" id="submit" value = "검색" onclick="fn_search()">
		<label><input type="checkbox" name="notin" value="제외">제외하기</label>
		<table border = "1">		
			<%
			while(rs.next()){
			int unq = rs.getInt("unq");
			String id = rs.getString("id");
			String pass = rs.getString("pass");
			String title = rs.getString("title");
			String category = rs.getString("category");
			String mat = rs.getString("mat");
			String recipe = rs.getString("recipe");
			String rdate = rs.getString("rdate");
			%>
			<tr>
				<td><%=id %></td>
				<td><%=pass %>></td>
				<td><%=title %></td>
				<td><%=category %></td>
				<td><%=mat %></td>
				<td><%=rdate %></td>
			</tr>
			<%
			} 
			%>
			
		</table>
	</form>
	
	<script>
	$(document).ready(function() {
	    $("#searchbox").autocomplete(availableTags,{ 
	        matchContains: true,
	        selectFirst: false
	    });
	});
	</script>
	
</body>
</html>