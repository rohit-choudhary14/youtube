<%-- 
    Document   : search
    Created on : 8 Mar, 2022, 1:15:47 AM
    Author     : rohit
--%>

<%@page contentType="text/html" import="java.sql.*"  pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <%

            String email = null;
            String text = "";
            Cookie c[] = request.getCookies();
            for (int i = 0; i < c.length; i++) {
                if (c[i].getName().equals("login")) {
                    email = c[i].getValue();
                }
            }
            


        %> 

        <title>youtube</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="Visitors Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
              Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        <!-- bootstrap-css -->
        <link rel="stylesheet" href="css/bootstrap.min.css" >
        <!-- //bootstrap-css -->
        <!-- Custom CSS -->
        <link href="css/style.css" rel='stylesheet' type='text/css' />
        <link href="css/style-responsive.css" rel="stylesheet"/>
        <!-- font CSS -->
        <link href='//fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
        <!-- font-awesome icons -->
        <link rel="stylesheet" href="css/font.css" type="text/css"/>
        <link href="css/font-awesome.css" rel="stylesheet"> 
        
        <!-- //calendar -->
        <!-- //font-awesome icons -->
        <script src="js/jquery2.0.3.min.js"></script>
        
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>



        <style>
            .login-form {
                width: 340px;
                margin: auto;
                font-size: 15px;
            }
            .login-form form {
                margin-bottom: 15px;
                background: #f7f7f7;
                box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
                padding: 30px;
            }
            .login-form h2 {
                margin: 0 0 15px;
            }
            .form-control, .btn {
                min-height: 38px;
                border-radius: 2px;
            }
            .btn {        
                font-size: 15px;
                font-weight: bold;
            }
            button.input-group-addon {
                position: absolute;
                right: -38px;
                top: 0;
                padding: 2px;
                z-index: 999;
                height: 38px;
                width: 38px;
            }

        </style>

    <body>
        <%
            if (email != null) {
                     if (request.getParameter("text").length() != 0) {
                            text = request.getParameter("text");
                     }
           


        %>
        <section id="container">
            <!--header start-->
            <header class="header fixed-top clearfix" style="background-color:white">
                <!--logo start-->
                <div class="brand" style="background-color:white">
                    <a href="index.jsp" class="logo">
                        <img src="images/download.png" style="height:80px;margin-top:-25px">
                    </a>
                    <div class="sidebar-toggle-box">
                        <div class="fa fa-bars" rel="hide" ></div>
                    </div>
                </div>
                <!--logo end-->
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-sm-7" style="margin-top:2%;margin-left:3%">
                            <div class="input-group">
                                <form method="post" action="search.jsp">

                                    <input type="text"  name="text" placeholder="Search..." aria-label="search"  class="form-control"style="width:700px"  required>

                                    <button class="input-group-addon"  type="submit">
                                        <i class="fa fa-search" ></i>
                                    </button>

                                </form>
                            </div>
                        </div>

                        <div class="col-sm-2"  style="margin-top:2%;">
                            <%
                                try {

                                    Class.forName("com.mysql.jdbc.Driver");
                                    Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/youtube", "root", "");
                                    Statement st = cn.createStatement();
                                    Statement st1 = cn.createStatement();
                                    Statement st2 = cn.createStatement();
                                    ResultSet rs1 = st1.executeQuery("select * from profile where email='" + email + "' ");
                                    if (rs1.next()) {
                                        String profile_code = rs1.getString("code");
                                        String profile_name = rs1.getString("name");

                            %>

                            <a data-toggle="dropdown" class="dropdown-toggle" href="#" style="float:right">
                                <button class="btn btn-default btn-round"><img alt=""  class="img-circle"src="images1/<%=profile_code%>.jpg" width="30px">
                                    <span class="username"><%=profile_name%></span>
                                    <b class="caret"></b></button>
                            </a>
                            <ul class="dropdown-menu" style="height:100px"  >

                                <li ><a href="#"><i class=" fa fa-suitcase"></i>&nbsp;&nbsp;Profile</a></li>
                                <span style="height:20px"></span>
                                <li><a href="#"><i class="fa fa-lock"></i> &nbsp;&nbsp;change password</a></li>
                                <span style="height:20px"></span>
                                <li><a href="logout.jsp"><i class="fa fa-key"></i>&nbsp;&nbsp; Log Out</a></li>
                            </ul>

                        </div>

                        <%
                                }

                            } catch (Exception e) {
                            }

                        %>





                    </div>
                </div>

            </header>
            <!--header end-->
            <!--sidebar start-->
            <aside  >
                <div id="sidebar" class="nav-collapse"  rel="hide" >
                    <!-- sidebar menu start-->
                    <div class="leftside-navigation" style="background-color:white">

                        <ul class="sidebar-menu" id="nav-accordion">
                            <li>
                                <a  href="dashbord_create.jsp"style="color:black" >
                                    <i class="icon-dashboard" style="font-size:20px"></i>
                                    <span style="font-size:15px">Your Channel</span>
                                </a>
                            </li>



                            <li>
                                <a style="cursor:pointer;color:black" >
                                    <i class="fas fa-basketball-ball" style="font-size:20px"></i>
                                    <span style="font-size:15px">Sports</span>
                                </a>
                            </li>
                            <li>
                                <a style="cursor:pointer;color:black" >
                                    <i class="fa fa-save" style="font-size:20px"></i>
                                    <span style="font-size:15px">Saved</span>
                                </a>
                            </li>
                            <li>
                                <a style="cursor:pointer;color:black" >
                                    <i class="fa fa-question-circle" style="font-size:20px"></i>
                                    <span style="font-size:15px">Help</span>
                                </a>
                            </li>
                            <li>
                                <a style="cursor:pointer;color:black" >
                                    <i class="fa fa-flag" style="font-size:20px"></i>
                                    <span style="font-size:15px">Report history</span>
                                </a>
                            </li>
                            <li>
                                <a style="cursor:pointer;color:black" href="index.jsp">
                                    <i class="fa fa-cog" style="font-size:20px"></i>
                                    <span style="font-size:15px"> setting</span>
                                </a>
                            </li>
                        </ul>            </div>
                    <!-- sidebar menu end-->
                </div>
            </aside>



            <section id="main-content"style="background-color:#FAF9F9">
                <section class="wrapper" >

                    <div class="container-fluid" >



                        <%
                            try {
                                String channel_code = " ";
                                String title = " ";
                                String vedio_description = " ";
                                String dat = " ";
                                int flag = 0;
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/youtube", "root", "");

                                Statement st3 = cn.createStatement();
                                Statement st2 = cn.createStatement();
                                Statement st1 = cn.createStatement();
                                ResultSet rs3 = st3.executeQuery("select * from vedio where title like '%" + text + "%' AND status='1'");
                                while (rs3.next()) {
                                    flag = 1;
                                    String vedio_code = rs3.getString("code");
                                    title = rs3.getString("title");
                                    dat = rs3.getString("dt");
                                    String channel_name = "";

                                    channel_code = rs3.getString("channel_code");
                                    vedio_description = rs3.getString("description");
                                    int views_count = 0;
                                    ResultSet rs5 = st2.executeQuery("select count(*) from views where vedio_code='" + vedio_code + "'");
                                    if (rs5.next()) {
                                        views_count = rs5.getInt(1);
                                    }
                                    ResultSet rs = st1.executeQuery("select * from channel where code='" + channel_code + "'");
                                    if (rs.next()) {

                                        channel_name = rs.getString("channel_name");

                                    }

                        %>
                        <div class="row" >

                            <div class="col-sm-5"style="margin-top:2%"  >
                                <a href="vedio_play_secreen.jsp?code=<%=vedio_code%>&title= <%=title%>& date= <%=dat%>" style="color:black" >
                                    <video   width="400" 
                                             height="250" 
                                             poster=
                                             "thumbnale/<%=vedio_code%>.jpg">
                                        <source src=
                                                "channelvedio/<%=vedio_code%>.mp4"
                                                accesskey=""  type="video/mp4">
                                    </video> 
                                </a>

                            </div> 
                            <div class="col-sm-7"style="margin-top:3%" >
                                <a href="vedio_play_secreen.jsp?code=<%=vedio_code%>&title= <%=title%>& date= <%=dat%>" style="color:black" >

                                    <div class="row">
                                        <div class="col-sm-12">
                                            <h4><b><%=title%></b></h4>
                                        </div>
                                        <div class="col-sm-12" style="height:10px">

                                        </div>
                                        <div class="col-sm-12">
                                            <span><%=views_count%>&nbsp;views.</span>
                                            <span><%=dat%></span>
                                        </div>
                                        <div class="col-sm-12" style="height:10px">

                                        </div>
                                        <div class="col-sm-12">
                                            <img src="channel_images/<%=channel_code%>.jpg" width="30px" height="30px" class="img-circle">&nbsp; 

                                            <spna><%=channel_name%></spna>&nbsp;<i class="fa fa-check-circle"></i>
                                        </div>
                                        <div class="col-sm-12" style="height:10px">

                                        </div>
                                        <div class="col-sm-12">
                                            <%
                                                if (vedio_description.length() > 150) {
                                            %>
                                            <%=vedio_description.substring(0, 150)%>

                                            <%
                                            } else {
                                            %>
                                            <%=vedio_description%>

                                            <%


                                                }

                                            %>
                                        </div>
                                    </div>




                                </a>
                            </div>    



                        </div>

                        <%

                            }
                            if (flag == 0) {

                        %>
                        <div class="col-sm-12" style="height:500px" >
                            <center><i class="fa fa-search" style="font-size:24px;margin-top:30%;"> <span >No Result Found</span></i></center>
                        </div>
                        
                        
                        <%
                                
                            }
                             if (flag == 1) {

                        %>
                        <div class="col-sm-12" style="height:210px" >
                           
                        </div>
                        
                        
                        <%
                                
                            }
                                
                                
                                
                                %>
                    </div>
                </section>
               
        </section>
    </section> 
    <script src="js/bootstrap.js"></script>
    
    <script src="js/scripts.js"></script>
    <script src="js/jquery.slimscroll.js"></script>
    <script src="js/jquery.nicescroll.js"></script>
    <!--[if lte IE 8]><script language="javascript" type="text/javascript" src="js/flot-chart/excanvas.min.js"></script><![endif]-->
    <script src="js/jquery.scrollTo.js"></script>
    <!-- morris JavaScript -->	
   
    <!-- //calendar -->
    <%

        } catch (Exception e) {
        }

    } else {
                    if (request.getParameter("text").length() != 0) {
                            text = request.getParameter("text");
                     }
                    else{
                        response.sendRedirect("index.jsp");
                    }

    %>

   <section id="container" >
        <!--header start-->
        <header class="header fixed-top clearfix" style="background-color:white">
            <!--logo start-->
            <div class="brand" style="background-color:white">
                <a href="index.jsp" class="logo">
                    <img src="images/download.png" style="height:80px;margin-top:-25px">
                </a>
                <div class="sidebar-toggle-box">
                    <div class="fa fa-bars" ></div>
                </div>
            </div>
           
          <div class="container-fluid">
              <div class="row">
                  <div class="col-sm-5" style="margin-top:2%;margin-left:3%">
                        <div class="input-group">
                            <form method="post" action="search.jsp">
                               
                                    <input type="text"  name="text" placeholder="Search..." aria-label="search"  class="form-control"style="width:500px"  required>
                                
                                <button class="input-group-addon"  type="submit">
                                    <i class="fa fa-search" ></i>
                                </button>
                               
                            </form>
                         </div>
                      </div>
                  <div class="col-sm-2"  style="margin-top:2%;">
                        <button class="btn btn-danger btn-block" data-toggle="modal"  id="register_icon"data-target="#myModal1"style="float:right;"><i class="fa fa-user-circle" id="register_icon_user"style=""></i>&nbsp;<span style="">SIGN UP</span></button>
                        
                    </div>
                      <div class="col-sm-2"  style="margin-top:2%;">
                            <button class="btn btn-primary btn-block" data-toggle="modal" id="login_icon"data-target="#myModal"style=""><i class="fa fa-user-circle" style=""></i>&nbsp;<span style="">SIGN IN</span></button>
                         
                        </div>
                    
                    
                  
                  
                  
                      
              </div>
          </div>
        </header>
        <!--header end-->
        <!--sidebar start-->
         <aside >
            <div id="sidebar" class="nav-collapse" style="background-color:white">
                <!-- sidebar menu start-->
                <div class="leftside-navigation">
                    <ul class="sidebar-menu" id="nav-accordion">
                         <li>
                            <a style="cursor:pointer;color:black" href="index.jsp">
                                <i class="fa fa-home" style="font-size:20px"></i>

                                <span style="font-size:15px" >Home</span>
                                <!-- Button to Open the Modal -->



                            </a>
                        </li>
                       


                        <li>
                            <a style="cursor:pointer;color:black" >
                                <i class="fas fa-basketball-ball" style="font-size:20px"></i>
                                <span style="font-size:15px">Sports</span>
                            </a>
                        </li>
                        <li>
                            <a style="cursor:pointer;color:black" >
                                <i class="fa fa-save" style="font-size:20px"></i>
                                <span style="font-size:15px">Saved</span>
                            </a>
                        </li>
                         <li>
                            <a style="cursor:pointer;color:black" >
                                <i class="fa fa-question-circle" style="font-size:20px"></i>
                                <span style="font-size:15px">Help</span>
                            </a>
                        </li>
                         <li>
                            <a style="cursor:pointer;color:black" >
                                <i class="fa fa-flag" style="font-size:20px"></i>
                                <span style="font-size:15px">Report history</span>
                            </a>
                        </li>
                        <li>
                            <a style="cursor:pointer;color:black" href="index.jsp">
                                <i class="fa fa-cog" style="font-size:20px"></i>
                                <span style="font-size:15px"> setting</span>
                            </a>
                        </li>
                    </ul>            </div>
                <!-- sidebar menu end-->
            </div>
        </aside>
        

        <section id="main-content"style="background-color:#FAF9F9">
        
            <!-- //market-->
            <!-- The Modal -->
            <div class="modal" id="myModal">
                <div class="modal-dialog">
                    <div class="modal-content">

                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h4 class="modal-title">Sign in</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>

                        <!-- Modal body -->
                        <div class="modal-body">

                            <div class="login-form">
                                <form action="check_login.jsp" method="post">

                                    <div class="form-group">
                                        <label>Email:</label>
                                        <input type="email"  name="email"class="form-control"required="required">
                                    </div>
                                    <div class="form-group">
                                        <label>Password:</label>
                                        <input type="password" name="pass" class="form-control" placeholder="Password" required="required">
                                    </div>
                                    <div class="form-group">
                                        <button type="submit" class="btn btn-primary btn-block">Log in</button>
                                    </div>
                                    <div class="clearfix">
                                        <label class="float-left form-check-label"><input type="checkbox"> Remember me</label>
                                        <a href="#" class="float-right">Forgot Password?</a>
                                    </div>        
                                </form>
                                <p class="text-center"><a href="register.jsp">Create an Account</a></p>
                            </div>

                        </div>


<!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    </div>
                    </div>



                    

                </div>
            </div>
            <!-- The Modal -->
            <div class="modal" id="myModal1">
                <div class="modal-dialog">
                    <div class="modal-content">

                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h4 class="modal-title">Register</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>

                        <!-- Modal body -->
                        <div class="modal-body">

                            <div class="login-form">
                                <form action="check.jsp" method="post">

                                    <div class="form-group">
                                        <label>Name:</label>
                                        <input type="text"  name="user"class="form-control"required="required">
                                    </div>
                                    <div class="form-group">
                                        <label>Email:</label>
                                        <input type="email"  name="email"class="form-control"required="required">
                                    </div>
                                    <div class="form-group">
                                        <label>Password:</label>
                                        <input type="password" name="pass" class="form-control" placeholder="Password" required="required">
                                    </div>
                                    <div class="form-group">
                                        <label>Confirm-Password:</label>
                                        <input type="password" name="cpass" class="form-control" placeholder="Password" required="required">
                                    </div>
                                    <div class="form-group">
                                        <button type="submit" class="btn btn-success btn-block">Sign up</button>
                                    </div>

                                </form>

                            </div>

                        </div>

 <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    </div>

                    </div>



                   

                </div>
            </div>
            
                <section class="wrapper" >

                    <div class="container-fluid" >



                        <%
                            try {
                                String channel_code = " ";
                                String title = " ";
                                String vedio_description = " ";
                                String dat = " ";
                                int flag = 0;
                              
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/youtube", "root", "");

                                Statement st3 = cn.createStatement();
                                Statement st2 = cn.createStatement();
                                Statement st1 = cn.createStatement();
                                ResultSet rs3 = st3.executeQuery("select * from vedio where title like '%" + text+ "%' AND status='1'");
                                while (rs3.next()) {
                                    flag = 1;
                                    String vedio_code = rs3.getString("code");
                                    title = rs3.getString("title");
                                    dat = rs3.getString("dt");
                                    String channel_name = "";

                                    channel_code = rs3.getString("channel_code");
                                    vedio_description = rs3.getString("description");
                                    int views_count = 0;
                                    ResultSet rs5 = st2.executeQuery("select count(*) from views where vedio_code='" + vedio_code + "'");
                                    if (rs5.next()) {
                                        views_count = rs5.getInt(1);
                                    }
                                    ResultSet rs = st1.executeQuery("select * from channel where code='" + channel_code + "'");
                                    if (rs.next()) {

                                        channel_name = rs.getString("channel_name");

                                    }

                        %>
                        <div class="row" >

                            <div class="col-sm-5"style="margin-top:2%"  >
                                <a href="vedio_play.jsp?code=<%=vedio_code%>&title= <%=title%>& date= <%=dat%>" style="color:black" >
                                    <video   width="400" 
                                             height="250" 
                                             poster=
                                             "thumbnale/<%=vedio_code%>.jpg">
                                        <source src=
                                                "channelvedio/<%=vedio_code%>.mp4"
                                                accesskey=""  type="video/mp4">
                                    </video> 
                                </a>

                            </div> 
                            <div class="col-sm-7"style="margin-top:3%" >
                                <a href="vedio_play.jsp?code=<%=vedio_code%>&title= <%=title%>& date= <%=dat%>" style="color:black" >

                                    <div class="row">
                                        <div class="col-sm-12">
                                            <h4><b><%=title%></b></h4>
                                        </div>
                                        <div class="col-sm-12" style="height:10px">

                                        </div>
                                        <div class="col-sm-12">
                                            <span><%=views_count%>&nbsp;views.</span>
                                            <span><%=dat%></span>
                                        </div>
                                        <div class="col-sm-12" style="height:10px">

                                        </div>
                                        <div class="col-sm-12">
                                            <img src="channel_images/<%=channel_code%>.jpg" width="30px" height="30px" class="img-circle">&nbsp; 

                                            <spna><%=channel_name%></spna>&nbsp;<i class="fa fa-check-circle"></i>
                                        </div>
                                        <div class="col-sm-12" style="height:10px">

                                        </div>
                                        <div class="col-sm-12">
                                            <%
                                                if (vedio_description.length() > 150) {
                                            %>
                                            <%=vedio_description.substring(0, 150)%>

                                            <%
                                            } else {
                                            %>
                                            <%=vedio_description%>

                                            <%


                                                }

                                            %>
                                        </div>
                                    </div>




                                </a>
                            </div>    



                        </div>

                        <%

                            }
                            if (flag == 0) {

                        %>
                        <div class="col-sm-12" style="height:500px" >
                            <center><i class="fa fa-search" style="font-size:24px;margin-top:30%;"> <span >No Result Found</span></i></center>
                        </div>
                        
                        
                        <%
                                
                            }
                             if (flag == 1) {

                        %>
                        <div class="col-sm-12" style="height:210px" >
                           
                        </div>
                        
                        
                        <%
                                
                            }
                                
                                
                                
                                %>
                    </div>
                </section>
               
        </section>
    </section> 
    <script src="js/bootstrap.js"></script>
    <script src="js/jquery.dcjqaccordion.2.7.js"></script>
    <script src="js/scripts.js"></script>
    <script src="js/jquery.slimscroll.js"></script>
    <script src="js/jquery.nicescroll.js"></script>
    <!--[if lte IE 8]><script language="javascript" type="text/javascript" src="js/flot-chart/excanvas.min.js"></script><![endif]-->
    <script src="js/jquery.scrollTo.js"></script>
    <!-- morris JavaScript -->	
    <script>
        $(document).ready(function() {
        //BOX BUTTON SHOW AND CLOSE
        jQuery('.small-graph-box').hover(function() {
        jQuery(this).find('.box-button').fadeIn('fast');
        }, function() {
        jQuery(this).find('.box-button').fadeOut('fast');
        });
        jQuery('.small-graph-box .box-close').click(function() {
        jQuery(this).closest('.small-graph-box').fadeOut(200);
        return false;
        });

        //CHARTS
        function gd(year, day, month) {
        return new Date(year, month - 1, day).getTime();
        }

        graphArea2 = Morris.Area({
        element: 'hero-area',
        padding: 10,
        behaveLikeLine: true,
        gridEnabled: false,
        gridLineColor: '#dddddd',
        axes: true,
        resize: true,
        smooth:true,
        pointSize: 0,
        lineWidth: 0,
        fillOpacity:0.85,
        data: [
        {period: '2015 Q1', iphone: 2668, ipad: null, itouch: 2649},
        {period: '2015 Q2', iphone: 15780, ipad: 13799, itouch: 12051},
        {period: '2015 Q3', iphone: 12920, ipad: 10975, itouch: 9910},
        {period: '2015 Q4', iphone: 8770, ipad: 6600, itouch: 6695},
        {period: '2016 Q1', iphone: 10820, ipad: 10924, itouch: 12300},
        {period: '2016 Q2', iphone: 9680, ipad: 9010, itouch: 7891},
        {period: '2016 Q3', iphone: 4830, ipad: 3805, itouch: 1598},
        {period: '2016 Q4', iphone: 15083, ipad: 8977, itouch: 5185},
        {period: '2017 Q1', iphone: 10697, ipad: 4470, itouch: 2038},

        ],
        lineColors:['#eb6f6f','#926383','#eb6f6f'],
        xkey: 'period',
        redraw: true,
        ykeys: ['iphone', 'ipad', 'itouch'],
        labels: ['All Visitors', 'Returning Visitors', 'Unique Visitors'],
        pointSize: 2,
        hideHover: 'auto',
        resize: true
        });


        });
    </script>
    <!-- calendar -->
    <script type="text/javascript" src="js/monthly.js"></script>
    <script type="text/javascript">
        $(window).load( function() {

        $('#mycalendar').monthly({
        mode: 'event',

        });

        $('#mycalendar2').monthly({
        mode: 'picker',
        target: '#mytarget',
        setWidth: '250px',
        startHidden: true,
        showTrigger: '#mytarget',
        stylePast: true,
        disablePast: true
        });

        switch(window.location.protocol) {
        case 'http:':
        case 'https:':
        // running on a server, should be good.
        break;
        case 'file:':
        alert('Just a heads-up, events will not work when run locally.');
        }

        });
    </script>
    <!-- //calendar -->
    <%

            } catch (Exception e) {
            }

        }

    %>
</body>
</html>

