<%-- 
    Document   : edit_vedio
    Created on : 2 Mar, 2022, 10:43:38 PM
    Author     : rohit
--%>

<%@page contentType="text/html"import="java.sql.*" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%
    String email = " ";
    String name = " ";
    String profile_name = " ";
    String channel_name = " ";
    String channel_code = " ";
    String vedio_code = " ";
    Cookie c[] = request.getCookies();
    for (int i = 0; i < c.length; i++) {
        if (c[i].getName().equals("login")) {
            email = c[i].getValue();
        }
    }
    if (request.getParameter("code").length() != 0) {

        vedio_code = request.getParameter("code");
    }
    if (email != null) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/youtube", "root", "");
            Statement st1 = cn.createStatement();
            ResultSet rs = st1.executeQuery("select * from channel where email='" + email + "'");
            if (rs.next()) {

                channel_name = rs.getString("channel_name");
                channel_code = rs.getString("code");
            }
        } catch (Exception e) {
        }
%>
<HTML>
    <HEAD>                        
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
        <link rel="stylesheet" href="css/morris.css" type="text/css"/>
        <!-- calendar -->
        <link rel="stylesheet" href="css/monthly.css">

        <!-- //calendar -->
        <!-- //font-awesome icons -->
        <script src="js/jquery2.0.3.min.js"></script>
        <script src="js/raphael-min.js"></script>
        <script src="js/morris.js"></script>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>

        <style>
            .login-form {

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


    </HEAD>
    <BODY>
        <section id="container">

            <!--header start-->
            <header class="header fixed-top clearfix" style="background-color:white">
                <!--logo start-->
                <div class="brand" style="background-color:white">
                    <a href="your_channel.jsp" class="logo">
                        <img src="channel_images/<%=channel_code%>.jpg" class="img-circle" style="height:50px;margin-top:-10px">

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
                                    ResultSet rs1 = st1.executeQuery("select * from profile where email='" + email + "'");
                                    if (rs1.next()) {
                                        String profile_code = rs1.getString("code");
                                        String user_name = rs1.getString("name");

                            %>

                            <a data-toggle="dropdown" class="dropdown-toggle" href="#" style="float:right">
                                <button class="btn btn-default btn-round"><img alt=""  class="img-circle"src="images1/<%=profile_code%>.jpg" width="30px">
                                    <span class="username"><%=user_name%></span>
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
                <div id="sidebar" class="nav-collapse"  >
                    <!-- sidebar menu start-->
                    <div class="leftside-navigation" style="background-color:white">

                        <ul class="sidebar-menu" id="nav-accordion">

                            <li>
                                <a  href="vedio_play_dashbord.jsp" style="color:black">
                                    <i class="fa fa-home"  style="font-size:20px"></i>
                                    <span style="font-size:15px">Home</span>
                                </a>
                            </li>
                            <li>
                                <a  href="your_channel.jsp" style="color:black">
                                    <i class="icon-dashboard"  style="font-size:20px"></i>
                                    <span  style="font-size:15px">dashboard</span>
                                </a>
                            </li>

                            <li>
                                <a href="dashbord_create.jsp" style="color:black">
                                    <i class="glyphicon glyphicon-facetime-video" style="font-size:20px"></i>
                                    <span style="font-size:15px">Upload Video</span>
                                </a>
                            </li>

                            <li>
                                <a style="cursor:pointer;color:black" href="deleted_vedios.jsp" >
                                    <i class="fa fa-trash" style="font-size:20px"></i>
                                    <span  style="font-size:15px">Deleted videos</span>
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


            <section id="main-content"style="background-color:#FAF9F9;height:650px">
                <section class="wrapper">
                    <div class="conatiner-fluid" >  

                        <div class="row" style="margin-top:5%;" >


                            <div class="col-sm-3" ></div>

                            <%



                                try {
                                    String title = "";
                                    Class.forName("com.mysql.jdbc.Driver");
                                    Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/youtube", "root", "");
                                    Statement st1 = cn.createStatement();
                                    Statement st2 = cn.createStatement();
                                    ResultSet rs = st1.executeQuery("select * from vedio where code='" + vedio_code + "'");


                                    if (rs.next()) {

                                        title = rs.getString("title");

                                        String description = rs.getString("description");
                            %>



                            <div class="col-sm-6">
                                <div class="login-form">
                                    <form  action="update_title.jsp?code=<%=vedio_code%>" method="post">

                                        <div class="form-group">
                                            <label>Title:</label>
                                            <input type="text"  name="title"class="form-control" value="<%=title%>"required="required">
                                        </div>
                                        <div class="form-group">
                                            <label>description:</label>
                                            <textarea  rows="5" name="description"class="form-control" style="resize:none"><%=description%>
                                                                                 </TEXTAREA>
                                                                            </div>
                                                                           
                                                                            <div class="form-group">
                                                                                <button type="submit" class="btn btn-primary btn-block">Save</button>
                                                                            </div>
                                                                                   
                                                                        </form>
                                                                       
                                                                    </div>
                                           
                                           
                                           
                                       </div>
                                        
                                      
                                    
                            <%
                                }
                            %>
                                       
                                    <div class="col-sm-3"></div>            
                         
                                       
                            <%
                                } catch (Exception e) {
                                }
                            %>
                       </div>
                </div>            
                       <div class="clearfix"> </div>
		                    
               
		  	
 </section>
               <div class="footer" style="margin-top:10%">
			<div class="wthree-copyright">
			 
			</div>
		  </div>
                      
</section>
<!--main content end-->
</section> 
    <script src="js/bootstrap.js"></script>
<script src="js/jquery.dcjqaccordion.2.7.js"></script>
<script src="js/scripts.js"></script>
<script src="js/jquery.slimscroll.js"></script>
<script src="js/jquery.nicescroll.js"></script>
<!--[if lte IE 8]><script language="javascript" type="text/javascript" src="js/flot-chart/excanvas.min.js"></script><![endif]-->
<script src="js/jquery.scrollTo.js"></script>

                
</BODY>
</HTML>		
<%


    } else {
        response.sendRedirect("index.jsp");
    }
%>
