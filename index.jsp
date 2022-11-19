<%-- 
    Document   : profile
    Created on : 21 Feb, 2022, 11:45:47 PM
    Author     : rohit
--%>

<%@page contentType="text/html"import="java.sql.*" pageEncoding="UTF-8"%>

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
    <script>
        $(document).ready(function(){
            $(".btn.btn-default").on("click",function(){
                $(this).css("border-color","none");
            });
            
            
        });
                </script>
</head>

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
            <section class="wrapper">
                <!-- //market-->
                <div class="container-fluid">
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

                    <div class="row">



                        <%
                            int count = 0;
                            int first = 0;
                            int last = 8;
                            String channel_code = "";
                            String channel_name = "";
                            try {

                                int status = 1;
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/youtube", "root", "");
                                Statement st = cn.createStatement();
                                Statement st1 = cn.createStatement();
                                Statement st2 = cn.createStatement();
                                ResultSet rs1 = st.executeQuery("select count(*) from vedio");
                                if (rs1.next()) {
                                    count = rs1.getInt(1);
                                }
                                int total_page = count / 8;
                                ResultSet rs = st1.executeQuery("select * from vedio where status='" + status + "' ORDER BY RAND ()");
                                while (rs.next()) {

                                    String code = rs.getString("code");
                                    String title = rs.getString("title");
                                    String date = rs.getString("dt");
                                    ResultSet rs2 = st2.executeQuery("select * from vedio where code='" + code + "' AND status='1'  ");

                                    if (rs2.next()) {

                                        channel_code = rs2.getString("channel_code");
                                        ResultSet rs3 = st2.executeQuery("select * from channel where code='" + channel_code + "' ");

                                        if (rs3.next()) {
                                            channel_name = rs3.getString("channel_name");
                                        }

                                    }
                                    int views_count = 0;
                                    ResultSet rs4 = st2.executeQuery("select count(*) from views where vedio_code='" + code + "'"); 
                                    if (rs4.next()) {
                                        views_count = rs4.getInt(1);
                                    }
                        %>
                        <div class="col-sm-3" style="margin-top:2%;">
                             <div class="row" >
                                 <div class="col-sm-12">
                            <a href="vedio_play.jsp?code=<%=code%>&title= <%=title%>& date= <%=date%>" style="color:black">


                                <video   width="240" 
                                         height="150" 
                                         poster=
                                         "thumbnale/<%=code%>.jpg"  class="img-fluid">
                                    <source src=
                                            "channelvedio/<%=code%>.mp4"
                                            accesskey=""  type="video/mp4" >
                                </video>
                               </div>
                                    <div class="col-sm-12">


                                        <%=title%>  
                                    </div>
                                    <div class="col-sm-12">


                                        <%=channel_name%>&nbsp;&nbsp;<i class="fa fa-check-circle" style="color:gray"></i>
                                    </div>
                                    <div class="col-sm-12">


                                       <%=views_count%> views&nbsp;&nbsp;.<%=date%>
                                    </div>
                                </div>


                            </a>
                        </div>
                        <%
                                }

                            } catch (Exception e) {
                            }



                        %>
                        <div class="clearfix"></div>

                       


                    </div>
                </div>	
                         </section>
 
           
            <!-- footer -->
           
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
