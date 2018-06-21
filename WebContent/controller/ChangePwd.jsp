<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.bionische.database.DataRetrieve"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String Currentpwd=request.getParameter("current");
System.out.println("current:"+Currentpwd);

String Newpwd=request.getParameter("new");
System.out.println("Newpwd:"+Newpwd);
String Retypepwd=request.getParameter("retype");

boolean Reset=DataRetrieve.compareOldPsw(Currentpwd);
if(Reset)
{
	boolean pwdreset=DataRetrieve.reset(Currentpwd,Newpwd);
	if(pwdreset)
	{
		%> <script>
		if(confirm("Password Reset Successfully")){
			
			window.location.href = "change-password.html";
			}
		</script><% 
		
		
	}
}
else
{
	%> <script>
	if(confirm("Old Password is incorrect")){
		
		window.location.href = "change-password.html";
		}
	</script><% 
	
}
%>
</body>
</html>