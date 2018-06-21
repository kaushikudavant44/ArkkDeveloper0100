<%@ page import="com.bionische.database.DataSave"%>
<jsp:useBean id="obj" class="com.bionische.bean.EmployeeRegistration"/>
<jsp:setProperty property="*" name="obj"/>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
String name=request.getParameter("name");
System.out.println(name);
boolean userInfo=DataSave.setEmployeeProfileDetails(obj);

if(userInfo)
	out.println("Account create successfully");
	
else
	out.println("Email Address Alredy Used Please Enter Another Email...");
%>
