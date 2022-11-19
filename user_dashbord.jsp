<%--
    Document   : user_dashbord
    Created on : 24 Feb, 2022, 3:53:41 PM
    Author     : rohit
--%>
<%@page contentType="text/html"import="java.sql.*" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<% 
    String email=" ";
    String name=" ";
    Cookie c[]=request.getCookies();
    for(int i=0;i<c.length;i++){
        if(c[i].getName().equals("login")){
             email=c[i].getValue();
        }
    }
    if(email!=null){
                        try{ 
                                       Class.forName("com.mysql.jdbc.Driver");
                                       Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/youtube","root","");
                                       Statement st1=cn.createStatement();
                                       ResultSet rs=st1.executeQuery("select channel_name from channel where email='"+email+"'");
                                       if(rs.next()){
                                           
                                       String channel_name=rs.getString("channel_name");
                      
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
 </HEAD>
<BODY>
<!---nave bar start-->
	 <section id="container">
<!--header start-->
<header class="header fixed-top clearfix">
<!--logo start-->
<div class="brand">
    <a href="index.html" class="logo">
      <%=channel_name%>
     
    </a>
    <div class="sidebar-toggle-box">
        <div class="fa fa-bars"></div>
    </div>
</div>
<!--logo end-->

<div class="top-nav clearfix">
    <!--search & user info start-->
    
    <ul class="nav pull-right top-menu">
         
        <li>
            <input type="text" class="form-control search" placeholder=" Search" >
        </li>
        
      
          <li class="dropdown">
            
           <%
            try{
                
                      
                       Statement st = cn.createStatement();
                      
                      ResultSet rs1=st1.executeQuery("select * from profile where email='"+email+"'");
                      if(rs1.next()){
                       String profile_code=rs1.getString("code");
                       String profile_name=rs1.getString("name");
                       
             %>
             <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                <img alt="" src="images1/<%=profile_code%>.jpg" width="100px">
                <span class="username"><%=profile_name%></span>
                <b class="caret"></b>
            </a>
                <%
                      }
            }
            catch(Exception e){
                
            }
            %>
            <ul class="dropdown-menu extended logout">
                <li><a href="#"><i class=" fa fa-suitcase"></i>Profile</a></li>
                <li><a href="#"><i class="fa fa-lock"></i> chanege password</a></li>
                <li><a href="index.jsp"><i class="fa fa-key"></i> Log Out</a></li>
            </ul>
       </li>
    </ul>
              
    <!--search & user info end-->
</div>
</header>
<!--header end-->
<!--sidebar start-->
<aside>
    <div id="sidebar" class="nav-collapse">
        <!-- sidebar menu start-->
        <div class="leftside-navigation">
            <ul class="sidebar-menu" id="nav-accordion">
                <li>
                    <a class="active" href="vedio_play_dashbord.jsp">
                        <i class="fa fa-home"></i>
                        <span>Home</span>
                    </a>
                </li>
               
                <li>
                    <a class="active" href="dashbord_create.jsp">
                        <i class="glyphicon glyphicon-facetime-video"></i>
                        <span>Upload Vedio</span>
                    </a>
                </li>
                <li>
                    <a class="active" >
                        <i class="fas fa-basketball-ball"></i>
                        <span>Sports</span>
                    </a>
                </li>
                 <li>
                    <a class="active" >
                        <i class="far fa-bookmark"></i>
                        <span>Saved</span>
                    </a>
                </li>
                
                 <li>
                    <a class="active" href="index.jsp">
                        <i class="fa fa-cog"></i>
                        <span>setting</span>
                    </a>
                </li>
            </ul>            </div>
         <!-- sidebar menu end-->
     </div>
<section id="main-content"style="background-color:white">
	  <section class="wrapper">
		<!-- //market-->
		 
                <div class="container-fluid">    
                    <div class="row">
                     
                     <%
                                       }
                        }
                        catch(Exception e){
                        }
                        
                    
                                  try{ 
                                      Class.forName("com.mysql.jdbc.Driver");
                                      Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/youtube","root","");
                                       Statement st1=cn.createStatement();
                                      ResultSet rs=st1.executeQuery("select * from vedio where email='"+email+"'");
                                     
                                     
                                      while(rs.next()){ 
                                          String code=rs.getString("code"); 
                                          String title=rs.getString("title");
                                           String date=rs.getString("dt");
                                 %>
                                
                                 <div class="col-sm-3" >
                                        
                                                <a href="vedio_play_secreen.jsp?code=<%=code%>&title= <%=title%>" style="color:black">         <video  width="230" 
                                                            height="150" 
                                                           controls poster=
                                                            "thumbnale/<%=code%>.jpg"> 
                                                                    <source src=
                                                            "channelvedio/<%=code%>.mp4"
                                                     accesskey=""  type="video/mp4">
                                                     </video>
                                                    <%=title%>
                                                    publish date:&nbsp;<%=date%></a>
                                        </div>
                              
                                     <%
                                      }
                                      %>
                                              
                                            
                                  <%
                                  }
                          catch(Exception e){
                                      
                              }              
                                          %>
                                  
                                             
                                
                            <div class="clearfix"> </div>               
                          </div> 
                                
		  	
</section>
 <!-- footer -->
		  <div class="footer" style="margin-top:40%">
			<div class="wthree-copyright">
			  <p>© 2017 Visitors. All rights reserved | Design by <a href="http://w3layouts.com">Rohit Choudhary</a></p>
			</div>
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
                       
        
    } 
    else{
          response.sendRedirect("index.jsp");
    }
%>