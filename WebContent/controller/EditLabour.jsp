<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.bionische.database.DataRetrieve"%>
    <%@page import="com.bionische.bean.EmployeeRegistration"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">


</head>
<body>


<%   System.out.println("Edit page");
     HttpSession s=request.getSession(false);
	 String id=(String)session.getAttribute("edittt");
	 String branch=(String)session.getAttribute("editbranchhh");
	 
      String type=request.getParameter("type");
      
      String firstName=request.getParameter("firstName");
      String lastName=request.getParameter("lastName");
      
      String mobileNumber=request.getParameter("mobileNumber");
      
      String tol=request.getParameter("tol");
      
      String picture=request.getParameter("picture");
      String document=request.getParameter("document");
      
      String salary=request.getParameter("salary");
      System.out.println("done"+picture);
      System.out.println("done"+document);
    
      System.out.println("lastName"+lastName);
      
    boolean productDetails=DataRetrieve.editLabour(id,firstName,lastName,mobileNumber,tol,salary,picture,document,branch);
     
     if(productDetails)
    	 %>
    	 <script>
		if(confirm("Information Updated Successfully")){
			
			window.location.href = "../all-labour.jsp";
			}else{
				alert("Information not save please try again");
			}
		</script>
    
</body>
</html>