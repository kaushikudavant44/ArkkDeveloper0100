<%@page import="com.bionische.mail.SendMail"%>
<%@page import="com.bionische.database.DataSave"%>
<%@page import="com.bionische.database.DataRetrieve"%>
  
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- font-awesome icons -->
<link href="css/font-awesome.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>

<% 
         String id;
         String pwd;
         
         String email=request.getParameter("email"); 
         
           pwd=DataRetrieve.isValidUser(email); 
           
           System.out.println("email"+email);
           System.out.println("sfghj"+pwd);
         if(pwd!=null){
        	  
        	 SendMail.sendMail(pwd, email);
        	 
        	 %>
     		<script>
     		if(confirm("Mail send successfully")){
     			window.location.href = "../login.jsp";
     		}
     			</script>
     		<%
     	}
                  else
         {%>
        	 
         <script>
        	 if(confirm("You enter incorrect Email")){
     			window.location.href = "../ForgetPassword.jsp";
        	 }
        	 </script>
        <%  }%>
         
         
</body>
</html>