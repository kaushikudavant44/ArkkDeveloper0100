package com.bionische.mail;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.File;

import java.util.Iterator;
import java.util.List;


import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
/**
 * Servlet implementation class UploadServlet
 */
public class UploadServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
	private boolean isMultipart;
	   private String filePath;
	   private int maxFileSize = 400 * 1024;
	   private int maxMemSize = 80 * 1024;
	   private File file ;

	   public void init( ){
	      // Get the file location where it would be stored.
	       filePath = getServletContext().getInitParameter("file-path"); 
	       System.out.println("filePath"+filePath);
	   }
	   public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException, java.io.IOException {
		   System.out.println("hi");
		   // Check that we have a file upload request
	      isMultipart = ServletFileUpload.isMultipartContent(request);
	      System.out.println(isMultipart);
	      response.setContentType("text/html");
	      java.io.PrintWriter out = response.getWriter( );

	      System.out.println("servletclass");
	      
	      if( !isMultipart )
	      {
	         out.println("No Upload This Time");
	         return;
	      }
	      DiskFileItemFactory factory = new DiskFileItemFactory();
	      
	      
	      // maximum size that will be stored in memory
	      factory.setSizeThreshold(maxMemSize);
     
	      // Location to save data that is larger than maxMemSize.
	      factory.setRepository(new File("c:\\temp"));

	      // Create a new file upload handler
	      ServletFileUpload up = new ServletFileUpload(factory);
	      
	      

	      up.setSizeMax( maxFileSize );

	      try{ 

	      List fileItems = up.parseRequest(request);
		

	      Iterator element = fileItems.iterator();
 
	      out.println("<html>");
	      out.println("<head>");
	      out.println("<title>Servlet upload</title>");  
	      out.println("</head>");
	      out.println("<body>");
	      while ( element.hasNext () ) 
	      {
	        FileItem fi = (FileItem)element.next();
	         if ( !fi.isFormField () )	
	         {
	            
	            String fieldName = fi.getFieldName();
	            String fileName = fi.getName();
	            
	            System.out.println(fileName);
	            String contentType = fi.getContentType();
	            boolean isInMemory = fi.isInMemory();
	            long sizeInBytes = fi.getSize();
	            				 
	            
	            if( fileName.lastIndexOf("\\") >= 0 ){
	               file = new File( filePath+fileName.substring( fileName.lastIndexOf("\\"))) ;
	               System.out.println("file:"+file);
	            }else{
	               file = new File( filePath+fileName.substring(fileName.lastIndexOf("\\")+1)) ;
	               System.out.println("file:"+file);
	            }
	          
	            HttpSession sess=request.getSession();
	            sess.setAttribute("filename",fileName);
	            
	            
	            
	            String type=(String)sess.getAttribute("LABOURPGE");
	            System.out.println(type);
		           if(type.equals("LABOUR"))
		           {
		            response.sendRedirect("manage-labour.jsp");
		           }
		           else if(type.equals("LABOURedit"))
		           {
		        	   response.sendRedirect("LabourPopup.jsp");  
		           }
		           else if(type.equals("Employeeedit"))
		           {
		        	   response.sendRedirect("popup.jsp");  
		           }
		           else if(type.equals("EMPLOYEE"))
		           {
		        	   response.sendRedirect("manage-employee.jsp");
		           }
		           
		           System.out.println("file:"+file);
		           fi.write( file ) ;
		            out.println("Uploaded Filename: " + fileName + "<br>"+ filePath);
	         }
	      }
	      out.println("</body>");
	      out.println("</html>");
	   }catch(Exception ex) {
	       System.out.println(ex);
	   } 
	   }

	   public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException { doPost(request, response); }
	   	    
	


}