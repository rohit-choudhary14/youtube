<%-- 
    Document   : logout
    Created on : 21 Feb, 2022, 11:53:56 PM
    Author     : rohit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
    String email=null;
    Cookie c=new Cookie("login",email); 
    c.setMaxAge(0);
    response.addCookie(c);
    response.sendRedirect("index.jsp");
    
    
    
    %>