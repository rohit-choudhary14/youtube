<%-- 
    Document   : final_vedio_process
    Created on : 25 Feb, 2022, 1:30:32 AM
    Author     : rohit
--%>

<%@page contentType="text/html" import="java.io.* " pageEncoding="UTF-8"%>
<%
    
            String contentType = request.getContentType();
            String imageSave=null;
            byte dataBytes[]=null;
            String saveFile=null;
            String vcode=null;
            if(request.getParameter("code").length()!=0){
                
                vcode=request.getParameter("code");
                
            }
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
           
            
                String file = new String(dataBytes);
                 out.println(vcode);
                 saveFile = vcode+".mp4";
                
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
                 
                FileOutputStream fileOut = new FileOutputStream(request.getRealPath("/")+"/channelvedio/"+saveFile);
                out.println(saveFile);
                // fileOut.write(dataBytes);
                fileOut.write(dataBytes, startPos, (endPos - startPos));
                fileOut.flush();
                fileOut.close();
               response.sendRedirect("your_channel.jsp");
               
             }  
            catch (Exception e)
            {
              out.println(e.getMessage());
           
              imageSave="Failure";
            }
            }

        
%>