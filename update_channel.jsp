<%--   
    Document   : update_channel
    Created on : 28 Feb, 2022, 10:25:38 PM
    Author     : rohit
--%>

<%@page contentType="text/html"import="java.sql.*,java.util.*,java.io.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String email=" ";
    String channel_name=" ";
    String category=" ";
  
    Cookie c[]=request.getCookies();
    for(int i=0;i<c.length;i++){
         if(c[i].getName().equals("login")){
              email=c[i].getValue();
         }
    }
    if(request.getParameter("channel").length()==0 || request.getParameter("category").length()==0){  
               response.sendRedirect("your_channel.jsp?empty=1");
    }
    else{
           if(email!=null){
        
                        
      
                        try{
                                channel_name=request.getParameter("channel");
                                category=request.getParameter("category");
                        
                              Class.forName("com.mysql.jdbc.Driver");
                              Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/youtube","root","");
                              Statement st =cn.createStatement();
                              if(st.executeUpdate("update channel set channel_name='"+channel_name+"',category='"+category+"' where email='"+email+"'")>0){
                                  response.sendRedirect("your_channel.jsp?success");
                              }
  
                               

                     }
           catch(Exception e){
                        out.println(e.getMessage());
          }
          }
            else{
                response.sendRedirect("index.jsp");
            }
    }


         
    
    
    %>
