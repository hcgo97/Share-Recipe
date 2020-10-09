<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/dbCon.jsp" %>


<!-- 게시판 스크립트 -->

<%
int unit = 10;

String page1 = request.getParameter("page");
if ( page1 == null || page1.equals("") ) {
	page1 = "1";
}
int viewPage = Integer.parseInt(page1);

// viewPage : 1-1 * 10 + 1 => 1,10
// viewPage : 2-1 * 10 + 1 => 11,20
// viewPage : 3-1 * 10 + 1 => 21,30
//   endIdx => startIdx + (10-1)
int startIdx = (viewPage - 1) * unit + 1 ;
int endIdx = startIdx + (unit-1);
%>
<!-- 게시판 -->
<%
String idcheck = request.getParameter("idcheck");
String searchText = request.getParameter("searchText");// 검색 단어
String division = request.getParameter("division"); // 검색 분류
String chk = request.getParameter("notin");
%>
<%
String sqlTot = "select count(*) total from board_tbl";



if( division != null && chk == null) { 
	   sqlTot  += " where "+division+" like '%"+searchText+"%' ";
	 }
	if(division !=null && chk != null){
	   sqlTot  += " where "+division+" not like '%"+searchText+"%' ";
	}


ResultSet rsTot = stmt.executeQuery(sqlTot);
rsTot.next();
int total = rsTot.getInt("total");

//  1 page ->  total -  0;  
//  2 page ->  total - 10; (viewPage - 1 * 10)
//  3 page ->  total - 20;
//  4 page ->  total - 30;

int number = total - ( (viewPage - 1) * unit );

/*
(double)19/10 -> 1.9 -> Math.ceil(1.9) -> (int)2.0 -> 2
*/
int lastpage = (int) Math.ceil((double)total/unit);




//인기게시판
String sql = " select b.* from ( "
			+ " 	select rownum rn, a.* from ( "
			+ "			 select unq, title, userid, hits, to_char(rdate,'yyyy-mm-dd') rdate, "
			+ " 			(select count(*) from reply where board_unq = b.unq) as total "
			+ " 				from board_tbl b "
			+ "						order by hits desc) a) b "
			+ " 		where rn >= 1 and rn <= 5 " ;
		   
ResultSet rs = stmt.executeQuery(sql);

if(searchText == null) {
searchText ="";	
}
%>


<!doctype html>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>SHARE RECIPE</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="manifest" href="site.webmanifest">
    <link rel="shortcut icon" type="image/x-icon" href="../design/assets/img/favicon.ico">

	<!-- CSS here -->
	<link rel="stylesheet" href="../design/assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="../design/assets/css/owl.carousel.min.css">
	<link rel="stylesheet" href="../design/assets/css/slicknav.css">
    <link rel="stylesheet" href="../design/assets/css/flaticon.css">
    <link rel="stylesheet" href="../design/assets/css/progressbar_barfiller.css">
    <link rel="stylesheet" href="../design/assets/css/gijgo.css">
    <link rel="stylesheet" href="../design/assets/css/animate.min.css">
    <link rel="stylesheet" href="../design/assets/css/animated-headline.css">
	<link rel="stylesheet" href="../design/assets/css/magnific-popup.css">
	<link rel="stylesheet" href="../design/assets/css/fontawesome-all.min.css">
	<link rel="stylesheet" href="../design/assets/css/themify-icons.css">
	<link rel="stylesheet" href="../design/assets/css/slick.css">
	<link rel="stylesheet" href="../design/assets/css/nice-select.css">
	<link rel="stylesheet" href="../design/assets/css/style.css">
</head>

<script type="text/javascript" src="../jquery/lib/jquery.js"></script>
<script type='text/javascript' src='../jquery/lib/jquery.bgiframe.min.js'></script>
<script type='text/javascript' src='../jquery/lib/jquery.ajaxQueue.js'></script>
<script type='text/javascript' src='../jquery/jquery.autocomplete.js'></script>
<link rel="stylesheet" type="text/css" href="../jquery/jquery.autocomplete.css" />

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

    <!-- ? Preloader Start -->
    <div id="preloader-active">
        <div class="preloader d-flex align-items-center justify-content-center">
            <div class="preloader-inner position-relative">
                <div class="preloader-circle"></div>
                <div class="preloader-img pere-text">
                    <img src="../design/assets/img/logo/loder.png" alt="">
                </div>
            </div>
        </div>
    </div>
    <!-- Preloader Start -->
    <header>
        <!-- Header Start -->
        <div class="header-area header-transparent">
            <div class="main-header header-sticky">
                <div class="container-fluid">
                    <div class="menu-wrapper d-flex align-items-center justify-content-between">
                        <!-- Logo -->
                        <div class="logo">
                            <a href="newmain.jsp"><img src="../logo/logo.png" style = "width:250px; height:100px;"></a>
                        </div>
                        <!-- Main-menu -->
                        <div class="main-menu f-right d-none d-lg-block">
                            <nav>
                                <ul id="navigation">
                                    <li><a href="newmain.jsp">Home</a></li>
                                    <li><a href="../shareCategory/boardKorean.jsp">Korean</a></li>
                                    <li><a href="../shareCategory/boardWestern.jsp">Western</a></li> 
                                    <li><a href="../shareCategory/boardChinese.jsp">Chinese</a></li>
                                    <li><a href="../shareCategory/boardOther.jsp">Other</a></li>
                                </ul>
                            </nav>
                        </div>
                        <!-- Header-btn -->
                        	<%
                        	String SessionId = (String)session.getAttribute("userid");
                        	if(SessionId == null){
                        	%>
                            <a href="../shareLogin/login.jsp" class="mr-40"><i class="ti-user"></i> Login</a>
                            <a href="../shareLogin/memberWrite.jsp" class="btn">Sign Up</a>
                            <%
                        	}else{
                        	%>
                        	<table width = "50px">
                        		<tr>
                        		<td style = "color:white; padding-right:10px;" rowspan = "2" width = "30%"><i class="ti-user"></i></td>
                        		<td style = "color:white;" width = "70%"><%=SessionId %>님</td>
                        		</tr>
                        		<tr>
                        		<td><a href="../shareLogin/logout.jsp" class="mr-40">Logout</a></td>
                        		</tr>
                        	</table>
                            <a href="../shareLogin/updateForm.jsp" class="btn">My Page</a>
                        	<%
                        	}
                        %>
                        <!-- Mobile Menu -->
                        <div class="col-12">
                            <div class="mobile_menu d-block d-lg-none"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Header End -->
    </header>
    <main>
        <!--? Hero Area Start-->
        <div class="slider-area hero-bg1 hero-overly">
            <div class="single-slider hero-overly  slider-height1 d-flex align-items-center">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-xl-10 col-lg-10">
                            <!-- Hero Caption -->
                            <div class="hero__caption pt-100">
                                <h1>SHARE RECIPE</h1>
                                <p>Let's uncover the best places to eat, drink, and shop nearest to you.</p>
                            </div>
                            <!--Hero form -->
                            <form action="#" class="search-box mb-100">
                            	<div class="select-form">
                                    <div class="select-itms">
										<select name="division" style = "">
								 		<option value="" selected>===선택 === </option>
								 		<option value="title">제목</option>
										<option value="mat">재료</option>
										<option value="recipe">레시피</option>
										</select>
                                    </div>
                                </div>
                            
                                <div class="input-form">
                                    <input class = "search" type="text" id="searchbox" name="searchText" value="<%=searchText %>" placeholder="검색어 입력">
                                    <input type="hidden" id="idcheck" value="<%=idcheck %>">
                                </div>
                               
                                <div class="search-form">
                                	<button class="btn" type = "submit" id="submit" onclick="fn_search()"><i class="ti-search"></i>Search</button>
                                	<label style = "color:white"><input type="checkbox" name="notin" value="제외">제외하기</label>
                                </div>
                            </form>	
                            <!-- 카테고리 이미지 -->
                            <div class="category-img text-center">
                                <a href="../shareCategory/boardKorean.jsp"> <img src="../logo/category_korean.png"></a>
                                <a href="../shareCategory/boardWestern.jsp"> <img src="../logo/category_western.png"></a>
                                <a href="../shareCategory/boardChinese.jsp"> <img src="../logo/category_chinese.png"></a>
                                <a href="../shareCategory/boardOther.jsp"> <img src="../logo/category_other.png"></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--카테고리 이미지 End-->
        
        <!--? 인기레시피 들어갈곳 -->
        <div class="popular-location border-bottom section-padding40">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <!-- Section Title -->
                        <div class="section-tittle text-center mb-80">
                            <h2>♥ 인기레시피 ♥</h2>
                            
                            <table border = "1" width = "630px" align = "center">
						  <colgroup>
								<col width="10%"/>
								<col width="30%"/>
								<col width="20%"/>
								<col width="20%"/>
								<col width="20%"/>
							</colgroup>
							
							<tr align = "center">
								<th>번호</th>
								<th>제목</th>
								<th>글쓴이</th>
								<th>조회수</th>
								<th>등록일</th>
							</tr>

							<%
							int bestNum = 1;
							
							while( rs.next() ) {
								
								int unq = rs.getInt("unq");
								String title = rs.getString("title");
								String userid2 = rs.getString("userid");
								int hits = rs.getInt("hits");
								String rdate = rs.getString("rdate");
								int replyCnt = rs.getInt("total");
								
							%>
								
								<tr align = "center">
									<td><%=bestNum %>위</td>
									<td><a href="../shareBoard/boardDetail.jsp?unq=<%=unq %>" style="color:black"><%=title %>										
										
										<%
										if(replyCnt > 0) { //댓글수 1개부터 표시
										%>
										
										(<%=replyCnt %>)
										
										<%
										}
										%>
										
										</a></td>
									<td><a href="../shareSearch/idSearch.jsp?userid=<%=userid2 %>" style="color:black"><%=userid2 %></a></td>
									<td><%=hits %></td>
									<td><%=rdate %></td>
								</tr>
								
							<%
							bestNum++;
							}
							%>
							
							</table>
                            
                            
                        </div>
                    </div>
                    
                </div>

            </div>
        </div>
        <!-- 인기레시피 들어갈곳 -->

     
      
      
        <!--? 최근레시피 들어갈곳-->
        
        <div class="popular-location border-bottom section-padding40">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <!-- Section Tittle -->
                        <div class="section-tittle text-center mb-80">
                            <h2>♥ 최근레시피 ♥</h2>
                            
                             <table border="1" width="630px" align="center">
								<colgroup>
									<col width="10%"/>
									<col width="30%"/>
									<col width="20%"/>
									<col width="20%"/>
									<col width="20%"/>
								</colgroup>
								
								<tr align = "center">
									<th>번호</th>
									<th>제목</th>
									<th>글쓴이</th>
									<th>조회수</th>
									<th>등록일</th>
								</tr>
								
								<%
								//최근게시물
								String sql2 = "select b.* from (select rownum rn, a.* from (select unq,title,userid,category,mat,recipe,hits,to_char(rdate,'yyyy-mm-dd') rdate, (select count(*) from reply where board_unq = b.unq) as total from board_tbl b ";
								if(division != null && chk == null) {
								String[] array = searchText.split(",");
								sql2 += " where "+division+" like '";
								if(array != null){
									for(int i = 0; i<array.length; i++){
										if(i == array.length-1  ){
											sql2 += "%"+array[i]+"%' ";
										}else{
											sql2 += "%"+array[i];
											}
										}
								}else{
									sql2 += "%"+searchText+"%' ";
							
								}
							}
							if(division != null && chk != null ){
								sql2 += " where "+division+" " + " not like '%"+searchText+"%' " ;	
							}
							sql2 += " order by unq desc ) a ) b" ;
										   sql2 += "  where rn >= "+startIdx+" and rn <= "+endIdx ;
										   
								ResultSet rs2 = stmt.executeQuery(sql2);
								
								while( rs2.next() ) {
									int unq = rs2.getInt("unq");
									String title = rs2.getString("title");
									String userid2 = rs2.getString("userid");
									String category = rs2.getString("category");
									String mat = rs2.getString("mat");
									String recipe = rs2.getString("recipe");
									int hits = rs2.getInt("hits");
									String rdate = rs2.getString("rdate");
									int replyCnt2 = rs2.getInt("total");
								%>
									<tr align = "center">
										<td><%=number %></td>
										<td><a href="../shareBoard/boardDetail.jsp?unq=<%=unq %>" style = "color:black"><%=title %> 
										
										
										<%
										if(replyCnt2 > 0) { //댓글수 1개부터 표시
										%>
										
										(<%=replyCnt2 %>)
										
										<%
										}
										%>
										</a></td>
										<td><a href="../shareSearch/idSearch.jsp?userid=<%=userid2 %>" style="color:black"><%=userid2 %></a></td>
										<td><%=hits %></td>
										<td><%=rdate %></td>
									</tr>
								<%
									number--;  // 1가감 처리
								}
								%>
								
								<script>
								$(document).ready(function() {
								    $("#searchbox").autocomplete(availableTags,{ 
								        matchContains: true,
								        selectFirst: false
								    });
								});
								</script>	
								
								
							</table>
							
							<table border="0" width="600" align="center">
								<tr>
									<td align="center">
									
									<%
									for( int i=1; i<=lastpage; i++ ) {
									%>
										  <a href="../newMain/newmain.jsp?page=<%=i %>" style = "color:black"><%=i %></a> 
									<%
									}
									%>
							
									</td>
								</tr>
								
								<tr>
									<td align="right">
										<button type="button" onclick="location='../shareBoard/boardWrite.jsp'" class="genric-btn primary circle" style = "background : #B367FF;">글쓰기</button>
									</td>
								</tr>
								
							</table>
                            
                            
                        </div>
                    </div>
                    
                </div>

            </div>
        </div>
        <!-- 최근레시피 들어갈곳 -->
        
        
        
        
        <section class="wantToWork-area">
            <div class="container">
                <div class="wants-wrapper">
                    <div class="row align-items-center justify-content-between">
                        <div class="col-xl-7 col-lg-9 col-md-8">
                            <div class="wantToWork-caption wantToWork-caption2">
                                <div class="main-menu2">
                                    <nav>
                                        <ul>
                                            <li><a href="newmain.jsp">Home</a></li>
                                            <li><a href="../shareCategory/boardKorean.jsp">Korean</a></li>
                                            <li><a href="../shareCategory/boardWestern.jsp">Western</a></li> 
                                            <li><a href="../shareCategory/boardChinese.jsp">Chinese</a></li>
                                            <li><a href="../shareCategory/boardOther.jsp">Other</a></li>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-2 col-lg-3 col-md-4">
                            <a href="#" class="btn f-right sm-left">위로가기</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Want To work End -->
    </main>
    <footer>
        <div class="footer-wrapper pt-30">
            <!-- footer-bottom -->
            <div class="footer-bottom-area">
                <div class="container">
                    <div class="footer-border">
                        <div class="row d-flex justify-content-between align-items-center">
                            <div class="col-xl-10 col-lg-9 ">
                                <div class="footer-copy-right">
                                    <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">SHARE RECIPE</a>
  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>

    <!-- Scroll Up -->
    <div id="back-top" >
        <a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
    </div>

    <!-- JS here -->

    <script src="../design/assets/js/vendor/modernizr-3.5.0.min.js"></script>
    <!-- Jquery, Popper, Bootstrap -->
    <script src="../design/assets/js/vendor/jquery-1.12.4.min.js"></script>
    <script src="../design/assets/js/popper.min.js"></script>
    <script src="../design/assets/js/bootstrap.min.js"></script>
    <!-- Jquery Mobile Menu -->
    <script src="../design/assets/js/jquery.slicknav.min.js"></script>

    <!-- Jquery Slick , Owl-Carousel Plugins -->
    <script src="../design/assets/js/owl.carousel.min.js"></script>
    <script src="../design/assets/js/slick.min.js"></script>
    <!-- One Page, Animated-HeadLin -->
    <script src="../design/assets/js/wow.min.js"></script>
    <script src="../design/assets/js/animated.headline.js"></script>
    <script src="../design/assets/js/jquery.magnific-popup.js"></script>

    <!-- Date Picker -->
    <script src="../design/assets/js/gijgo.min.js"></script>
    <!-- Nice-select, sticky -->
    <script src="../design/assets/js/jquery.nice-select.min.js"></script>
    <script src="../design/assets/js/jquery.sticky.js"></script>
    <!-- Progress -->
    <script src="../design/assets/js/jquery.barfiller.js"></script>
    
    <!-- counter , waypoint,Hover Direction -->
    <script src="../design/assets/js/jquery.counterup.min.js"></script>
    <script src="../design/assets/js/waypoints.min.js"></script>
    <script src="../design/assets/js/jquery.countdown.min.js"></script>
    <script src="../design/assets/js/hover-direction-snake.min.js"></script>

    <!-- contact js -->
    <script src="../design/assets/js/contact.js"></script>
    <script src="../design/assets/js/jquery.form.js"></script>
    <script src="../design/assets/js/jquery.validate.min.js"></script>
    <script src="../design/assets/js/mail-script.js"></script>
    <script src="../design/assets/js/jquery.ajaxchimp.min.js"></script>
    
    <!-- Jquery Plugins, main Jquery -->	
    <script src="../design/assets/js/plugins.js"></script>
    <script src="../design/assets/js/main.js"></script>


    
    </body>
</html>