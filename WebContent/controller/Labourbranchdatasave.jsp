<%@page import="com.bionische.bean.BranchDetails"%>
<%@page import="com.bionische.database.DataRetrieve"%>
<%@ page import="com.bionische.database.DataSave"%>
<jsp:useBean id="obj" class="com.bionische.bean.BranchDetails"/>
<jsp:setProperty property="*" name="obj"/>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
boolean branchDetails=DataSave.setBranchDetails(obj);
if(branchDetails)
	
	response.sendRedirect("../manage_site.jsp");
else
	out.println("Please fill again data is not store");
%>

