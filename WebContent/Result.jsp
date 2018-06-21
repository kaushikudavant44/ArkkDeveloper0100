<%@page import="com.bionische.bean.EmployeeRegistration"%>
<%@page import="com.bionische.database.DataRetrieve"%>
<%@ page import="com.bionische.database.DataSave"%>
<jsp:useBean id="obj" class="com.bionische.bean.DailyAttendance"/>
<jsp:setProperty property="*" name="obj"/>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
boolean studentDetails=DataRetrieve.storeDailyAttendance();
if(studentDetails)
{	
  %>	<script>
if(confirm("Saved Successfully")){
	window.location.href = "../ManaulAttendance.jsp";
}
	</script><% }
else{%>
	<script>
	if(confirm("Not Saved Successfully")){
		window.location.href = "../ManaulAttendance.jsp";
	}
	</script>
<% }%>

