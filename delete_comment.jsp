<%-- 
    Document   : edit_comment
    Created on : 6 Mar, 2022, 11:49:53 PM
    Author     : rohit
--%>

<%@page contentType="text/html"import="java.sql.*" pageEncoding="UTF-8"%> 
<%
    
      String user_code=" "; 
      String vedio_code=" ";
      String channel_code=" ";
      String email=" ";
      Cookie c[]=request.getCookies();
      for(int i=0;i<c.length;i++){
          
          if(c[i].getName().equals("login")){
              email=c[i].getValue(); 
              
              
          }
          
          
      }
      if(request.getParameter("user_code").length()!=0 && request.getParameter("vedio_code").length()!=0 && request.getParameter("channel_code").length()!=0){
          
            user_code=request.getParameter("user_code");
            vedio_code=request.getParameter("vedio_code");
           channel_code=request.getParameter("channel_code");
        
          
      }
      try{
          
                          Class.forName("com.mysql.jdbc.Driver");
                          Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/youtube","root","");
                          Statement st=cn.createStatement();
                          int total_comment=0;
                           if(st.executeUpdate("delete from comment where user_code='"+user_code+"' AND channel_code='"+channel_code+"' AND vedio_code='"+vedio_code+"'")>0){
                               ResultSet rs4=st.executeQuery("select count(*) from comment where vedio_code='"+vedio_code+"'");
                                               if(rs4.next()){
                                                  total_comment=rs4.getInt(1);  
                                                  out.print(total_comment);
                                                  
                                               }
                            
                           }
          
         
          
      }
     catch(Exception e){
         
         
     }
     
    
    %>