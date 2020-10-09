<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String idcheck = request.getParameter("idcheck");
String searchText = request.getParameter("searchText");// 검색 단어
if(searchText == null){
   searchText = "";
}
%>    
<!doctype html>
<html>
 <head>
  <meta charset="UTF-8">
  <title>글쓰기</title>
<link rel="stylesheet" href="../design/assets/css/findid.css" />
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
<script type="text/javascript" src="../jquery/lib/jquery.js"></script>
<script type='text/javascript' src='../jquery/lib/jquery.bgiframe.min.js'></script>
<script type='text/javascript' src='../jquery/lib/jquery.ajaxQueue.js'></script>
<script type='text/javascript' src='../jquery/jquery.autocomplete.js'></script>
<link rel="stylesheet" type="text/css" href="../jquery/jquery.autocomplete.css" />
                    
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>

<!-- summernote 에디터설정 -->
<script>
   $(document).ready(function(){
      $('#summernote').summernote({
         height: 230,               //에디터 높이
         minHeight: null,            //최소 높이
         maxHeight: null,            //최대 높이
         focus: false,               //에디터 로딩후 포커스를 맞출지 여부
         lang : "ko-KR",               //한글설정
         placeholder: '내용을 입력해주세요.'   //placeholder설정
      });
   });
   
   
   /* summernote 함수설명
   
   // 서머노트에 text 쓰기
   $('#summernote').summernote('insertText', 써머노트에 쓸 텍스트);

   // 서머노트 쓰기 비활성화
   $('#summernote').summernote('disable');
   
   // 서머노트 쓰기 활성화
   $('#summernote').summernote('enable');
   
   
   // 서머노트 리셋
   $('#summernote').summernote('reset');
   
   // 마지막으로 한 행동 취소 ( 뒤로가기 )
   $('#summernote').summernote('undo');
   
   // 앞으로가기
   $('#summernote').summernote('redo');
   
   */
   
</script>

</head>

<script>
function fn_submit() {
   var f = document.frm;
   var sum = 0;
   
   //카테고리 체크여부 검사
   for(i=0; i<document.frm.category.length; i++){
      if(document.frm.category[i].checked == false){
         
         sum += sum;
      }
      else{
         sum = sum + 1;
      }
   }
   
   if(sum == 0){
      alert("카테고리를 선택해주세요.");
      return false;
   }
   if( f.title.value == "" ) {
      alert("제목을 입력해주세요.");
      f.title.focus();
      return false;
   } 
   if( f.mat.value == "" ) {
      alert("필요한 재료를 입력해주세요.");
      f.mat.focus();
      return false;
   }
   if( f.recipe.value == "" ) {
      alert("레시피를 입력해주세요.");
      f.recipe.focus();
      return false;
   }
   
   document.frm.submit();   
}
</script>

<body>
<%
   request.setCharacterEncoding("UTF-8");
   
   String userid2 = "";
   userid2 = (String) session.getAttribute("userid");
   
   if(userid2 == null) {
      %>
      <script>
      alert("로그인 후 글 작성이 가능합니다.");
      location='../shareLogin/login.jsp';
      </script>
   <%
   
   } else {
      
   %>
   
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
                              <td style = "color:white; width = "70%"><%=SessionId %>님</td>
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
 
<form name="frm" method="post" action="boardWriteSave.jsp">
<table border="1" width="600" align="center">
<input type = "hidden" name = "userid" value = "<%=userid2 %>"/>

   <tr>
      <th align = "center">제목</th>
      <td align="left"><input type="text" name="title"></td>
   </tr>
   <tr>
      <th align = "center">필요한 재료</th>
      <td align="left">
      <textarea name="mat" rows="10" cols="50" placeholder = "※쉼표로 구분해주세요."></textarea>
      </td>
   </tr>
   
   <tr>
      <th align = "center">분류</th>
      <td align = "left">
         <input type = "radio" name = "category" value = "한식"/> 한식
         <input type = "radio" name = "category" value = "양식"/> 양식
         <input type = "radio" name = "category" value = "중식"/> 중식
         <input type = "radio" name = "category" value = "기타"/> 기타
      </td>
   </tr>
   
   <tr>
      <td colspan = "2" >
         <textarea id = "summernote" name = "recipe"></textarea>
      </td>
   </tr>
   
   
   <tr>
      <th colspan="2">
      <button type="submit" onclick="fn_submit();return false;">저장</button>
      <button type="reset" onclick = "history.back();">취소</button>
      </th>
   </tr>

   
</table>
</form>
   <%
   }
   %>
   

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






    