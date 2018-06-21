<%@page import="com.bionische.bean.EmployeeRegistration"%>
<%@page import="com.bionische.database.DataRetrieve"%>
<%@page import="com.bionische.mail.SMSSending"%>
<%@ page import="com.bionische.database.DataSave"%>
<jsp:useBean id="obj" class="com.bionische.bean.DailyAttendance"/>
<jsp:setProperty property="*" name="obj"/>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
     SMSSending.startScheduleTaskAtTen();
     SMSSending.startScheduleTaskAtTwelve();
     SMSSending.startScheduleTaskAtBirthday(); 

%>

