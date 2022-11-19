<%--
    Document   : change_pass
    Created on : 21 Feb, 2022, 7:05:24 PM
    Author     : rohit
--%>

<%@page contentType="text/html" import="java.sql.*"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
       <head>
				 <title>Home</title>
				 <script src="jquery-3.6.0.min.js"></script>
				<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
				 <meta charset="utf-8">
                                 
				  <meta name="viewport" content="width=device-width, initial-scale=1">
				  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
				  <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
				  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
                                  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
				  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
                                  <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
                                  
                                <!---  <link href="bootstrap-3.1.1.min.css" rel='stylesheet' type='text/css' />--->
                <style>
                                        .link{
                                            color:white;
                                        }
                                         .kilimanjaro_area {
						position:relative;
						z-index: 1;
						} 
						.foo_top_header_one {
						background-color:#4B5320;
						color: #fff;
						
					}
					.section_padding_100_70 {
						padding-top: 70px;
						padding-bottom: 70px;
					}
					.foo_top_header_one {
						color: #fff;
					}.kilimanjaro_part {
						margin-bottom: 30px;
					}
					.foo_top_header_one .kilimanjaro_part > h5 {
						color: #fff;
					}
					.kilimanjaro_part h4, .kilimanjaro_part h5 {
						margin-bottom: 30px;
					}
					.kilimanjaro_single_contact_info > p, .kilimanjaro_single_contact_info > h5, .kilimanjaro_blog_area > a, .foo_top_header_one .kilimanjaro_part > p {
						color: rgba(255,255,255,.5);
					}
					p, ul li, ol li {
						font-weight: 300;
					}
					ul {
						margin: 0;
						padding: 0;
					}
					.kilimanjaro_bottom_header_one {
						background-color: #111;
					}
					.section_padding_50 {
						padding: 50px 0;
					}
					.kilimanjaro_bottom_header_one p {
						color: #fff;
						margin: 0;
					}
					p, ul li, ol li {
						font-weight: 300;
					}
					.kilimanjaro_bottom_header_one a {
						color: inherit;
						font-size: 14px;
					}
					a, h1, h2, h3, h4, h5, h6 {
						font-weight: 400;
					}
					.m-top-15 {
						margin-top: 15px;
					}
					ul {
						margin: 0;
						padding: 0;
					}

					.kilimanjaro_widget > li {
						display: inline-block;
					}
					p, ul li, ol li {
						font-weight: 300;
					}
					ol li, ul li {
						list-style: outside none none;
					}
					.kilimanjaro_widget a {
						border: 1px solid #333;
						border-radius: 6px;
						color: #888;
						display: inline-block;
						font-size: 13px;
						margin-bottom: 4px;
						padding: 7px 12px;
					}
					ul {
						margin: 0;
						padding: 0;
					}
					.kilimanjaro_links a {
						border-bottom: 1px solid #333;
						color: rgba(255,255,255,.5);
						display: block;
						font-size: 13px;
						margin-bottom: 5px;
						padding-bottom: 10px;
					}
					.kilimanjaro_links a {
						color: rgba(255,255,255,.5);
						font-size: 13px;
					}
					top-15 {
						margin-top: 15px;
					}
					.foo_top_header_one .kilimanjaro_part > h5 {
						color: #fff;
					}
					.kilimanjaro_part h4, .kilimanjaro_part h5 {
						margin-bottom: 30px;
					}
					.kilimanjaro_social_links > li {
						display: inline-block;
					}
					p, ul li, ol li {
						font-weight: 300;
					}
					.kilimanjaro_social_links a {
						border: 1px solid #333;
						border-radius: 6px;
						color: #888;
						display: inline-block;
						font-size: 13px;
						margin-bottom: 3px;
						padding: 7px 12px;
					}
					.kilimanjaro_blog_area .kilimanjaro_date {
						color: #27ae60;
						font-size: 13px;
						margin-bottom: 5px;
					}
					.kilimanjaro_blog_area > p {
						color: rgba(255,255,255,.5);
						line-height: 1.3;
						margin-bottom: 0;
					}
					.kilimanjaro_works > a {
						display: inline-block;
						float: left;
						position: relative;
						width: 33.33333333%;
						z-index: 1;
					}
					.kilimanjaro_thumb {
						left: 0;
						position: absolute;
						top: 0;
						width: 75px;
					}
					.kilimanjaro_links a i {
						padding-right: 10px;
					}
					  /* :: 18.0 Footer Area CSS */

						.footer_area {
							position: relative;
							z-index: 1;
						}
					 .footer_bottom p > i,
						.footer_bottom p > a:hover {
							color: #27ae60;
						}	

						.social_links_area {
							border-bottom: 1px solid rgba(255, 255, 255, 0.2);
							padding: 50px 0 30px 0;
							text-align: center;
							position: relative;
							z-index: 1;
						}
					 .social_links_area > a:hover {
							color: #27ae60;
						}

						.inline-style .social_links_area > a:hover {
							background-color: transparent;
							color: #27ae60;
							border: 0px solid transparent;
						}
					 .single_feature:hover .feature_text h4 {
							color: #27ae60;
						}
					.kilimanjaro_blog_area {
						border-bottom: 1px solid #333;
						margin-bottom: 15px;
						padding: 0 0 15px 90px;
						position: relative;
						z-index: 1;
					}
					.kilimanjaro_links a {
						border-bottom: 1px solid #333;
						color: rgba(255,255,255,.5);
						display: block;
						font-size: 13px;
						margin-bottom: 5px;
						padding-bottom: 10px;
					}

				
								/*
					DEMO STYLE
				*/

				
				body {
					font-family: 'Poppins', sans-serif;
					background: #fafafa;
				}

				p {
					font-family: 'Poppins', sans-serif;
					font-size: 1.1em;
					font-weight: 300;
					line-height: 1.7em;
					color: #999;
				}

				a,
				a:hover,
				a:focus {
					color: inherit;
					text-decoration: none;
					transition: all 0.3s;
				}

				.navbar {
					padding: 15px 10px;
					background: #fff;
					border: none;
					border-radius: 0;
					margin-bottom: 40px;
					box-shadow: 1px 1px 3px rgba(0, 0, 0, 0.1);
				}

				.navbar-btn {
					box-shadow: none;
					outline: none !important;
					border: none;
				}

				.line {
					width: 100%;
					height: 1px;
					border-bottom: 1px dashed #ddd;
					margin: 40px 0;
				}

				/* ---------------------------------------------------
					SIDEBAR STYLE
				----------------------------------------------------- */

				.wrapper {
					display: flex;
					width: 100%;
					align-items: stretch;
				}

				#sidebar {
					min-width: 250px;
					max-width: 250px;
					background:#7C0A02;
					color: #fff;
					transition: all 0.3s;
				}

				#sidebar.active {
					margin-left: -250px;
				}

				#sidebar .sidebar-header {
					padding: 20px;
					background: #6d7fcc;
				}

				#sidebar ul.components {
					padding: 20px 0;
					border-bottom: 1px solid #47748b;
				}

				#sidebar ul p {
					color: #fff;
					padding: 10px;
				}

				#sidebar ul li a {
					padding: 10px;
					font-size: 1.1em;
					display: block;
				}

				#sidebar ul li a:hover {
					color:black;
					background:white;
				}

				#sidebar ul li.active>a,
				a[aria-expanded="true"] {
					color: #fff;
					background:#1B1B1B;
				}

				a[data-toggle="collapse"] {
					position: relative;
				}

				.dropdown-toggle::after {
					display: block;
					position: absolute;
					top: 50%;
					right: 20px;
					transform: translateY(-50%);
				}

				ul ul a {
					font-size: 0.9em !important;
					padding-left: 30px !important;
					background:black;
				}
                                ul ul a:hover {
					font-size: 0.9em !important;
					padding-left: 30px !important;
					background:white;
                                        color:black;
				}

				ul.CTAs {
					padding: 20px;
				}

				ul.CTAs a {
					text-align: center;
					font-size: 0.9em !important;
					display: block;
					border-radius: 5px;
					margin-bottom: 5px;
				}

				a.download {
					background: #fff;
					color: #7386D5;
				}

				a.article,
				a.article:hover {
					background: #6d7fcc !important;
					color: #fff !important;
				}

				/* ---------------------------------------------------
					CONTENT STYLE
				----------------------------------------------------- */

				#content {
					width: 100%;
					padding: 20px;
					min-height: 100vh;
					transition: all 0.3s;
                                        background-color:white;
				}

				/* ---------------------------------------------------
					MEDIAQUERIES
				----------------------------------------------------- */

				@media (max-width: 768px) {
					#sidebar {
						margin-left: -250px;
					}
					#sidebar.active {
						margin-left: 0;
					}
					#sidebarCollapse span {
						display: none;
					}
				}
								
				
				 </style>
				 <script>
				 $(document).ready(function () {
					$('#sidebarCollapse').on('click', function () {
						$('#sidebar').toggleClass('active');
					});
                });
			  </script>
				
		</head>
		<body>
		<!---nave bar start-->
	<div class="wrapper">
        <!-- Sidebar  -->
        <nav id="sidebar">
           
            <ul class="list-unstyled components">
			  <div class="container-fluid">
			    <div class="row">
				  <p>Profile</p>
                                  <%
                                       
                                                      
                                                         String email=" ";
                                                         String code=" ";
                                                         Cookie c[]=request.getCookies();
                                                         for(int i=0;i<c.length;i++){
                                                               if(c[i].getName().equals("login")){
                                                                     email=c[i].getValue();
                                                               }
                                                         }
                                                    
                                                        if(email!=null && session.getAttribute(email)!=null){
                                                            
                                                         
                                                          
                                  try{
                                      Class.forName("com.mysql.jdbc.Driver");
                                      Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/youtube","root","");
                                      Statement st=cn.createStatement();
                                      ResultSet rs=st.executeQuery("select code from profile where email='"+email+"'");
                                      if(rs.next()){ 
                                        code=rs.getString("code");
                                      }
                                  }
                                  catch(Exception e){
                                      
                                  }
				 %>
				<div class="col-sm-4">
				  <img src="images/<%=code%>.jpg" alt="Logo" style="width:90px" class="rounded-circle">
                                  
				 </div> 
				<div class="col-sm-4"></div>
				
				</div>
				</div>
                <li class="active">
                    <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Explore</a>
                    <ul class="collapse list-unstyled" id="homeSubmenu">
                        <li>
                            <a href="#">Liked vedios</a>
                        </li>
                        <li>
                            <a href="#">Watch Later</a>
                        </li>
                        <li>
                            <a href="#">Saved</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#">About</a>
                </li>
               
                <li>
                    <a href="#">Contact</a>
                </li>
            </ul>

            <ul class="list-unstyled CTAs">
                <li>
                    <form action="login.jsp">
                    <button class="btn btn-danger">Logout</button>
                    </form>
                </li>
				
                
            </ul>
        </nav>

        <!-- Page Content  -->
        <div id="content">

            
            <nav class="navbar navbar-expand-lg navbar-light" style="background-color:#0247FE">
                <div class="container-fluid">
                  <div class="row">
			 <div class="col-sm-1">
                            <button type="button" id="sidebarCollapse" class="btn btn-primary">
                                <i class="fa fa-align-left"></i>

                            </button>
			</div>
                      <div class="col-sm-3">
                       <a href="dashbord.jsp" class="fa fa-grip-horizontal">&nbsp;dashbord</a></div>
		      <div class="col-sm-6">
                    <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <i class="fa fa-align-justify"></i>
                    </button>
                         	
                   
			
			  <form>
			  <div class="input-group">
			    <input type="text" class="form-control" placeholder="Search.." size="60px">
                                <div class="input-group-append">
			         <button class="btn btn-success">
			          <i class="fa fa-search"></i>
			         </button>
		                </div>
			
			 </form>
			</div>
		</div>
	</div>
            </nav>

            
             
	  
 <!---nave bar end--->
                <div class="container-fluid">
				   <div class="row">
				       <div class="col-sm-5"></div>
					   <div class="col-sm-3">
					    
                                                
                                                         
						  </div>
						  <div class="col-sm-4"></div>
						  <div class="col-sm-4"></div>
                                                    <div class="col-sm-4">
                                                      <h3 style="margin-left:10%" ><b>Change Password</b></h3>
                                                     
                                                         </div>
                                                            <div class="col-sm-4"></div>
                                                            <div class="col-sm-4"></div>
                                                           <div class="col-sm-4">
                                                            <div class="login-form">
                                                                <form action="password_change.jsp" method="post">
                                                                     
                                                                   
                                                                            <div class="form-group">
                                                                        <div class="input-group">
                                                                            <div class="input-group-prepend">
                                                                                <span class="input-group-text">
                                                                                    <i class="fa fa-lock"></i>
                                                                                </span>                    
                                                                            </div>
                                                                            <input type="password"  name="pass"class="form-control" placeholder="Password" required="required">
                                                                        </div>
                                                                    </div>  
                                                                      <div class="form-group">
                                                                        <div class="input-group">
                                                                            <div class="input-group-prepend">
                                                                                <span class="input-group-text">
                                                                                    <i class="fa fa-lock"></i>
                                                                                </span>                    
                                                                            </div>
                                                                            <input type="password" name="npass"class="form-control" placeholder="New-Password" required="required">
                                                                        </div>
                                                                    </div>  
                                                                      <div class="form-group">
                                                                        <div class="input-group">
                                                                            <div class="input-group-prepend">
                                                                                <span class="input-group-text">
                                                                                    <i class="fa fa-lock"></i>
                                                                                </span>                    
                                                                            </div>
                                                                            <input type="password"name="cpass" class="form-control" placeholder="Confirm-Password" required="required">
                                                                        </div>
                                                                    </div>  
                                                                    <div class="form-group">
                                                                 <button type="submit" class="btn btn-dark btn-block">Save</button>
                                                              </div>
                                                                    
                                                                              <%
                                                        }
                                                        else{
                                                            response.sendRedirect("login.jsp");
                                                        }
                                                        
                                                        %>
                                                                </form>
                                                            </div>
                                                       
						           
                                                         
						     </div>
                                                            <div class="col-sm-4"></div>
                                                           
						 
                                   </div>
						 
                </div>
	</div>
 </div>
					       
 
<footer class="kilimanjaro_area">
        <!-- Top Footer Area Start -->
        <div class="foo_top_header_one section_padding_100_70">
            <div class="container">
                <div class="row">
                    <div class="col-12 col-md-6 col-lg-3">
                        <div class="kilimanjaro_part">
                            <h5>About Us</h5>
                            <p>It includes rich features & contents. It's designed & developed based on One Page/ Multi-page Layout,blog themes,world press themes and blogspot. You can use any layout from any demo anywhere.</p>
                            <p>Our company is completely creative, clean & 100% responsive website. Put your business into next level with us.</p>
                        </div>
                        <div class="kilimanjaro_part m-top-15">
                            <h5>Social Links</h5>
                            <ul class="kilimanjaro_social_links">
                                <li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i> Facebook</a></li>
                                <li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i> Twitter</a></li>
                                <li><a href="#"><i class="fa fa-pinterest" aria-hidden="true"></i> Pinterest</a></li>
                                <li><a href="#"><i class="fa fa-youtube" aria-hidden="true"></i> YouTube</a></li>
                                <li><a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i> Linkedin</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-12 col-md-6 col-lg-3">
                        <div class="kilimanjaro_part">
                            <h5>Tags Widget</h5>
                            <ul class=" kilimanjaro_widget">
                                <li><a href="#">Classy</a></li>
                                <li><a href="#">Blog</a></li>
                                <li><a href="#">Creative</a></li>
                                <li><a href="#">One Page</a></li>
                                <li><a href="#">Multipurpose</a></li>
                                <li><a href="#">Minimal</a></li>
                                <li><a href="#">Classic</a></li>
                                <li><a href="#">Medical</a></li>
                            </ul>
                        </div>

                        <div class="kilimanjaro_part m-top-15">
                            <h5>Important Links</h5>
                            <ul class="kilimanjaro_links">
                                <li><a href="#"><i class="fa fa-angle-right" aria-hidden="true"></i>Terms & Conditions</a></li>
                                <li><a href="#"><i class="fa fa-angle-right" aria-hidden="true"></i>About Licences</a></li>
                                <li><a href="#"><i class="fa fa-angle-right" aria-hidden="true"></i>Help & Support</a></li>
                                <li><a href="#"><i class="fa fa-angle-right" aria-hidden="true"></i>Careers</a></li>
                                <li><a href="#"><i class="fa fa-angle-right" aria-hidden="true"></i>Privacy Policy</a></li>
                                <li><a href="#"><i class="fa fa-angle-right" aria-hidden="true"></i>Community & Forum</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-12 col-md-6 col-lg-3">
                        <div class="kilimanjaro_part">
                            <h5>Latest News</h5>
                            <div class="kilimanjaro_blog_area">
                                <div class="kilimanjaro_thumb">
								<img class="img-fluid" src="https://3.bp.blogspot.com/--C1wpaf_S4M/W7V__10nRoI/AAAAAAAAK24/1NSfapuYSIY0f0wzXY9NgoH0FjQLT07YACKgBGAs/s1600/maxresdefault.jpg" alt="">

                                </div>
                                <a href="#">Your Blog Title Goes Here</a>
                                <p class="kilimanjaro_date">21 Jan 2018</p>
                                <p>Lorem ipsum dolor sit amet, consectetur</p>
                            </div>
                            <div class="kilimanjaro_blog_area">
                                <div class="kilimanjaro_thumb">
								<img class="img-fluid" src="https://3.bp.blogspot.com/--C1wpaf_S4M/W7V__10nRoI/AAAAAAAAK24/1NSfapuYSIY0f0wzXY9NgoH0FjQLT07YACKgBGAs/s1600/maxresdefault.jpg" alt="">
                                </div>
                                <a href="#">Your Blog Title Goes Here</a>
                                <p class="kilimanjaro_date">21 Jan 2018</p>
                                <p>Lorem ipsum dolor sit amet, consectetur</p>
                            </div>
                            <div class="kilimanjaro_blog_area">
                                <div class="kilimanjaro_thumb">
								<img class="img-fluid" src="https://3.bp.blogspot.com/--C1wpaf_S4M/W7V__10nRoI/AAAAAAAAK24/1NSfapuYSIY0f0wzXY9NgoH0FjQLT07YACKgBGAs/s1600/maxresdefault.jpg" alt="">
                                </div>
                                <a href="#">Your Blog Title Goes Here</a>
                                <p class="kilimanjaro_date">21 Jan 2018</p>
                                <p>Lorem ipsum dolor sit amet, consectetur</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-md-6 col-lg-3">
                        <div class="kilimanjaro_part">
                            <h5>Quick Contact</h5>
                            <div class="kilimanjaro_single_contact_info">
                                <h5>Phone:</h5>
                                <p>+255 255 54 53 52 <br> +255 255 53 52 51</p>
                            </div>
                            <div class="kilimanjaro_single_contact_info">
                                <h5>Email:</h5>
                                <p>support@email.com <br> company@email.com</p>
                            </div>
                        </div>
                        <div class="kilimanjaro_part">
                            <h5>Latest Works</h5>
                            <div class="kilimanjaro_works">
                                <a class="kilimanjaro_works_img" href="img/gallery/1.jpg"><img src="img/gallery/1.jpg" alt=""></a>
                                <a class="kilimanjaro_works_img" href="img/gallery/4.jpg"><img src="img/gallery/4.jpg" alt=""></a>
                                <a class="kilimanjaro_works_img" href="img/gallery/5.jpg"><img src="img/gallery/5.jpg" alt=""></a>
                                <a class="kilimanjaro_works_img" href="img/gallery/7.jpg"><img src="img/gallery/7.jpg" alt=""></a>
                                <a class="kilimanjaro_works_img" href="img/gallery/10.jpg"><img src="img/gallery/10.jpg" alt=""></a>
                                <a class="kilimanjaro_works_img" href="img/gallery/11.jpg"><img src="img/gallery/11.jpg" alt=""></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer Bottom Area Start -->
        <div class=" kilimanjaro_bottom_header_one section_padding_50 text-center">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <p>© All Rights Reserved by <a href="#">YouTube India<i class="fa fa-love"></i></a></p>
                    </div>
                </div>
            </div>
        </div>
    </footer>
               
                </body>
</html>
