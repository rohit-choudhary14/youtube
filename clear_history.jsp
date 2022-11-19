<%-- 
    Document   : clear_history
    Created on : 10 Mar, 2022, 3:38:50 AM
    Author     : rohit
--%>

<%-- 
    Document   : view
    Created on : 9 Mar, 2022, 1:03:41 AM
    Author     : rohit
--%>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<%
        
        String email=" ";
        int status=0; 
        Cookie c[]=request.getCookies();
        for(int i=0;i<c.length;i++){
            
            if(c[i].getName().equals("login")){
                
                email=c[i].getValue();
            }
            
            
        }
        
        try{
             Class.forName("com.mysql.jdbc.Driver");
             Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/youtube","root","");
             Statement st=cn.createStatement();
               if(st.executeUpdate("update  history  set status='"+status+"'")>0){
                   response.sendRedirect("history.jsp?cleared");
               }
             }
            
            
            
        
        catch(Exception e){
            
            
            
        }


%>
