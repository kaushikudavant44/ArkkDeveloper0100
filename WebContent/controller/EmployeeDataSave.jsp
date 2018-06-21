<%@page import="com.bionische.bean.EmployeeRegistration"%>
<%@page import="com.bionische.database.DataRetrieve"%>
<%@ page import="com.bionische.database.DataSave"%>
<jsp:useBean id="obj" class="com.bionische.bean.EmployeeRegistration"/>
<jsp:setProperty property="*" name="obj"/>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
boolean employeeDetails=DataSave.setEmployeeProfileDetails(obj);
if(employeeDetails)
{%>
<script>
if(confirm("Saved Successfully")){
	window.location.href = "../manage-employee.jsp";
}</script>
<% }
else
{%>
<script>
if(confirm("Not Saved,Please try again")){
	window.location.href = "../manage-employee.jsp";
}
</script>
<% }%>

