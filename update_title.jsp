<%-- 
    Document   : update_title
    Created on : 2 Mar, 2022, 7:55:26 PM
    Author     : rohit
--%>

<%@page contentType="text/html"import="java.sql.*" pageEncoding="UTF-8"%>
<%
   
    
    String email=" ";
    String title=" ";
    String description=" ";
    String code=" ";
    Cookie c[]=request.getCookies();
    for(int i=0;i<c.length;i++){
        if(c[i].getName().equals("login")){
            email=c[i].getValue();
        }
    }
    if(email!=null){
            if(request.getParameter("code").length()!=0 && request.getParameter("title").length()!=0 && request.getParameter("description").length()!=0){

                 code=request.getParameter("code");
                 title=request.getParameter("title");
                 description=request.getParameter("description");
             }
            try{

                 Class.forName("com.mysql.jdbc.Driver");
                 Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/youtube","root","");
                 PreparedStatement ps=cn.prepareStatement("update vedio set title =?,description =?   where code='"+code+"' ");
                 ps.setString(1,title);
                 ps.setString(2,description);
                 if(ps.executeUpdate()>0){

                   response.sendRedirect("manage_vedio.jsp?success");


               }

            }
            catch(Exception e){
                out.println(e.getMessage());
            }
            
    }
    else{
        response.sendRedirect("index.jsp");
    }
    %>