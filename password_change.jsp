<%-- 
    Document   : password_change
    Created on : 23 Feb, 2022, 3:25:49 AM
    Author     : rohit
--%>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String email=" ";
    Cookie c[]=request.getCookies();
    for(int i=0;i<c.length;i++){
          if(c[i].getName().equals("login")){
              email=c[i].getValue();
          }
    }
    if(request.getParameter("pass").length()==0 || request.getParameter("cpass").length()==0 || request.getParameter("npass").length()==0){
          response.sendRedirect("change_pass.jsp?empty");
    }
    else{
          String pass=request.getParameter("pass");
          String cpass=request.getParameter("cpass");
          String npass=request.getParameter("npass");
          
            if(email!=null && session.getAttribute(email)!=null){
        
                 try{
                       Class.forName("com.mysql.jdbc.Driver");
                       Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/youtube","root","");
                       Statement st=cn.createStatement();
                       Statement st1=cn.createStatement();
                       ResultSet rs=st.executeQuery("select password from profile where email='"+email+"'");
                       if(rs.next()){
                             if(rs.getString("password").equals(pass)){
                                   if(cpass.equals(npass)){
                                         if(st1.executeUpdate("update profile set password='"+cpass+"',confirm_pass='"+cpass+"' where email='"+email+"'")>0){
                                             response.sendRedirect("logout.jsp?success=1");
                                         }
                                   }
                                   else{
                                        response.sendRedirect("change_pass.jsp?New_Password and Confirm_Password Does't Match=1");
                                   }
                             }
                             else{
                                 response.sendRedirect("change_pass.jsp?Current_Password_does't_Match=1");
                             }
                       }
                 }
                 catch(Exception e){
                     out.println(e.getMessage());
                 }
        
            }
    }
    
    %>
