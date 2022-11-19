<%-- 
    Document   : check_login
    Created on : 21 Feb, 2022, 11:21:03 PM
    Author     : rohit
--%>

<%@page contentType="text/html"import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <%
     if(request.getParameter("email").length()==0 || request.getParameter("pass").length()==0){
            response.sendRedirect("index.jsp?empty=1");
            
     }
     else{
             String email=request.getParameter("email");
             String pass=request.getParameter("pass");
             try{
                  Class.forName("com.mysql.jdbc.Driver");
                  Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/youtube","root","");
                  Statement st=cn.createStatement();
                  ResultSet rs=st.executeQuery("select * from profile where email='"+email+"'");
                  if(rs.next()){
                        if(rs.getString("password").equals(pass)){
                            Cookie c=new Cookie("login",email);
                            c.setMaxAge(36000);
                            response.addCookie(c);
                            response.sendRedirect("vedio_play_dashbord.jsp");  
                        }
                        else{
                             response.sendRedirect("index.jsp?Invalid_Password=1");
                        }
                  }
                  else{
                       response.sendRedirect("index.jsp?Invalid_Email=1");
                  }
                  
             }
             catch(Exception e){
                 out.println(e.getMessage());
             }
     }
     
     
     
     
     
     
     %>
