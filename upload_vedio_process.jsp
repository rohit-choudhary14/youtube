<%-- 
    Document   : upload_vedio_process
    Created on : 25 Feb, 2022, 12:14:34 AM
    Author     : rohit
--%>

<%@page contentType="text/html" import="java.sql.*,java.util.* " pageEncoding="UTF-8"%>
<%
    String email=" ";
    Cookie c[]=request.getCookies();
    for(int i=0;i<c.length;i++){
           if(c[i].getName().equals("login")){
               email=c[i].getValue();
           }
    }
    if(email!=null){
             if(request.getParameter("title").length()==0 || request.getParameter("description").length()==0){
                  response.sendRedirect("vedio_upload.jsp?empty=1");
             }
             else {
                   int sn=0;
                   String code=" "; 
                   String channel_code=" ";
                   int status=0;
                   String title=request.getParameter("title");
                   String description =request.getParameter("description");
                   LinkedList l=new LinkedList();
                    for(int i=0;i<=9;i++){
                         l.add(new Integer(i));
                    }
                    for(char b='A';b<='Z';b++){
                                l.add(b+"");
                    }
                    for(char d='a';d<='z';d++){
                                l.add(d+"");
                   }
                   Collections.shuffle(l);
                   for(int i=0;i<3;i++){
                        code=code+l.get(i);
                   }
                   
                   try{
                          Class.forName("com.mysql.jdbc.Driver");
                          Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/youtube","root","");
                          Statement st=cn.createStatement();
                          ResultSet rs=st.executeQuery("select MAX(sn) from vedio");
                          if(rs.next()){
                                sn=rs.getInt(1);
                          }
                          sn++;
                          code=sn+"_"+code;
                          
                          ResultSet rs1=st.executeQuery("select * from channel where email='"+email+"'");
                          if(rs1.next()){
                              channel_code=rs1.getString("code");
                              status=rs1.getInt("status");
                          }
                          java.util.Date date=new java.util.Date();
                          java.sql.Date sqlDate=new java.sql.Date(date.getTime()); 
                          String dat=sqlDate+"";
                          PreparedStatement ps=cn.prepareStatement("insert into vedio values(?,?,?,?,?,?,?,?)");
                          ps.setInt(1,sn);
                          ps.setString(2,code);
                          ps.setString(3,title);
                          ps.setString(4,description);
                          ps.setString(5,email);
                          ps.setString(6,channel_code);
                          ps.setString(7,dat);
                          ps.setInt(8,status);
                          if(ps.executeUpdate()>0){
                              response.sendRedirect("thumbnale_upload.jsp?code="+code);
                              
                             
                              
                          }
                        
                   }
                   catch(Exception e){
                       out.println(e.getMessage());
                   }
            }
    }
  
    %>
