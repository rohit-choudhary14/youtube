<%-- 
    Document   : delete_vedio
    Created on : 1 Mar, 2022, 6:11:46 PM
    Author     : rohit
--%>
<%@page contentType="text/html"import="java.sql.*,java.util.*,java.io.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    
     String email=" ";
    String code=" ";
    int status=0;
    Cookie c[]=request.getCookies();
    for(int i=0;i<c.length;i++){
         if(c[i].getName().equals("login")){
             email=c[i].getValue();
         }
        
        
    }
    if(request.getParameter("code").length()!=0){
        
        code=request.getParameter("code");
    }
    try{
           Class.forName("com.mysql.jdbc.Driver");
           Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/youtube","root","");
           Statement st=cn.createStatement();
           if(st.executeUpdate("update vedio set status='"+status+"'  where code='"+code+"' ")>0){
               response.sendRedirect("your_channel.jsp?success");
           }
    }
    catch(Exception e){
        out.println(e.getMessage());
    }
    
    
    %>