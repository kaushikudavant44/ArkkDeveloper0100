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
	String id=request.getParameter("id");
	
    System.out.println(id);
	 
	boolean productDetails=DataRetrieve.removeAllLabourBranch(id);


	 if(productDetails)
	 { %>	<script>
		 if(confirm("Deleted Successfully")){
		 	window.location.href = "../manage-firm.jsp";
		 }
		 	</script><% }

	 	
	 else{
		 %>	<script>
		 if(confirm("Oopsss Failed")){
		 	window.location.href = "../manage-firms.jsp";
		 }
		 	</script><%
		 
	 }
    
%>
</body>
</html>