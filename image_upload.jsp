<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%-- 
    Document   : Image_Upload
    Created on : 21 Feb, 2022, 3:53:24 PM
    Author     : rohit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.sql.*"%>
<%
    String email=" ";
     Cookie c[]=request.getCookies();
      for(int i=0;i<c.length;i++){
            if(c[i].getName().equals("login")){
                 email=c[i].getValue();
            }
      }
      if(email!=null && session.getAttribute(email)!=null){
          
            String contentType = request.getContentType();
            String code=" ";
            String imageSave=null;
            byte dataBytes[]=null;
            String saveFile=null;
             if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0))
            {
                    
                    DataInputStream in = new DataInputStream(request.getInputStream());
                    int formDataLength = request.getContentLength();
                    dataBytes = new byte[formDataLength];
                    int byteRead = 0;
                    int totalBytesRead = 0;
            while (totalBytesRead < formDataLength)
            {
                    byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
                    totalBytesRead += byteRead;
            }
               try{
                     Class.forName("com.mysql.jdbc.Driver");
                     Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/youtube","root","");
                     Statement st=cn.createStatement();
                     ResultSet rs=st.executeQuery("select code from profile where email='"+email+"'");
                     if(rs.next()){
                         
                          code=rs.getString("code");
                     }
                   
               }
               catch(Exception e){
                   
               }
                 
            
                String file = new String(dataBytes);
                 saveFile = code+".jpg";
                 out.println(code);
                int lastIndex = contentType.lastIndexOf("=");
                String boundary = contentType.substring(lastIndex + 1, contentType.length());
               
                int pos;
                pos = file.indexOf("filename=\"");
                pos = file.indexOf("\n", pos) + 1;
                pos = file.indexOf("\n", pos) + 1;
                pos = file.indexOf("\n", pos) + 1;
                int boundaryLocation = file.indexOf(boundary, pos) - 4;
                int startPos = ((file.substring(0, pos)).getBytes()).length;
                int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;
            try
             { 
                 
                FileOutputStream fileOut = new FileOutputStream(request.getRealPath("/")+"/images/"+saveFile);
               
                fileOut.write(dataBytes, startPos, (endPos - startPos));
                fileOut.flush();
                fileOut.close();
                imageSave="Success";
                response.sendRedirect("profile.jsp?success=1");
               
             }  
            catch (Exception e)
            {
              out.println(e.getMessage());
             
              imageSave="Failure";
            }
        }
      }
      else{
            response.sendRedirect("login.jsp");
      }
         //response.sendRedirect("index.jsp");
%>

