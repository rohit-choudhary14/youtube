<%-- 
    Document   : history
    Created on : 9 Mar, 2022, 1:39:55 AM
    Author     : rohit
--%>
<%@page contentType="text/html" import="java.sql.*"  pageEncoding="UTF-8"%>
<%
    
    String email=" ";
    Cookie c[]=request.getCookies();
    for(int i=0;i<c.length;i++){
        if(c[i].getName().equals("login")){
            email=c[i].getValue();
        }
    }
     if(email!=null){
                        
                               
    %>                            
<!DOCTYPE html>
<html>
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
<meta name='viewport' content='width=device-width, initial-scale=1'>
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
				
</head>
<style>
    .fa.fa-trash:hover{
        color:red;
        
    }   
    
button.input-group-addon {
  position: absolute;
  right: -38px;
  top: 0;
  padding: 2px;
  z-index: 999;
  height: 34px;
  width: 38px;
}

    
    </style>
<body>
   <section id="container">
<!--header start-->
<header class="header fixed-top clearfix">
<!--logo start-->
<div class="brand">
    <a href="vedio_play_dashbord.jsp" class="logo">
       YouTube
    </a>
    <div class="sidebar-toggle-box">
        <div class="fa fa-bars"></div>
    </div>
</div>
<!--logo end-->

<div class="top-nav clearfix">
    <!--search & user info start-->
    
    <ul class="nav pull-left top-menu" style="margin-left:5%">
         
        <li>
            <div class="input-group" >
               <form metho="post" action="search.jsp">
        <input type="text" class="form-control"/>
        <button class="input-group-addon" type="submit">
            <i class="fa fa-search" ></i>
        </button>
               </form>
</div>
        </li>
        
    </ul>
    <ul class="nav pull-right top-menu">
          <li class="dropdown">
            
            <%
                try{ 
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/youtube","root","");
                                
                                Statement st2 = cn.createStatement();
                                ResultSet rs2=st2.executeQuery("select * from profile where email='"+email+"'");
                                 if(rs2.next()){
                                   String profile_code=rs2.getString("code");
                                  String profile_name=rs2.getString("name"); 

             %>
             <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                <img alt="" src="images1/<%=profile_code%>.jpg" width="100px">
                <span class="username"><%=profile_name%></span>
                <b class="caret"></b>
            </a>
            <ul class="dropdown-menu extended logout">
                <li><a href="#"><i class=" fa fa-suitcase"></i>Profile</a></li>
                <li><a href="#"><i class="fa fa-lock"></i> chanege password</a></li>
                <li><a href="index.jsp"><i class="fa fa-key"></i> Log Out</a></li>
            </ul>
       </li>
    </ul>     <%
                    }
               
                                
                  }
                      
                catch(Exception e){
                
            }
               %>
              
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
                     <a class="active"  href="clear_history.jsp">
                        <i class="fa fa-history"></i>
                        <span>Clear All History</span>
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
</aside>

     <section id="main-content"style="background-color:white">
	<section class="wrapper">
		 
            <div class="container-fluid">
                 
                   
						 
                     <%
                         try{ 
                               String channel_code=" ";
                               String title=" ";
                               String vedio_description=" "; 
                               String dat=" ";
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/youtube","root","");
                                
                                Statement st3 = cn.createStatement();
                                 Statement st4 = cn.createStatement();
                                ResultSet rs3=st3.executeQuery("select * from history where email='"+email+"' AND status='"+1+"' ");
                                while(rs3.next()){
                                   String vedio_code=rs3.getString("vedio_code");
                                   ResultSet rs4=st4.executeQuery("select * from vedio where code='"+vedio_code+"'"); 
                                    if(rs4.next()){
                                       title=rs4.getString("title");
                                       dat=rs4.getString("dt");
                                       channel_code=rs4.getString("channel_code");
                                       vedio_description=rs4.getString("description"); 
                                   %>
                                    <div class="row">
                  
                                     <div class="col-sm-6"  style="margin-top:7%">
                                           <a href="vedio_play_secreen.jsp?code=<%=vedio_code%>&title= <%=title%>& date= <%=dat%>" style="color:black" >
                                         <table><tr><td><input type="checkbox" name="delete" class="selected" id="down" required> 
                                                    <a href="delete_hisory.jsp?code=<%=vedio_code%>" ><i class="fa fa-trash">Remove from History</i></a></tr><video   width="400" 
                                                                   height="250" 
                                                                   poster=
                                                                    "thumbnale/<%=vedio_code%>.jpg">
                                                                  <source src=
                                                                        "channelvedio/<%=vedio_code%>.mp4"
                                                                        accesskey=""  type="video/mp4">
                                      </video></td></tr></table></a>
                                   
                                  </div> 
                                <div class="col-sm-6" style="margin-top:7%">
                                  <a href="vedio_play_secreen.jsp?code=<%=vedio_code%>&title= <%=title%>& date= <%=dat%>" style="color:black" >
                                      <table class="table table-bordereless w3 card">
                                       <tr><td>
                                        <%=title%></td>
                                        <tr><td colspan="2"><%=dat%></td></tr>
                                            <tr>
                                          <td><img src="channel_images/<%=channel_code%>.jpg" width="30px" height="30px" class="img-circle">&nbsp;&nbsp; 
                                          <i class="fa fa-check-circle"></i></td></tr>
                                            <tr><td>
                                             <%=vedio_description%>
                                           </td> </tr></table></a>
                                             </div>    
                    
                   
                      </div>
                                           
                 <% 
                                   }
                                }
                                 %>	
		</div>
</section>
 <!-- footer -->
		  <div class="footer" style="margin-top:auto">
			<div class="wthree-copyright">
			  <p>?? 2017 Visitors. All rights reserved | Design by <a href="http://w3layouts.com">Rohit Choudhary</a></p>
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
	<!-- //calendar -->
        <%
                                 
                        }
                        catch(Exception e){
                        }
                                         
     }                   
           else{ 
               response.sendRedirect("index.jsp");
          }
    %>
</body>
</html>

    
