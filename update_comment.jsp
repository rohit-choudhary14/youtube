<%-- 
    Document   : update_comment
    Created on : 1 Jul, 2022, 10:43:17 AM
    Author     : rohit
--%>

<%@page contentType="text/html"import="java.sql.*" pageEncoding="UTF-8"%>
<%
    String email=null;
    String id="";
    String message="";
    Cookie c[]=request.getCookies();
    for(int i=0;i<c.length;i++){
        if(c[i].getName().equals("login")){
            email=c[i].getValue();
        
         }
    }
    if(email!=null){
                     if(request.getParameter("id").length()==0 || request.getParameter("message").length()==0){
                         
                     }
                     else{
                          id=request.getParameter("id");
                          message=request.getParameter("message");
                          try{
                               Class.forName("com.mysql.jdbc.Driver");
                               Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/youtube","root","");
                               Statement st=cn.createStatement();
                               if(st.executeUpdate("update comment set comment='"+message+"' where user_code='"+id+"'")>0){
                                  out.print("success");
                               }
                          }
                          catch(Exception e){
                              
                          }
                          
                     }
    }
    else{
        
    }
    
    
    
    
    %>