<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String idcheck = request.getParameter("idcheck");
String searchText = request.getParameter("searchText");// 검색 단어
if(searchText == null){
   searchText = "";
}
%>   
<%@ include file="../include/dbCon.jsp" %>

<!-- 본문글 쿼리 -->
<%
String unq = request.getParameter("unq");

if( unq == null || unq.equals("") ) {
%>
   <script>
   alert("잘못된 접근입니다.");
   location='../newMain/newmain.jsp'; // 이전화면
   </script>
<%
   return;  // jsp 종료
}
// 조회수 증가 -> hits
String sqlUpdate = " update board_tbl set hits=hits+1 "
             + "  where unq='"+unq+"' " ;
stmt.executeUpdate(sqlUpdate);

String sql = " select title, userid, category, mat, recipe, hits, rdate from board_tbl "
         + "   where unq='"+unq+"'  ";

ResultSet rs = stmt.executeQuery(sql);
rs.next();

String title = rs.getString("title");
String userid2 = rs.getString("userid");
String category = rs.getString("category");
String mat = rs.getString("mat");
String recipe = rs.getString("recipe");
String hits = rs.getString("hits");
String rdate = rs.getString("rdate");

/* mat = mat.replaceAll("\n",","); //재료칸 콤마로만 구분되게 리플레이스
mat = mat.replaceAll(" ",","); */
mat = mat.replaceAll(", ",",");
/* mat = mat.replaceAll("/",","); */
recipe = recipe.replaceAll("\n","<br>");
//recipe = recipe.replaceAll(" ","");

/*
   --> \n --> <br>
   --> "        "  --> &nbsp;
*/


%>

<!-- 댓글 쿼리 -->
<%
String board_unq = request.getParameter("unq");

if( board_unq == null || board_unq.equals("") ) {
   return;  // jsp 종료
}


String sql2 = " select replyer,replytext,to_char(redate,'yy-mm-dd hh24:mi') redate,replyunq from reply "
         + "   where board_unq='"+board_unq+"' "
         + "      order by replyunq ";

ResultSet rs2 = stmt.executeQuery(sql2);
%>




<!doctype html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title>레시피</title>
  <link rel="stylesheet" href="../design/assets/css/boardDetail.css" />
  <link rel="stylesheet" type="text/css" href="../css/layout.css" />
     <link rel="stylesheet" href="../design/assets/css/findid.css" />
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
</head>
<style>
    div ul { margin: 0; padding: 0; list-style: none; }
    div ul li { padding: 10px 5px; font-size : 13px; text-align : center;}
</style>
<script>
function fn_submit() {
   var f = document.frm;
   if( f.title.value == "" ) {
      alert("제목을 입력해주세요.");
      f.title.focus();
      return false;
   } 

   document.frm.submit();   
}
</script>

<script>
function fn_replysubmit() {
   var replyfrm = document.replyform;
   if( replyfrm.title.value == "" ) {
      alert("내용을 입력해주세요.");
      replyfrm.replytext.focus();
      return false;
   } 

   document.replyfrm.submit();   
}
</script>
<body>
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
                            <a href="../newMain/newmain.jsp"><img src="../logo/logo.png" style = "width:250px; height:100px;"></a>
                        </div>
                        <!-- Main-menu -->
                        <div class="main-menu f-right d-none d-lg-block">
                            <nav>
                                <ul id="navigation">
                                    <li><a href="../newMain/newmain.jsp">Home</a></li>
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
          
<div class="boardDetail">

<form name="frm" method="post" action="boardWriteSave.jsp">

<table border="1" width="600" align="center">
   <tr>
      <th width="30%">제목</th>
      <td width="70%" align="left"><%=title %></td>
   </tr>
   <tr>
      <th>작성자</th>
      <td align="left"><%=userid2 %></td>
   </tr>
      <tr>
      <th width="30%">조회수</th>
      <td width="70%" align="left"><%=hits %></td>
   </tr>
      <tr>
      <th width="30%">작성일자</th>
      <td width="70%" align="left"><%=rdate %></td>
   </tr>
   <tr>
      <th>분류</th>
      <td align="left"><%=category %></td>
   </tr>
   <tr>
      <th>필요한 재료</th>
      <td align="left"><%=mat %></td>
   </tr>
   <tr>
      <th>레시피</th>
      <td align="left"><%=recipe %></td>
   </tr>
   <tr>
      <th colspan="2" style="height:30px;">
      
      <button class="button1" type="button" onclick=" location='boardModify.jsp?unq=<%=unq %>&userid=<%=userid2 %>'">수정하기</button>
      <button class="button1" type="button" onclick=" location='boardDelete.jsp?unq=<%=unq %>&userid=<%=userid2 %>'">삭제하기</button>
      <button class="button1" type="button" onclick = " location = '../newMain/newmain.jsp' ">목록으로</button>
      
      </th>
   </tr>
</table>

</form>

<br>

<!-- 댓글 -->
<div class="reply">
<table align = "center" border="0" width="600" id = "reply_area">
<colgroup>
   <col width="10%">
   <col width="60%">
   <col width="20%">
   <col width="10%">
</colgroup>
   <%
   while(rs2.next() ) {

   int replyunq = rs2.getInt("replyunq");
   String replytext = rs2.getString("replytext");
   String replyer = rs2.getString("replyer");
   String redate = rs2.getString("redate");
   replytext = replytext.replaceAll("\n","<br>");
   replytext = replytext.replaceAll(" ","&nbsp;");

/*
   --> \n --> <br>
   --> "        "  --> &nbsp;
*/
   %>

   <tr>
      <th align="center" style="width:70px;"><%=replyer %></th>

      <td align="left" style="width:340px;"><%=replytext %></td>

      <td align="center" style="width:100px; font-size:9pt"><%=redate %></td>
      
      <td align = "center"><button class="button2" style="height:30px;" type="button"
      						onclick="location='replyDelete.jsp?replyunq=<%=replyunq %>&replyer=<%=replyer %>'">삭제</button></td>      
   </tr>

</div>
   <%
   }
   %>
</table>

<form id="replyform" method="post" action="replySave.jsp">
    <input type="hidden" id="unq" name="unq" value="<%=unq %>"/>
    <input type="hidden" id="userid" name = "userid" value = "<%=session.getAttribute("userid") %>"/>
    <div class="boardDetail2">
   <table align = "center" border="0" width="600" >
         <tr>
                   <td>
                        <input type="text" id="replytext" name="replytext"
                        		style="width:520px; height:40px;" placeholder="댓글을 입력하세요."/>
                    </td>
                    
                    <td>
                        <button class="button3" type = "submit" id="reply_save" name="reply_save" align = "center"
                        		style="width:60px; height:40px;" onclick="fn_replysubmit();return false;">등록</button>
                    </td>

             </tr>
   </table>
   </div>
</form>
 </div>

</main>

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




    