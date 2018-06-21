<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.bionische.database.DataRetrieve"%>
    <%@page import="com.bionische.bean.EmployeeRegistration"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<% 
	System.out.println("delete");
    String branch=request.getParameter("branch");
	String id=request.getParameter("id");
	
    System.out.println("branch:"+branch);
    System.out.println("id:"+id);
	 
	boolean productDetails=DataRetrieve.removeProduct(id,branch); 

 
	  if(productDetails)
	 { %>	<script>
		 if(confirm("Employee Deleted Successfully Successfully")){
		 	window.location.href = "../all-employee.jsp";
		 }
		 	</script><% }

	 	
	 else{
		 %>	<script>
		 if(confirm("Employee Deleted Successfully Successfully")){
		 	window.location.href = "../all-employee.jsp";
		 }
		 	</script><%  
	 } 
    
%>
</body>
</html>