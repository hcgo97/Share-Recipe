<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/dbCon.jsp"%>

<%
String idcheck = request.getParameter("idcheck");
String searchText = request.getParameter("searchText");// 검색 단어
if(searchText == null){
	searchText = "";
}
%>       
<!doctype html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title>로그인</title>
  <link rel="stylesheet" href="../design/assets/css/login.css" />
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


<style>
.alink{
color:black;
font-size:10px;
}
</style>

<script>

function fn_idcheck(){
   var userid = document.frm.userid.value;
   if(userid == ""){
      alert("아이디를입력해주세요.");
      document.frm.userid.focus();
      return false;
   }
   
   var url = "idcheck.jsp?userid="+userid;
   window.open(url,"aa","witdh=300,height=150");
}

function fn_submit(){
   var f = document.frm;
   
   if(f.userid.value.length < 4 || f.userid.value.length > 12){
      alert("아이디는4자~12자 사이로 입력해주세요.");
      f.userid.focus();
      return false;
   }
   if(f.pass.value == ""){
      alert("암호를 입력해주세요.");
      f.pass.focus();
      return false;
   }
   f.submit();
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


<form name= "frm" method="post" action="loginProc.jsp">      
<div class="main">

   
      <div class="logo" align="center">
         <a href="../newMain/newmain.jsp"><img src="../logo/logo.png" width="600" height="200"></a>
      </div>

      <table border="0" solid align="center" width = "600px;">
         <h1 style="text-align:center;">로그인/비밀번호 </h1>
         <colgroup>
            <col width="30%"/>
            <col width="70%"/>
         </colgroup><br>
      
         <tr>
            <th height=50 style="text-align:center;"><label for="userid" >아이디</label></th>
            <td><input class="box1" type="text" name="userid" id="userid" placeholder="아이디입력해주세요.">
            </td>
         </tr>
         
         <tr>
            <th height=50 style="text-align:center;"><label for="pass">비밀번호</label></th>
            <td><input class="box1" type="password" name="pass" id="pass" placeholder="비밀번호입력해주세요."></td>
         </tr>
         <tr>
         	<th colspan="2" style="text-align:right;">
	            		<a href  ="findIdForm.jsp"  class="alink">아이디찾기</a>
	            		<a href  ="findPassForm.jsp" class="alink">비밀번호찾기</a>
	            		&nbsp;&nbsp;&nbsp;
         	</th>
         </tr>
         <tr>
         	<th colspan="2" style=text-align:center;"><span style="color:red;"><font size ="2px">잘못된 아이디이거나 비밀번호입니다.</font></th>
         
         </tr>
      
         <tr>
            <th colspan="2">
        	  <div class=button2>
            <button class="button1" type="submit" onclick="fn_submit();return false;" >로그인</button><br>
            <input class="button1" type="button" name="signup"  value="회원가입" onclick="location='memberWrite.jsp'">
            </div>
            </th> 
         </tr>
         </table>
      </div>
      </form>
      
          <section class="wantToWork-area">
            <div class="container">
                <div class="wants-wrapper">
                    <div class="row align-items-center justify-content-between">
                        <div class="col-xl-7 col-lg-9 col-md-8">
                            <div class="wantToWork-caption wantToWork-caption2">
                                <div class="main-menu2">
                                    <nav>
                                        <ul>
                                            <li><a href="../newMain/newmain.jsp">Home</a></li>
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