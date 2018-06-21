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
HttpSession sess = request.getSession(); 
String reporttype=request.getParameter("report");
String branch=request.getParameter("batch");
System.out.println(branch);
String dayreport=request.getParameter("Day");
/* String monthReport=request.getParameter("between"); */
String name=request.getParameter("name");
String date=request.getParameter("date");
String start=request.getParameter("Startdate");
String end=request.getParameter("Enddate"); 
sess.setAttribute("reporttype", reporttype);
sess.setAttribute("branch", branch);
sess.setAttribute("dayreport", dayreport);
/* sess.setAttribute("monthReport", monthReport); */
sess.setAttribute("name", name);
sess.setAttribute("date", date);
sess.setAttribute("start", start);
sess.setAttribute("end", end);
System.out.println("Report2");
DataRetrieve.storeDailyAttendance();
response.sendRedirect("../employee-report.jsp"); 
%>
</body>
</html>