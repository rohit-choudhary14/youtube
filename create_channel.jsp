<%-- 
    Document   : create_channel
    Created on : 23 Feb, 2022, 4:18:14 PM
    Author     : rohit
--%>

<%@page contentType="text/html"import="java.sql.*,java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String email=" ";
    Cookie c[]=request.getCookies();
    for(int i=0;i<c.length;i++){
         if(c[i].getName().equals("login")){
              email=c[i].getValue();
         }
    }
    if(email!=null){
        
         if(request.getParameter("channel").length()==0 || request.getParameter("category").length()==0){
             response.sendRedirect("dashbord.jsp?empty=1");
         }
        else{
               
                String Channel_name=request.getParameter("channel");
                String category=request.getParameter("category");
                           int sn=0;
                           int status=1;
                           LinkedList l = new LinkedList();
                           String code=" ";
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
                                 code=code+l.get(i);
                           }
                            java.util.Date date=new java.util.Date();
                             java.sql.Date sqlDate=new java.sql.Date(date.getTime()); 
                           String dat=sqlDate+"";
                           
                           try{ 
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/youtube","root","");
                                Statement st=cn.createStatement();
                                ResultSet rs=st.executeQuery("select MAX(sn) from channel");
                                 if(rs.next()){
                                     sn=rs.getInt(1);
                                 }
                                 sn++;
                                 code=sn+"_"+code;
                                Statement st1=cn.createStatement();
                               
                                        
                                 
                                            PreparedStatement ps=cn.prepareStatement("insert into channel values(?,?,?,?,?,?,?)");
                                            ps.setInt(1,sn);
                                            ps.setString(2,code);
                                            ps.setString(3,Channel_name);
                                            ps.setString(4,category);
                                            ps.setInt(5,status);
                                            ps.setString(6,dat);
                                            ps.setString(7,email);
                                            if(ps.executeUpdate()>0){
                                                response.sendRedirect("your_channel.jsp");

                                            }
                                       cn.close();
                                    }
                                
                                
        
                            catch(Exception e){
                                out.println(e.getMessage());
                           }
         }
    }

%>




      
         
        
        
        
        
        
        
        
   