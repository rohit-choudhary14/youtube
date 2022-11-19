<%-- 
    Document   : dislike_vedio
    Created on : 4 Mar, 2022, 2:11:36 AM
    Author     : rohit
--%>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%> 
<%
String email=" ";
String code=" ";
String color=" ";
Cookie c[]=request.getCookies(); 
 for(int i=0;i<c.length;i++){
        if(c[i].getName().equals("login")){
            email=c[i].getValue();
        }
 }
 if(request.getParameter("code").length()!=0 && request.getParameter("color").length()!=0){ 
     code=request.getParameter("code");
     color=request.getParameter("color");
     
 }
 try{
     
        int count=0;
        int count1=0;
        int count2=0;
        int count3=0;
        int count4=0;
        int count5=0;
        int count6=0;
        int count7=0; 
        Class.forName("com.mysql.jdbc.Driver") ;
        Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/youtube","root","") ;
        Statement st=cn.createStatement();
        Statement st1=cn.createStatement();
        Statement st2=cn.createStatement();
        ResultSet rs=st.executeQuery("select * from vedio_dislike where email='"+email+"' AND vedio_code='"+code+"' ");
         if(rs.next()){
                      
                    if(st.executeUpdate("delete from vedio_dislike where email='"+email+"' AND vedio_code='"+code+"'")>0){
                         out.print("black");
                        
                    }
                    ResultSet rs4=st.executeQuery("select count(*) from vedio_dislike where  vedio_code='"+code+"'");
                    if(rs4.next()){
                        count3=rs4.getInt(1);
                        out.print("-"+count3+"_");//
                        
                    }
                    
                    if(st.executeUpdate("insert into vedio_like values('"+email+"','"+code+"','"+color+"')")>0){   
                             out.print("blue");
                    }
                    ResultSet rs7=st.executeQuery("select count(*) from vedio_like where vedio_code='"+code+"'");
                    if(rs7.next()){
                             count4=rs7.getInt(1);
                             out.print("/"+count4);//black-0_blue/1                         
                             
                    }
                         
                        
                        
                   
             
                         
         }
         else{    
             
             
                 ResultSet rs1=st1.executeQuery("select * from vedio_like where email='"+email+"' AND vedio_code='"+code+"'");
                 if(rs1.next()){
                     
                         ResultSet rs8=st1.executeQuery("select count(*) from vedio_dislike where  vedio_code='"+code+"'");
                         if(rs8.next()){
                             count6=rs8.getInt(1);
                             out.print("black"+"-"+count6+"_");
                             
                         }
                         
                         if(st1.executeUpdate("delete from vedio_like where email='"+email+"' AND vedio_code='"+code+"'")>0){
                             
                             out.print("black"+"/");
                             
                         }
                         ResultSet rs2=st1.executeQuery("select count(*) from vedio_like where  vedio_code='"+code+"'");
                         if(rs2.next()){
                             count1=rs2.getInt(1);
                             out.print(count1);
                         }
                     
                     
                 }
                 else{
                     
                       ResultSet rs9=st2.executeQuery("select count(*) from vedio_dislike where  vedio_code='"+code+"'");
                         if(rs9.next()){
                             count7=rs9.getInt(1);
                             out.print("black"+"-"+count7+"_");
                         }
                     
                        if(st2.executeUpdate("insert into vedio_like values('"+email+"','"+code+"','"+color+"')")>0){
                            
                            out.print("blue"+"/");
                           
                        }
                        ResultSet rs3=st2.executeQuery("select count(*) from vedio_like where  vedio_code='"+code+"'");
                        if(rs3.next()){
                            count2=rs3.getInt(1);
                            out.print(count2);
                            
                            
                        }
                         
                     
                     
                 }
                
             
         }
             
        
 }
 catch(Exception e){
     
     
     out.println(e.getMessage()); 
 }

%>

