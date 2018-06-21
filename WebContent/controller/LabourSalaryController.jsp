<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="com.bionische.database.DataRetrieve"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body><% 
HttpSession sess = request.getSession(); 
String reporttype=request.getParameter("report");
String branch=request.getParameter("batch");
String indbranch=request.getParameter("indbranch");
/* String dayreport=request.getParameter("Day"); */
String monthReport=request.getParameter("Month");
String emp_id=request.getParameter("name");
/* String date=request.getParameter("date"); */
String start=request.getParameter("Startdate");
String end=request.getParameter("Enddate"); 

sess.setAttribute("salreporttype", reporttype);
sess.setAttribute("labind", indbranch);
sess.setAttribute("salbranch", branch);
/* sess.setAttribute("daysalary", dayreport); */
sess.setAttribute("monthsalary", monthReport);
sess.setAttribute("emp_id", emp_id);
/* sess.setAttribute("saldate", date); */
sess.setAttribute("salstart", start);
sess.setAttribute("salend", end);
DataRetrieve.storeDailyAttendance();
System.out.println("Report2");
response.sendRedirect("../Labour-Salary.jsp"); 
%>
</body>
</html>