<%-- 
    Document   : vedio_play
    Created on : 26 Feb, 2022, 10:13:50 PM
    Author     : rohit
--%>

<%@page contentType="text/html"import="java.sql.*" pageEncoding="UTF-8"%>

<%
    String email = null;
    String vedio_code = "";
    String vedio_title = "";

    Cookie c[] = request.getCookies();
    for (int i = 0; i < c.length; i++) {
        if (c[i].getName().equals("login")) {
            email = c[i].getValue();
        }
    }

    if (request.getParameter("code").length() != 0 || request.getParameter("title").length() != 0) {
        vedio_code = request.getParameter("code");
        vedio_title = request.getParameter("title");

    }
    

%>
<!DOCTYPE html>
<head>
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
</head>
<script>
    $(document).ready(function() {
         $("#show_more").on("click",function(){
             $("#show_more").hide();
             $("#sub_comment").hide();
             $("#show_less").show();
             
         });
          $("#show_less").on("click",function(){
             $("#show_more").show();
             $("#sub_comment").show();
             $("#show_less").hide();
             
         });

        $(".fa.fa-angle-down").on("click", function() {
            var id = $(this).attr("id");
            if (id == "down") {
                $("#description").hide();
                $(".link").attr("id", "descriptionshow");
                $(".fa.fa-angle-down").attr("id", "up");

            }
            else {
                $("#descriptionshow").show();
                $(".link").attr("id", "description");
                $(".fa.fa-angle-down").attr("id", "down");

            }


        });
       
        $(".fa.fa-thumbs-up").on("click", function() {

            $("#myModal").modal();

        });
        $(".fa.fa-thumbs-down").on("click", function() {

            $("#myModal").modal();

        });
        $("#comment_post").on("click",function(){
        $("#myModal").modal();
        });
        

    });



</script>
<body>
    <section id="container" >
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
                         <button class="btn btn-danger btn-block" data-toggle="modal" data-target="#myModal1"style="float:right;"><i class="fa fa-user-circle"></i>&nbsp;<span >SIGN UP</span></button>
                       
                    </div>
                      <div class="col-sm-2"  style="margin-top:2%;">
                            <button class="btn btn-primary btn-block" data-toggle="modal" data-target="#myModal"><i class="fa fa-user-circle" ></i>&nbsp;<span >SIGN IN</span></button>
                         
                        </div>
                    
                    
                         
                    



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
                            <a style="cursor:pointer;color:black" href="index.jsp">
                                <i class="fa fa-home" style="font-size:20px"></i>

                                <span style="font-size:15px"  >Home</span>
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
            <section class="wrapper">
                <!-- //market-->

                <div class="container-fluid">

                    <div class="row">

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
                                            <p class="text-center"><a style="cursor:pointer" id="create_account" >Create an Account</a></p>
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


                        <div class="col-sm-7" style="margin-top:20px;" >
                            <div class="row">
                            <%
                                try {
                                    String channel_name = " ";
                                    String channel_code = " ";
                                    int count = 0;
                                    int count1 = 0;
                                    Class.forName("com.mysql.jdbc.Driver");
                                    Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/youtube", "root", "");
                                    Statement st = cn.createStatement();
                                    Statement st1 = cn.createStatement();
                                    Statement st2 = cn.createStatement();
                                    Statement st3 = cn.createStatement();
                                    Statement st4 = cn.createStatement();
                                    Statement st5 = cn.createStatement();
                                    Statement st9 = cn.createStatement();
                                    Statement st10 = cn.createStatement();

                                    ResultSet rs4 = st4.executeQuery("select count(*) from vedio_like where vedio_code='" + vedio_code + "'");
                                    if (rs4.next()) {

                                        count = rs4.getInt(1);
                                    }
                                    ResultSet rs5 = st5.executeQuery("select count(*) from vedio_dislike where vedio_code='" + vedio_code + "'");
                                    if (rs5.next()) {

                                        count1 = rs5.getInt(1);
                                    }
                                    ResultSet rs = st.executeQuery("select * from vedio where code='" + vedio_code + "' AND status='" + 1 + "' ");

                                    if (rs.next()) {
                                        String vedio_date = rs.getString("dt");
                                        String vedio_description = rs.getString("description");
                                        channel_code = rs.getString("channel_code");
                                        ResultSet rs2 = st2.executeQuery("select * from channel where code='" + channel_code + "'");
                                        if (rs2.next()) {
                                            channel_name = rs2.getString("channel_name");
                                        }
                            %>
                            <div class="col-sm-12">
                                
                            
                            <video width="650px" height="350px" autoplay 
                                   controls poster=
                                   "thumbnale/<%=vedio_code%>.jpg"class="img-responsive" >
                                <source src=
                                        "channelvedio/<%=vedio_code%>.mp4"
                                        accesskey=""  type="video/mp4" >
                            </video>
                             </div>
                            <%
                                int views_count = 0;
                                ResultSet rs3 = st2.executeQuery("select count(*) from views where vedio_code='" + vedio_code + "'");
                                if (rs3.next()) {
                                    views_count = rs3.getInt(1);
                                }


                            %>
                            <div class="col-sm-12" style="margin-top:2%">
                                 <b>
                                            <h4><%=vedio_title%></h4>
                                             </b>
                            </div>
                                <div class="col-sm-12" style="margin-top:2%">
                                    <div class="row">
                                        <div class="col-sm-4">
                                              <b> <%=views_count%>&nbsp;views.&nbsp; <%=vedio_date%></b> 
                                        </div>
                                    
                                                   <div class="col-sm-2"> 
                                                    <i class="fa fa-thumbs-up" style="font-size:20px;border-color:white"><%=count%> </i>
                                                   </div>
                                                <div class="col-sm-2"> 
                                                    <i class="fa fa-thumbs-down" style="font-size:20px"><%=count1%></i>
                                                </div>
                                                <div class="col-sm-2"> 
                                                    <i class="fa fa-share"style="font-size:20px"></i>
                                                </div>
                                                 <div class="col-sm-2">
                                                        <i  class="fa fa-ellipsis-h"  style="float:right"aria-hidden="true"  role="button"></i>
                                                    </div>
                                                   
                                  
                                
                                </div>
                                </div>
                             <div class="col-sm-12" style="margin-top:2%">
                                
                                 <%
                                           if(vedio_description.length()>100){
                                               %>
                                            <span id="sub_comment"><%=vedio_description.substring(0,90)%>
                                               </span>
                                               <span id="show_more" style="cursor:pointer" ><b>.....more</b></span>
                                               
                                               <span style="display:none" id="show_less"> <%=vedio_description%><br><span style="cursor:pointer"><b>show less</b></span></span>       
                                               
                                               
                                               <% 
                                           }
                                        else{
                                        %>
                                        
                                         <%=vedio_description%>
                                         
                                        
                                        <%
                                        
                                        }
                                           %>
                                    </div>
                                     <div class="col-sm-12"  style="margin-top:2%">
                                       
                                          <img src="channel_images/<%=channel_code%>.jpg"  width="40px" height="40px" class="img-circle">
                                        
                                         <span > <%=channel_name%>
                                         <i class="fa fa-check-circle" ></i></span>
                                          <span style="float:right;"><button class="btn btn-danger" style="background-color:red" >SUBSCRIBE</button></span>
                                        
                                     </div>
                                        
                                          <%
                                            int total_comment = 0;
                                            ResultSet rs1 = st.executeQuery("select count(*) from comment where  vedio_code='" + vedio_code + "' ORDER BY RAND()");
                                            if (rs1.next()) {
                                                total_comment = rs1.getInt(1);

                                            }



                                        %>
                                 

                           



                           
                               
                                        <div class="col-sm-12" style="height:1px;background-color:#F1F2F4;margin-top:2%">
                                            
                                        </div>
                               
                          
                                       
                                            <div class="col-sm-12" style="margin-top:2%">
                                                <div class="row">
                                                    <div class="col-sm-12">
                                                         <h3><span id="count"><%=total_comment%></span>&nbsp;&nbsp;Comments </h3>
                               
                                                    </div>
                                                    <div class="col-sm-12" style="margin-top:2%">
                                                        <textarea rows="2" class="form-control"  placeholder="Add a comment..."style="resize:none;" id="<%=channel_code%>"  rel="<%=vedio_code%>"  rel1="" class="textarea"></textarea>
                                                    </div>
                                                    <div class="col-sm-12"style="margin-top:1%">
                                                        <button class="btn btn-primary" id="comment_post">Post</button>
                                   
                                                    </div>
                                                </div>
                                     
                                    
                                           
                                        </div>
                                    </div>
                            <div class="row">
                                <div class="col-sm-12" style="height:20px"> 
                                </div>
                                <div class="col-sm-12">
                                    <div class="col-sm-2" id="img"> 
                                    </div>
                                    <div class="col-sm-8">
                                        <span id="name"></span>
                                        <span id="dat"></span>

                                    </div>

                                    <div class="col-sm-2"></div>
                                    <div class="col-sm-2"></div> 
                                    <div class="col-sm-6" id="comm" >

                                    </div>
                                    <div class="col-sm-2" ></div> 

                                    <div class="col-sm-2"></div> 
                                </div>     

                                <%
                                    String email_profile = " ";
                                    String user_name = " ";
                                    String user_code = "  ";
                                    String date_time = " ";
                                    String msg = " ";
                                    ResultSet rs9 = st9.executeQuery("select * from comment where channel_code='" + channel_code + "' AND vedio_code='" + vedio_code + "'");
                                    while (rs9.next()) {

                                        msg = rs9.getString("comment");
                                        email_profile = rs9.getString("email");
                                        date_time = rs9.getString("dt_time");
                                        ResultSet rs10 = st10.executeQuery("select * from profile where email='" + email_profile + "'");
                                        while (rs10.next()) {
                                            user_name = rs10.getString("name");
                                            user_code = rs10.getString("code");





                                %>
                                <div class="col-sm-12" style="height:20px">

                                </div>
                                <div class="col-sm-12" >
                                    <div class="col-sm-2"  > 
                                        <img src="images1/<%=user_code%>.jpg" width="70px"height="50px" class="img-circle">
                                    </div>


                                    <div class="col-sm-8"  ><%=user_name%>:<%=date_time%></div>
                                    <div class="col-sm-2"></div>
                                    <div class="col-sm-2"></div>
                                    <div class="col-sm-8" >
                                        <%=msg%>

                                    </div>

                                    <div class="col-sm-2">
                                        <div class="col-sm-2" >
                                            <div class="dropdown show">
                                                <i  class="fa fa-ellipsis-v" aria-hidden="true"  role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">

                                                </i>

                                                <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">



                                                    <li><span class="fa fa-flag" style="margin-left:20px;font-size:15px"> &nbsp;&nbsp;Report</span></li>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-8">

                                    </div>
                                </div>


                                <%
                                        }
                                    }
                                %>
                            </div>

                        </div>
                        <div class="col-sm-5" style="margin-top:20px;">
                            <%
                                }

                                int status = 1;
                                ResultSet rs1 = st1.executeQuery("select * from vedio where code<>'" + vedio_code + "' AND status=" + status + " ORDER BY RAND()");
                                while (rs1.next()) {

                                    String name_channel = " ";
                                    String name_channel_code = " ";
                                    String channel_code_name = " ";
                                    String code = rs1.getString("code");
                                    String title = rs1.getString("title");
                                    String date = rs1.getString("dt");
                                    name_channel_code = rs1.getString("channel_code");
                                    ResultSet rs3 = st3.executeQuery("select * from channel where code='" + name_channel_code + "' ");
                                    if (rs3.next()) {
                                        name_channel = rs3.getString("channel_name");
                                        channel_code_name = rs3.getString("code");
                                    }
                                    int views_count = 0;
                                    ResultSet rs6 = st3.executeQuery("select count(*) from views where vedio_code='" + code + "'");
                                    if (rs6.next()) {
                                        views_count = rs6.getInt(1);
                                    }

                            %>
                            <div class="row">
                                <div class="col-sm-6">
                                    <a href="vedio_play.jsp?code=<%=code%>&title= <%=title%>" style="color:black"> 

                                        <video  width="200px"

                                                poster=
                                                "thumbnale/<%=code%>.jpg"  class="img-fluid">
                                            <source src=
                                                    "channelvedio/<%=code%>.mp4"
                                                    accesskey=""  type="video/mp4">
                                        </video>
                                    </a>
                                </div>
                                <div class="col-sm-6">
                                    <%
                                        if (title.length() < 30) {
                                    %>
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <b><%=title%></b>
                                        </div>
                                        <div class="col-sm-12">
                                            
                                            <%=name_channel%> 
                                        </div>
                                        <div class="col-sm-12" style="height:2px">

                                        </div>
                                        <div class="col-sm-4">
                                            <span><%=views_count%>&nbsp;VIEWS</span>
                                        </div>
                                        <div class="col-sm-8">
                                            <span>.&nbsp;<%=date%></span>
                                        </div>
                                    </div>


                                    <% } else {

                                    %>

                                    <div class="row">
                                        <div class="col-sm-12">
                                            <b><%=title.substring(0, 30)%></b>

                                        </div>
                                        <div class="col-sm-12">
                                        
                                            <%=name_channel%> 
                                        </div>
                                        <div class="col-sm-12" style="height:2px">

                                        </div>
                                        <div class="col-sm-4">
                                            <span><%=views_count%>&nbsp;VIEWS</span>
                                        </div>
                                        <div class="col-sm-8">
                                            <span>.&nbsp;<%=date%></span>
                                        </div>
                                    </div>

                                    <%  }
                                    %>
                                </div>
                               










                            </div>



                            <%
                                }
                            %>


                        </div>
                        <%
                            } catch (Exception e) {
                            }
                        %>
                    </div>
                    <div class="clearfix"> </div>
                </div>	

            </section>
          
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
            smooth: true,
            pointSize: 0,
            lineWidth: 0,
            fillOpacity: 0.85,
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
            lineColors: ['#eb6f6f', '#926383', '#eb6f6f'],
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
        $(window).load(function() {

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

            switch (window.location.protocol) {
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
</body>
</html>
