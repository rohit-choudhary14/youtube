<%-- 
    Document   : vedio_play_secreen
    Created on : 28 Feb, 2022, 12:16:26 AM
    Author     : rohit
--%>

<%@page contentType="text/html"import="java.sql.*" pageEncoding="UTF-8"%>

<%
    String email = " ";
    String vedio_code = " ";
    String vedio_title = " ";

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
    if (email != null) {
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
        .styled {
            border: 0;
            line-height: 2.5;
            padding: 0 20px;
            font-size: 1rem;
            text-align: center;
            color: #fff;
            text-shadow: 1px 1px 1px #000;
            border-radius: 10px;
            background-color: rgba(220, 0, 0, 1);
            background-image: linear-gradient(to top left,
                rgba(0, 0, 0, .2),
                rgba(0, 0, 0, .2) 30%,
                rgba(0, 0, 0, 0));
            box-shadow: inset 2px 2px 3px rgba(255, 255, 255, .6),
                inset -2px -2px 3px rgba(0, 0, 0, .6);
        }

        .styled:hover {
            background-color: rgba(255, 0, 0, 1);
        }

        .styled:active {
            box-shadow: inset -2px -2px 3px rgba(255, 255, 255, .6),
                inset 2px 2px 3px rgba(0, 0, 0, .6);
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

                var code = $(this).attr("id");

                var color = $(this).attr("rel");

                var count = 0;
                var like_count = $("#counting").text();



                $.post(
                        "like_vedio.jsp", {code: code, color: color}, function(data) {

                    var clr = data.substring(0, data.indexOf("-"));//black

                    var count = data.substring(data.indexOf("-") + 1, data.indexOf("_"));//0

                    var clr1 = data.substring(data.indexOf("_") + 1, data.indexOf("/"));//blue
                    var count1 = data.substring(data.indexOf("/") + 1);//1

                    $("#decounting").text(count);
                    $("#counting").text(count1);

                    $(".fa.fa-thumbs-up").css("color", clr1);
                    $(".fa.fa-thumbs-down").css("color", clr);




                });




            });
            $(".fa.fa-thumbs-down").on("click", function() {

                var code = $(this).attr("id");

                var color = $(this).attr("rel");

                var count = 0;
                var dislike_count = $("#decounting").text();

                $.post(
                        "dislike_vedio.jsp", {code: code, color: color}, function(data) {

                    var clr = data.substring(0, data.indexOf("-"));//black

                    var count = data.substring(data.indexOf("-") + 1, data.indexOf("_"));//0

                    var clr1 = data.substring(data.indexOf("_") + 1, data.indexOf("/"));//blue
                    var count1 = data.substring(data.indexOf("/") + 1);//1

                    $("#counting").text(count);
                    $("#decounting").text(count1);

                    $(".fa.fa-thumbs-up").css("color", clr);
                    $(".fa.fa-thumbs-down").css("color", clr1);





                });




            });
            $(".btn.btn-danger").on("click", function() {
                var code = $(this).attr("id");
                var text = $(this).text();

                $.post(
                        "subscribe_channel.jsp", {code: code}, function(data) {

                    var val = data.substring(0, data.indexOf("/"));//SUBSCRIBED/fa fa-bell_gray

                    $(".btn.btn-danger").text(val);


                    var cla = data.substring(data.indexOf("/") + 1, data.indexOf("_"));

                    $("#bell").attr("class", cla);
                    var color = data.substring(data.indexOf("_") + 1);



                    $(".btn.btn-danger").css("background-color", color);
                    $(".btn.btn-danger").css("border-color", color);

                });
            });

            $(".btn.btn-primary").on("click", function() {
                var code = $(".textarea").attr("id");
                
                var msg = $(".textarea").val();

                var vedio_code = $(".textarea").attr("rel");

                var user_code = $(".textarea").attr("rel1");
                if(msg.length===0 || msg.length<0){
                $("#primary_msg_empty").html("<span style='color:red'>This field can't be empty</span>");
                }
               else{
                $("#primary_msg_empty").html("");
                $.post(
                        "comment.jsp", {code: code, msg: msg, vedio_code: vedio_code, user_code: user_code}, function(data) {
                    ////rohit_abc5/3-2-2022@i love this song$7
                    var name = data.substring(0, data.indexOf("-"));//rohit

                    var pro_name = name.substring(name.indexOf(">") + 1);

                    var code = data.substring(data.indexOf("-") + 1, data.indexOf("/"));//1_el8 

                    var dat = data.substring(data.indexOf("/") + 1, data.indexOf("@"));

                    var comm = data.substring(data.indexOf("@") + 1, data.indexOf("$"));
                    var count = data.substring(data.indexOf("$") + 1);
                    $("#pre-comment").prepend("<div class='col-sm-12' style='height:20px'></div><div class='col-sm-12'><div class='col-sm-2' id='img'></div><div class='col-sm-8'><span id='name'></span><span id='dat'></span></div><div class='col-sm-2'></div><div class='col-sm-2'></div><div class='col-sm-6' id='comm' ></div><div class='col-sm-2' ></div><div class='col-sm-2' id='dots'></div></div>");
                    $("#count").text(count);
                    $("#name").text(pro_name + ":");
                    $("#dat").text(dat);
                    $("#comm").text(comm);
                    $("#img").html("<img src='images1/xyz.jpg' width='70px' height='50px' class='img-circle' id='profile'>");
                    $("#profile").attr("src", "images1/" + code + ".jpg");
                    var src = $("#profile").attr("src");

                    $("#dots").html("<div class='dropdown show'><i  class='fa fa-ellipsis-v' aria-hidden='true'  role='button' id='dropdownMenuLink' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'></i> <div class='dropdown-menu'' aria-labelledby='dropdownMenuLink'><li ><span ><a style='cursor:pointer;margin-left:20px;font-size:15px' class='fa fa-edit'  >&nbsp;&nbsp;Edit</a></span></li> <li><span><a    style='cursor:pointer;margin-left:20px;font-size:15px;margin-top:10px' class='fa fa-trash' >&nbsp;&nbsp;Delete</a></span></li> </div>");

                    $(".textarea").val(" ");

                });
               }
               

            });
            $(".fa.fa-edit").on("click", function() {

                var id = $(this).attr("id");
                $("#real_comment-"+id).hide();
                $("#update_real_comment-"+id).show();
                $("#real_comment_date_time-"+id).hide();
              



            });
            $(".btn.btn-default").on("click",function(){
                
                var id = $(this).attr("id");
                $("#real_comment-"+id).show();
                $("#update_real_comment-"+id).hide();
                 $("#real_comment_date_time-"+id).show();   
            });
            $(".btn.btn-info").on("click",function(){
                
                var id = $(this).attr("id");
                var message=$("#update-"+id).val();
               if(message.length===0){
                   $("#info_message-"+id).html("<span style='color:red'>This field can't be empty</span>");
               }
               else if(message.length>0){
                   $("#info_message-"+id).html("");
                $.post(
                    "update_comment.jsp",{id:id,message:message},function(data){
                          
                           if(data.trim()==="success"){
                               $("#real_comment-"+id).text(message);
                                $("#real_comment-"+id).show();
                                $("#update_real_comment-"+id).hide();
                                $("#real_comment_date_time-"+id).show();   
                           }
                
                    });
            
            
               }
            });
            
            $(".fa.fa-trash").on("click", function() {
                var user_code = $(this).attr("id");

                var vedio_code = $(this).attr("rel1");
                var channel_code = $(this).attr("rel2");
                $.post(
                        "delete_comment.jsp", {user_code: user_code, vedio_code: vedio_code, channel_code: channel_code}, function(data) {

                    $("#d-" + user_code).fadeOut(1000);
                    $("#count").text(data);

                });


            });
            $("#search").on("click", function() {
                var text = $(this).val();

            });
            $(".views").on("click", function() {

                var vedio_code = $(this).attr("id");

                $.post(
                        "view.jsp", {vedio_code: vedio_code}, function(data) {


                });


            });

        });

    </script>

    <script>

        // Get the modal
        var modal = document.getElementById("myModal");

        // Get the button that opens the modal
        var btn = document.getElementById("myBtn");

        // Get the <span> element that closes the modal
        var span = document.getElementsByClassName("close")[0];

        // When the user clicks the button, open the modal 
        btn.onclick = function() {
            modal.style.display = "block";
        };

        // When the user clicks on <span> (x), close the modal
        span.onclick = function() {
            modal.style.display = "none";
        };

        // When the user clicks anywhere outside of the modal, close it
        window.onclick = function(event) {
            if (event.target ===modal) {
                modal.style.display = "none";
            }
        }
    </script>


</head>

<body>
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
                            }
                            catch(Exception e){
                                
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
                            <a href="dashbord_create.jsp" style="color:black">
                                <i class="glyphicon glyphicon-facetime-video" style="font-size:20px"></i>
                                <span style="font-size:15px">Upload Video</span>
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
                <!-- //market-->


                <div class="container-fluid" >

                    <div class="row" >

                        <div class="col-sm-7" style="margin-top:20px;">
                            <div class="row">
                            <%
                                try {



                                    String val = " ";
                                    String cls = " ";
                                    String clr = " ";
                                    String channel_name = " ";
                                    String channel_code = " ";
                                    String msg = " ";
                                    String email_user = " ";
                                    int count = 0;
                                    int count1 = 0;
                                    String color = " ";
                                    String color1 = " ";
                                    Class.forName("com.mysql.jdbc.Driver");
                                    Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/youtube", "root", "");
                                    Statement st = cn.createStatement();
                                    Statement st1 = cn.createStatement();
                                    Statement st2 = cn.createStatement();
                                    Statement st3 = cn.createStatement();
                                    Statement st4 = cn.createStatement();
                                    Statement st5 = cn.createStatement();
                                    Statement st6 = cn.createStatement();
                                    Statement st7 = cn.createStatement();
                                    Statement st8 = cn.createStatement();
                                    Statement st9 = cn.createStatement();
                                    Statement st10 = cn.createStatement();

                                    ResultSet rs4 = st4.executeQuery("select count(*) from vedio_like where vedio_code='" + vedio_code + "'");
                                    if (rs4.next()) {

                                        count = rs4.getInt(1);
                                    }

                                    ResultSet rs5 = st5.executeQuery("select color from vedio_like where vedio_code='" + vedio_code + "' AND email='" + email + "'");
                                    if (rs5.next()) {

                                        color = rs5.getString("color");

                                    }
                                    ResultSet rs6 = st6.executeQuery("select count(*) from vedio_dislike where vedio_code='" + vedio_code + "'");
                                    if (rs6.next()) {

                                        count1 = rs6.getInt(1);
                                    }
                                    ResultSet rs7 = st7.executeQuery("select color from vedio_dislike where vedio_code='" + vedio_code + "' AND email='" + email + "'");
                                    if (rs7.next()) {

                                        color1 = rs7.getString("color");

                                    }

                                    ResultSet rs = st.executeQuery("select * from vedio where code='" + vedio_code + "' AND status='" + 1 + "' ");

                                    if (rs.next()) {
                                        String vedio_date = rs.getString("dt");
                                        String vedio_description = rs.getString("description");
                                        channel_code = rs.getString("channel_code");
                                        String title = rs.getString("title");
                                        email_user = rs.getString("email");
                                        ResultSet rs2 = st2.executeQuery("select * from channel where code='" + channel_code + "'");
                                        if (rs2.next()) {
                                            channel_name = rs2.getString("channel_name");
                                        }
                                        ResultSet rs8 = st8.executeQuery("select * from subscribe where channel_code='" + channel_code + "' AND email='" + email + "'");
                                        if (rs8.next()) {

                                            val = rs8.getString("val");
                                            cls = rs8.getString("cls");
                                            clr = rs8.getString("clr");

                                        } else {

                                            val = "SUBSCRIBE";
                                            cls = " ";
                                            clr = "red";
                                        }

                            %>
                       <div class="col-sm-12">
                             
                            <video  
                                width="650px" 
                                height="350px" autoplay
                                controls poster=
                                "thumbnale/<%=vedio_code%>.jpg" class="img-responsive" >
                                <source   src=
                                          "channelvedio/<%=vedio_code%>.mp4"
                                          accesskey=""  type="video/mp4" >
                            </video>
                              </div>
                           <div class="col-sm-12" style="margin-top:2%">
                                 <b>
                                            <h4><%=vedio_title%></h4>
                                             </b>
                            </div>
                           

                            <%
                                int views_count = 0;
                                ResultSet rs3 = st2.executeQuery("select count(*) from views where vedio_code='" + vedio_code + "'");
                                if (rs3.next()) {
                                    views_count = rs3.getInt(1);
                                }


                            %>
                            <div class="col-sm-12" style="margin-top:2%">
                                    <div class="row">
                                        <div class="col-sm-4">
                                              <b> <%=views_count%>&nbsp;views.&nbsp; <%=vedio_date%></b> 
                                        </div>
                                          <div class="col-sm-2"> 
                                                    <i class="fa fa-thumbs-up" id="<%=vedio_code%>" rel="blue" style="font-size:20px;color:<%=color%>"></i><span id="counting" style="font-size:20px;"><%=count%></span>
                                                   </div>
                                                <div class="col-sm-2"> 
                                                   <i class="fa fa-thumbs-down"  id="<%=vedio_code%>" rel="blue"style="font-size:20px;color:<%=color1%>"></i><span id="decounting" style="font-size:20px;"><%=count1%></span>
                               
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
                                         <%
                                if (email_user.equals(email)) {
                            %> 

                            <span style="float:right;font-size:24px">
                                <button class="btn btn-danger" style="background-color:<%=clr%>;border-color:<%=clr%>"> SUBSCRIBE </button></span>

                            <% }
                                
                                else {
                            %>
                            <span style="float:right;font-size:24px">
                                <button class="btn btn-danger" id="<%=channel_code%>" style="background-color:<%=clr%>;border-color:<%=clr%>"> <%=val%> </button></span>
                                <%
                                    }

                                %>    
                                     </div>
                                                          <div class="col-sm-12" style="height:1px;background-color:#F1F2F4;margin-top:2%">
                                            
                                        </div>
                                  <%
                                        int total_comment = 0;
                                        ResultSet rs1 = st.executeQuery("select count(*) from comment where  vedio_code='" + vedio_code + "'");
                                        if (rs1.next()) {
                                            total_comment = rs1.getInt(1);

                                        }



                                    %>

                                 <div class="col-sm-12" style="margin-top:2%">
                                                <div class="row">
                                                    <div class="col-sm-12">
                                                         <h3><span id="count"><%=total_comment%></span>&nbsp;&nbsp;Comments </h3>
                               
                                                    </div>
                                                    <div class="col-sm-12" style="margin-top:2%">
                                                        <textarea rows="2" style="resize:none"  placeholder="add your comment..."class=' form-control textarea' id="<%=channel_code%>"  rel="<%=vedio_code%>"  rel1="" ></textarea>
                                                        
                                                        <span id="primary_msg_empty"></span>
                                                    </div>
                                                    <div class="col-sm-12"style="margin-top:1%">
                                                        <button class="btn btn-primary" >Post</button>
                                   
                                                    </div>
                                                </div>
                                     
                                    
                                           
                                        </div>
                                    </div>
                                                   
                           
                            <div class="row" id="pre-comment">
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

                                    <div class="col-sm-2" id="dots"></div> 
                                </div> 
                            </div>
                            <div class="row">

                                <%
                                    String email_profile = " ";
                                    String user_name = " ";
                                    String user_code = "  ";
                                    String date_time = " ";
                                    String user_code_comment = " ";
                                    String user_email_comment = " ";
                                    ResultSet rs9 = st9.executeQuery("select * from comment where channel_code='" + channel_code + "' AND vedio_code='" + vedio_code + "' ORDER BY RAND ()");
                                    while (rs9.next()) {

                                        msg = rs9.getString("comment");
                                        email_profile = rs9.getString("email");
                                        date_time = rs9.getString("dt_time");
                                        user_code_comment = rs9.getString("user_code");
                                        user_email_comment = rs9.getString("email");
                                        ResultSet rs10 = st10.executeQuery("select * from profile where email='" + email_profile + "'");
                                        if (rs10.next()) {
                                            user_name = rs10.getString("name");
                                            user_code = rs10.getString("code");

                                        }



                                %>
                                <div class="col-sm-12" style="height:20px">

                                </div>
                                <div class="col-sm-12"  id="d-<%=user_code_comment%>">
                                    <div class="col-sm-2"  > 
                                        <img src="images1/<%=user_code%>.jpg" width="70px"height="50px" class="img-circle">
                                    </div>


                                    <div class="col-sm-8" id="real_comment_date_time-<%=user_code_comment%>"><%=user_name%>:<%=date_time%></div>
                                    <div class="col-sm-2"></div>
                                    <div class="col-sm-2"></div>
                                   
                                    <div class="col-sm-8" >
                                        <div class="row">
                                            <div class="col-sm-12" id="real_comment-<%=user_code_comment%>">
                                                <span> <%=msg%></span>
                                            </div>

                                            <div class="col-sm-12" id="update_real_comment-<%=user_code_comment%>" style="display:none">
                                                <div class="row">
                                                    <div class="col-sm-12">
                                                        <div class="row">
                                                            <div class="col-sm-12">
                                                                <input type="text" value="<%=msg%>"  id="update-<%=user_code_comment%>"class="form-control">

                                                            </div>
                                                                <div class="col-sm-12">
                                                                    <span id="info_message-<%=user_code_comment%>"></span>
                                                                </div>
                                                        </div>
                                                        
                                                    </div>
                                                    <div class="col-sm-6" style="margin-top:1%">
                                                        <button class="btn btn-info" id="<%=user_code_comment%>" >Save</button>

                                                    </div>
                                                    <div class="col-sm-6" style="margin-top:1%">
                                                        <button class="btn btn-default" style="float:right" id="<%=user_code_comment%>">Cancel</button>

                                                    </div>
                                                </div>

                                            </div>

                                        </div>   


                                    </div>
                                  
                                    <div class="col-sm-2" >
                                        <div class="dropdown show">
                                            <i  class="fa fa-ellipsis-v" aria-hidden="true"  role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">

                                            </i>

                                            <div class="dropdown-menu" aria-labelledby="dropdownMenuLink"  >
                                                <%
                                                    if (email.equals(user_email_comment)) {



                                                %>
                                                <li ><span ><a style="cursor:pointer;margin-left:20px;font-size:15px" class="fa fa-edit" id="<%=user_code_comment%>" rel="<%=msg%>" rel1="<%=vedio_code%>" rel2="<%=channel_code%>">&nbsp;&nbsp;Edit</a></span></li>
                                                <li><span><a style="cursor:pointer;margin-left:20px;font-size:15px;margin-top:10px"class="fa fa-trash" id="<%=user_code_comment%>"  rel1="<%=vedio_code%>" rel2="<%=channel_code%>">&nbsp;&nbsp;Delete</a></span></li>
                                                            <%
                                                            } else if (email.equals(email_user)) {
                                                            %>   

                                                <li><span><a  style="cursor:pointer;margin-left:20px;font-size:15px;"class="fa fa-trash" id="<%=user_code_comment%>"  rel1="<%=vedio_code%>" rel2="<%=channel_code%>">&nbsp;&nbsp;Delete</a></span></li>

                                                <%
                                                } else {
                                                %>

                                                <li><span><i class="fa fa-flag" style="margin-left:20px;font-size:15px" ><a >&nbsp;&nbsp;Report</a></i></span></li>
                                                            <%                                                                     }
                                                            %>
                                            </div>
                                        </div>
                                    </div>

                                </div> 

                                <%

                                    }
                                %> 

                            </div>
                        </div>

                        <div class="col-sm-5" style="margin-top:20px">
                            <%
                                }
                                // ResultSet rs3 = st3.executeQuery("select * from channel where code='"+channel_code+"'");                    

                                ResultSet rs1 = st1.executeQuery("select * from vedio where code<>'" + vedio_code + "' AND status='" + 1 + "'ORDER BY RAND () ");
                                while (rs1.next()) {
                                    String name_channel = " ";
                                    String name_channel_code = " ";
                                    String code = rs1.getString("code");
                                    String title = rs1.getString("title");
                                    String date = rs1.getString("dt");
                                    String code_channel = rs1.getString("channel_code");
                                    ResultSet rs3 = st3.executeQuery("select * from channel where code='" + code_channel + "'");
                                    if (rs3.next()) {
                                        name_channel = rs3.getString("channel_name");
                                        name_channel_code = rs3.getString("code");
                                    }
                                    int views_count = 0;
                                     ResultSet rs8 = st3.executeQuery("select count(*) from views where vedio_code='" + code + "'");
                                    if (rs8.next()) {
                                        views_count = rs8.getInt(1);
                                    }
                            %>
                           <div class="row">
                                <div class="col-sm-6">
                                    <a href="vedio_play_secreen.jsp?code=<%=code%>&title= <%=title%>" style="color:black"> 

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
                        <div class="clearfix"> </div>
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
<%
    } else {
        response.sendRedirect("index.jsp");
    }
%>
</html>
