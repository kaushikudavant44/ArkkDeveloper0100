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
{	
	  %>	<script>
	if(confirm("Saved Successfully")){
		window.location.href = "../manage-firm.jsp";
	}
		</script><% }
	else{%>
		<script>
		if(confirm("Not Saved Successfully")){
			window.location.href = "../manage-firm.jsp";
		}
		</script>
	<% }%>