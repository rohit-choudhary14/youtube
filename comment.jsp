<%-- 
    Document   : comment
    Created on : 5 Mar, 2022, 4:36:34 AM
    Author     : rohit
--%>

<%@page contentType="text/html"  import="java.sql.*,java.util.*"pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<%
    String code=" ";
    String msg=" ";
    String email=" ";
    String vedio_code=" ";
    String user_code_comment=" "; 
    Cookie c[]=request.getCookies();
    for(int i=0;i<c.length;i++){
        
        if(c[i].getName().equals("login")){
            
            email=c[i].getValue();
        }
        
        
    }
    if(request.getParameter("code").length()!=0 && request.getParameter("msg").length()!=0 &&request.getParameter("vedio_code").length()!=0){
         code=request.getParameter("code");
         msg=request.getParameter("msg"); 
         vedio_code=request.getParameter("vedio_code");
        
    }
    if(request.getParameter("user_code").length()!=0){ 
         user_code_comment=request.getParameter("user_code");
        
        
    }
    try{
                          LinkedList l = new LinkedList();
                           String user_code="";
                           int sn=0;
                           for(int i=0;i<=9;i++){
                                 l.add(new Integer(i));
                           }
                           for(char j='A';j<='Z';j++){
                                l.add(j+"");
                           }
                           for(char h='a';h<='z';h++){ 
                                l.add(h+"");
                           }
                           Collections.shuffle(l);
                           for(int i=0;i<3;i++){
                                 user_code=user_code+l.get(i);
                           }
        
        
        
        
        
        
                          java.util.Date date=new java.util.Date();
                          java.sql.Date sqlDate=new java.sql.Date(date.getTime()); 
                          String dat=sqlDate+"";
                          Class.forName("com.mysql.jdbc.Driver");
                          Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/youtube","root","");
                          Statement st=cn.createStatement();
                          ResultSet rs=st.executeQuery("select MAX(sn) from comment");
                          if(rs.next()){
                              
                              sn=rs.getInt(1); 
                              
                          }
                          sn++; 
                         ResultSet rs1=st.executeQuery("select * from comment where user_code='"+user_code_comment+"'");
                         if(rs1.next()){
                             
                             if(st.executeUpdate("update comment set comment='"+msg+"' where user_code='"+user_code_comment+"'")>0){
                                 
                                 out.print("success");
                             }
                             
                             
                             
                         }
                         else{
                                    PreparedStatement ps=cn.prepareStatement("insert into comment values(?,?,?,?,?,?,?)"); 
                                    ps.setInt(1,sn);
                                    ps.setString(2,user_code);
                                    ps.setString(3,email);
                                    ps.setString(4,code);
                                    ps.setString(5,msg);
                                    ps.setString(6,vedio_code);
                                    ps.setString(7,dat);
                                    if(ps.executeUpdate()>0){ 

                                      ResultSet rs2=st.executeQuery("select * from comment where user_code='"+user_code+"' AND email='"+email+"'");
                                      if(rs2.next()){
                                          
                                          String comment=rs2.getString("comment");
                                          String dt=rs2.getString("dt_time"); 
                                          ResultSet rs3=st.executeQuery("select * from profile where email='"+email+"'");
                                          if(rs3.next()){
                                              int total_comment=0; 
                                              String name=rs3.getString("name");
                                              String code_profile=rs3.getString("code");
                                               ResultSet rs4=st.executeQuery("select count(*) from comment where vedio_code='"+vedio_code+"'");
                                               if(rs4.next()){
                                                  total_comment=rs4.getInt(1);  
                                                  
                                               }
                                             out.print(name+"-"+code_profile+"/"+dt+"@"+comment+"$"+total_comment);//rohit_abc5/3-2-2022@i love this song$7
                                          
                                              
                                          }
                                          
                                          
                                           
                                          
                                      }

                                   }
                         }
        
        
        
        
    }
    catch(Exception e){
        
        
        
    }
    
    
    
    %>