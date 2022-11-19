<%-- 
    Document   : view
    Created on : 9 Mar, 2022, 1:03:41 AM
    Author     : rohit
--%>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<%
        String vedio_code=" ";
        String email=" ";
        int status=1; 
        Cookie c[]=request.getCookies();
        for(int i=0;i<c.length;i++){
            
            if(c[i].getName().equals("login")){
                
                email=c[i].getValue();
            }
            
            
        }
        if(request.getParameter("vedio_code").length()!=0){

             vedio_code=request.getParameter("vedio_code");


        }
        try{
             Class.forName("com.mysql.jdbc.Driver");
             Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/youtube","root","");
             Statement st=cn.createStatement();
             Statement st1=cn.createStatement();
              
             ResultSet rs=st.executeQuery("select * from views where vedio_code='"+vedio_code+"' AND email='"+email+"'");
             if(rs.next()){
                 
                 
             }
             else{
                    if(st.executeUpdate("insert into views values('"+vedio_code+"','"+email+"','"+status+"')")>0){
                    }
             }
             ResultSet rs1=st1.executeQuery("select * from history where vedio_code='"+vedio_code+"' AND email='"+email+"' AND status='"+1+"'");  
             if(rs1.next()){
                 
                 
             }
             else{
                    if(st1.executeUpdate("insert into history values('"+vedio_code+"','"+email+"','"+status+"')")>0){
                    }
             }
            
        }
        catch(Exception e){
            
            
            
        }


%>
