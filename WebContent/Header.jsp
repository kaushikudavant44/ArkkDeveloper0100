<%@page import="com.bionische.bean.DailyAttendance"%>
<%@page import="com.bionische.bean.BranchDetails"%>
<%@page import="com.bionische.bean.EmployeeRegistration"%>
<%@page import="com.bionische.database.DataRetrieve"%>
<%@ page import="com.bionische.database.DataSave"%>
<%@page import="com.bionische.controller.Report"%> 
<%@page import="com.bionische.mail.SMSSending"%>
<%@ page import="java.io.*,java.util.*,java.sql.*" %> 

<jsp:useBean id="obj" class="com.bionische.bean.BranchDetails"/>
<jsp:setProperty property="*" name="obj"/>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Arc Builder Dashboard</title>
<!-- Tell the browser to be responsive to screen width -->
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<!-- Bootstrap 3.3.7 -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet" href="css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet" href="css/ionicons.min.css">
<!-- DataTables -->
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="css/AdminLTE.min.css">
<link rel="stylesheet" href="css/custom.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" href="css/_all-skins.min.css">

<!-- Google Font -->
<link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
        <style>
.massege-block {
	margin: 15% auto;
	width: 50%;
}
</style>
        
</head>
<% HttpSession sess = request.getSession(); 
String indexid=(String)sess.getAttribute("indexlogin");
 /* if(indexid==null)
{
	response.sendRedirect("../lang/en/modules/main/login/login.jsp");
}  */  
%>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
<header class="main-header"> 
  <!-- Logo --> 
  <a href="../../index2.html" class="logo"> 
  <!-- mini logo for sidebar mini 50x50 pixels --> 
  <span class="logo-mini"><b>A</b>RKK</span> 
  <!-- logo for regular state and mobile devices --> 
  <span class="logo-lg"><b>ARKK</b>BUILDERS</span> </a> 
  <!-- Header Navbar: style can be found in header.less -->
  <nav class="navbar navbar-static-top"> 
    <!-- Sidebar toggle button--> 
    <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </a>
    <div class="navbar-custom-menu">
      <ul class="nav navbar-nav">
        <li> <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a> </li>
      </ul>
    </div>
  </nav>
</header>
<!-- Left side column. contains the logo and sidebar -->
<aside class="main-sidebar"> 
  <!-- sidebar: style can be found in sidebar.less -->
  <section class="sidebar"> 
    <!-- Sidebar user panel -->

    
    <!-- sidebar menu: : style can be found in sidebar.less -->
    <ul class="sidebar-menu" data-widget="tree">
      <li class="header">MAIN NAVIGATION</li>
      <li class="treeview"> <a href="#"> <i class="fa fa-fw fa-user"></i> <span>Employee Account Management</span> <span class="pull-right-container"> <i class="fa fa-angle-left pull-right"></i> </span> </a>
        <ul class="treeview-menu">
          <li><a href="EmployeeManaulAttendance.jsp"><i class="fa fa-circle-o"></i> ManaulAttendance</a></li> 
          <li><a href="manage-firm.jsp"><i class="fa fa-circle-o"></i> Manage Firm</a></li>
          <li><a href="manage-employee.jsp"><i class="fa fa-circle-o"></i> Manage Employee</a></li>
          <li><a href="all-employee.jsp"><i class="fa fa-circle-o"></i> Show All Employee </a></li>
           <li><a href="DayReport.jsp"><i class="fa fa-circle-o"></i>Employees working in multiple branches</a></li>
        </ul>
      </li>
      <li class="treeview"> <a href="#"> <i class="fa fa-fw fa-user"></i> <span>Labour Account Management</span> <span class="pull-right-container"> <i class="fa fa-angle-left pull-right"></i> </span> </a>
        <ul class="treeview-menu">
          <li><a href="LabourManualAttendance.jsp"><i class="fa fa-circle-o"></i> ManaulAttendance</a></li> 
          <li><a href="manage_site.jsp"><i class="fa fa-circle-o"></i> Manage Site</a></li>
          <li><a href="manage-labour.jsp"><i class="fa fa-circle-o"></i> Manage Labour</a></li>
          <li><a href="all-labour.jsp"><i class="fa fa-circle-o"></i> Show All Labour</a></li>
           <li><a href="DayReport.jsp"><i class="fa fa-circle-o"></i>Labours working in multiple branches</a></li>
        </ul>
      </li>
      <li class="treeview"> <a href="#"> <i class="fa fa-pie-chart"></i> <span>Report</span> <span class="pull-right-container"> <i class="fa fa-angle-left pull-right"></i> </span> </a>
        <ul class="treeview-menu">
          <li><a href="employee-report.jsp"><i class="fa fa-circle-o"></i>Employee Attendance Reports</a></li>
          <li><a href="labour-report.jsp"><i class="fa fa-circle-o"></i>Labour Attendance Reports</a></li>
          
        </ul>
      </li>
      <li class="treeview"> <a href="#"> <i class="fa fa-fw fa-money"></i> <span>Salary</span> <span class="pull-right-container"> <i class="fa fa-angle-left pull-right"></i> </span> </a>
        <ul class="treeview-menu">
          <li><a href="Employee-salary.jsp"><i class="fa fa-circle-o"></i> Employee Salary</a></li>
          <li><a href="Labour-Salary.jsp"><i class="fa fa-circle-o"></i> Labour Salary</a></li>
        </ul>
     </li>
     <li> <a href="EmployeeAutoSalaryGeneration.jsp"><i class="fa fa-circle-o"></i>Employee Monthly Salary</a></li>
     <li> <a href="LabourAutoSalary.jsp"> <i class="fa fa-circle-o"></i>Labour Weekly Salary</a></li>
     </ul>
  </section>
</aside>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
<!-- Content Header (Page header) -->
<section class="content-header head-bg">
  <h1> Data Tables <small>advanced tables</small> </h1>
  <ol class="breadcrumb">
    <li><a href="home.jsp"><i class="fa fa-dashboard"></i> Home</a></li>
     <li><a href="../lang/en/modules/main/dashboard/dashboard.jsp?UserId=1&PageId=1">Logout</a></li>
    
  </ol>
</section>
