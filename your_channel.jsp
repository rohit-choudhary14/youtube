<%-- 
    Document   : your_channel
    Created on : 28 Feb, 2022, 8:39:37 PM
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
    Cookie c[] = request.getCookies();
    for (int i = 0; i < c.length; i++) {
        if (c[i].getName().equals("login")) {
            email = c[i].getValue();
        }
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
            <!--header start-->
            <header class="header fixed-top clearfix" style="background-color:white">
                <!--logo start-->
                <div class="brand" style="background-color:white">
                    <a href="vedio_play_dashbord.jsp" class="logo">
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
                    <div id="sidebar" class="nav-collapse"  rel="hide" >
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
                                    <a  href="dashbord_create.jsp"style="color:black" >
                                        <i class="icon-dashboard" style="font-size:20px"></i>
                                        <span style="font-size:15px">Your Channel</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="vedio_process.jsp" style="color:black">
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

                    <section id="main-content"style="background-color:#FAF9F9;margin-left:165px">
                        <section class="wrapper">
                            <!-- //market-->
                            <div class="modal" id="myModal">
                                <div class="modal-dialog">
                                    <div class="modal-content">

                                        <!-- Modal Header -->
                                        <div class="modal-header">
                                            <h4 class="modal-title">CUSTOMIZE CHANNEL</h4>
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        </div>

                                        <!-- Modal body -->
                                        <div class="modal-body">

                                            <div class="login-form">
                                                <form method="post" ACTION="update_channel.jsp">

                                                    <div class="form-group">
                                                        <label>Channel Name:</label>
                                                        <input type="text" value="<%=channel_name%>" name="channel"class="form-control"required="required">
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Category:</label>



                                                        <select class="form-control" name="category">
                                                            <option value="Sports &amp; Adventure">Sports &amp; Adventure</option>
                                                            <option value="Movies &amp; Entertainment">Movies &amp; Entertainment</option>
                                                            <option value="Arts &amp; Science">Arts &amp; Science</option>
                                                            <option value="Technology">Technology</option>
                                                            <option value="Fashion">Fashion</option>
                                                        </select>           

                                                    </div>


                                                    <div class="form-group">
                                                        <button type="submit" class="btn btn-primary btn-block">Save</button>
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

                            <div class="modal" id="myModal1">
                                <div class="modal-dialog">
                                    <div class="modal-content">

                                        <!-- Modal Header -->
                                        <div class="modal-header">
                                            <h4 class="modal-title">Update Profile</h4>
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        </div>

                                        <!-- Modal body -->
                                        <div class="modal-body">

                                            <div class="login-form">
                                                <form method="post" ACTION="update_channel_profile.jsp?code=<%=channel_code%>" name="uploadForm" ENCTYPE='multipart/form-data'>

                                                    <div class="form-group">
                                                        <label>Upload Profile:</label>
                                                        <input type="file" name="uploadFile" size="40" class="form-control"><br>
                                                        <input type="reset" name="Reset" style="border:1px solid black;" value="Reset">

                                                </div>



                                                <div class="form-group">
                                                    <button type="submit" class="btn btn-primary btn-block">Upload</button>
                                                </div>

                                            </form>

                                        </div>

                                    </div>

<div class="modal-footer">
                                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                </div>

                                </div>



                                <!-- Modal footer -->
                                

                            </div>
                        </div>                                                    

                        <div class="conatiner-fluid" >  
                            <div class="row" style="margin-top:2%">
                                    <div class="col-sm-3">
                                        <img src="channel_images/<%=channel_code%>.jpg" class="img-circle" width="100px" height="80px">
                                    
                                    </div>
                                    <div class="col-sm-3">
                                        <button class="btn btn-primary"style="margin-top:30px" data-toggle="modal" data-target="#myModal">CUSTOMIZE CHANNEL</button>

                                    </div>
                                    <div class="col-sm-3">
                                        <button class="btn btn-primary"style="margin-top:30px" ><a href="manage_vedio.jsp" style="color:white" >MANAGE VEDIOS</a></button>
                                </div>
                                <div class="col-sm-3" ><button class="btn btn-primary" data-toggle="modal" data-target="#myModal1" style="margin-top:30px">UPDATE 
                                        LOGO</BUTTON>
                                </div>
                                <div class="col-sm-12"><b>50 SUBSCRIBERS</b></DIV>
                            </div>  
                                    <div class="col-sm-12" style="height:1px;background-color:gray">
                                        
                                    </div>
                            <div class="row" style="margin-top:2%">

                                    <%



                                        try {
                                            Class.forName("com.mysql.jdbc.Driver");
                                            Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/youtube", "root", "");
                                            Statement st1 = cn.createStatement();
                                            Statement st2 = cn.createStatement();
                                            ResultSet rs = st1.executeQuery("select * from vedio where email='" + email + "' AND status='" + 1 + "' ");


                                            while (rs.next()) {
                                                String code = rs.getString("code");
                                                String title = rs.getString("title");
                                                String date = rs.getString("dt");
                                                int views_count = 0;
                                                ResultSet rs3 = st2.executeQuery("select count(*) from views where vedio_code='" + code + "'");
                                                if (rs3.next()) {
                                                    views_count = rs3.getInt(1);
                                                }
                                    %>
                                    <div class="col-sm-3" >
                                        <div class="row">
                                            <a href="vedio_play_secreen.jsp?code=<%=code%>&title= <%=title%>" style="color:black">     

                                                <div class="col-sm-12">
                                                    <video  width="230" 
                                                            height="150" 
                                                            poster=
                                                            "thumbnale/<%=code%>.jpg"> 
                                                        <source src=
                                                                "channelvedio/<%=code%>.mp4"
                                                                accesskey=""  type="video/mp4">
                                                    </video>
                                                </div>
                                            </a>
                                            <div class="col-sm-12">
                                                <span> <%=title%>
                                                </span>
                                            </div>
                                            <div class="col-sm-12">
                                                <span> <%=views_count%>&nbsp;views.
                                                </span>
                                                <span> <%=date%>
                                                </span>
                                            </div>

                                        </div>
                                    </div>

                                    <%
                                        }
                                    %>

                                    <%
                                        } catch (Exception e) {
                                        }
                                    %>


                                    <div class="clearfix"> </div>
                                    <div class="col-sm-12"></div>
                                </div>
                            </div>

                        </section>
                        <!-- footer -->
                        <div class="footer">

                        </div>
                        <!-- / footer -->
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

            </BODY>
        </HTML>		
        <%


            } else {
                response.sendRedirect("index.jsp");
            }
        %>