<%@page import="com.bionische.bean.EmployeeRegistration"%>
<%@page import="com.bionische.database.DataRetrieve"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<% 
int CURRENT_USER_ID;
String logInID=request.getParameter("logInId");
String password=request.getParameter("password");

HttpSession sess = request.getSession(); 
sess.setAttribute("logInId", logInID);
sess.setAttribute("password", password);

System.out.println("username:-"+sess.getAttribute("logInId"));
System.out.println("password"+sess.getAttribute("password"));
CURRENT_USER_ID=DataRetrieve.isValidUser(logInID,password);
System.out.println(CURRENT_USER_ID);
 if(CURRENT_USER_ID==1){
 	 response.sendRedirect("../index.jsp");
	}
 else if(CURRENT_USER_ID==2){
 	 response.sendRedirect("../Employeeindex.jsp");
	}
 else{%>
		<script>
		if(confirm("Either mail/password is incorrect,please re-enter")){
			window.location.href = "../login.jsp";
		}
			</script>
		<%
	}
 %>