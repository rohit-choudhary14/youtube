<%-- 
    Document   : subscribe_channel
    Created on : 4 Mar, 2022, 2:18:37 PM
    Author     : rohit
--%>

<%@page contentType="text/html" import="java.sql.*"pageEncoding="UTF-8"%>
<%
    String email=" ";
    String channel_code=" ";
    String channel_name=" "; 
    Cookie c[]=request.getCookies(); 
    for(int i=0;i<c.length;i++){
         if(c[i].getName().equals("login")){
            email=c[i].getValue(); 
             
         }
        
    }
    if(request.getParameter("code").length()!=0){ 
        
        channel_code=request.getParameter("code");
    }
    try{
          String all_code=" ";
          String val="SUBSCRIBED";
          String cls="fa fa-bell";
          String clr="orange";
          Class.forName("com.mysql.jdbc.Driver");
          Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/youtube","root","");
          Statement st=cn.createStatement();
          ResultSet rs=st.executeQuery("select channel_name from channel where code='"+channel_code+"'");
          if(rs.next()){
              channel_name=rs.getString("channel_name");
              
          }
           ResultSet rs1=st.executeQuery("select * from subscribe where channel_code='"+channel_code+"' AND email='"+email+"'");
           if(rs1.next()){
                    if(st.executeUpdate("delete from subscribe where channel_code='"+channel_code+"' AND email='"+email+"'")>0){
                        out.print("SUBSCRIBE/none_red");
                    }
               
           }
           else{
                 if(st.executeUpdate("insert into subscribe values('"+email+"','"+channel_code+"','"+channel_name+"','"+val+"','"+cls+"','"+clr+"')")>0){ 
 

                    out.print("SUBSCRIBED/fa fa-bell_orange");// 
               }
           }
        
        
        
    }
    catch(Exception e){
        
        out.print(e.getMessage()); 
    }
    
    
    
    %>
