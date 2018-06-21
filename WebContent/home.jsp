<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="Message.jsp" %>
<!DOCTYPE html>
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
}   */
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
      <li class="treeview"> <a href="#"> <i class="fa fa-fw fa-user"></i> <span>Account Management</span> <span class="pull-right-container"> <i class="fa fa-angle-left pull-right"></i> </span> </a>
        <ul class="treeview-menu">
          <li><a href="ManaulAttendance.jsp"><i class="fa fa-circle-o"></i> ManaulAttendance</a></li> 
          <li><a href="manage-branch.jsp"><i class="fa fa-circle-o"></i> Manage Branch</a></li>
          <li><a href="manage-employee.jsp"><i class="fa fa-circle-o"></i> Manage Employee</a></li>
          <li><a href="all-employee.jsp"><i class="fa fa-circle-o"></i> Show All Employee </a></li>
           <li><a href="DayReport.jsp"><i class="fa fa-circle-o"></i>Employees working in multiple branches</a></li>
        </ul>
      </li>
      <li class="treeview"> <a href="#"> <i class="fa fa-pie-chart"></i> <span>Report</span> <span class="pull-right-container"> <i class="fa fa-angle-left pull-right"></i> </span> </a>
        <ul class="treeview-menu">
          <li><a href="attendance-reports.jsp"><i class="fa fa-circle-o"></i>Employee and Labour Attendance Reports</a></li>
        </ul>
      </li>
      <li class="treeview"> <a href="#"> <i class="fa fa-fw fa-money"></i> <span>Salary</span> <span class="pull-right-container"> <i class="fa fa-angle-left pull-right"></i> </span> </a>
        <ul class="treeview-menu">
          <li><a href="Employee-salary.jsp"><i class="fa fa-circle-o"></i> Employee</a></li>
          <li><a href="Labour-Salary.jsp"><i class="fa fa-circle-o"></i> Labour</a></li>
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
     <li><a href="index.jsp"><i class="fa fa-dashboard"></i> Dashboard</a></li>
     <li><a href="../lang/en/modules/main/dashboard/dashboard.jsp?UserId=1&PageId=1">Logout</a></li>
    
  </ol>
</section>


    <!-- Main content -->
    <section class="content index">
	<ol class="breadcrumb1">
		<!-- <li><a href="#"><i class="fa fa-dashboard"></i> Calendar</a></li> -->
	  </ol>
	  <div class="clearfix"></div>
      <div class="row">
        <div class="col-md-4 col-lg-4 col-xs-12">
			<div class="white-blk">
				<div class="user-bg">
					<a href="#"><div class="user-circle">
						<img src="images/User-Icon.png" class="thumb-lg img-center img-responsive">
						<h4 >Admin</h4>
					</div></a>
					
				</div>
				<div class="edit-profile">
					<ul>
						<li><a href="change-password.jsp" class="hvr-float"> Change password</a></li>
						<li><a href="all-employee.jsp" class="hvr-float"> Edit Profile</a></li>
						<li>Root Admin</li>
						 
					</ul>
				</div>
			</div>
		
         </div>
		 
		 
		 <div class="col-md-4 col-lg-4 col-xs-12">
			<div class="white-blk">
				<div class="user-bg sky">
					 <div id="myCarousel" class="carousel slide" data-interval="2000" data-ride="carousel">
    	<!-- Carousel indicators -->
    	
    	
    	
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li> 
        </ol>   
        <!-- Wrapper for carousel items -->
        <div class="carousel-inner">
            <div class="active item">
            
               <div class="user-circle"> <img src="images/User-Icon.png" class="thumb-lg img-center img-responsive">
          <h4 >Account Management</h4>
        </div>
         		
            </div>
            
            
        <!-- Carousel controls -->
        
    </div>
</div>
</div>
<!--Slide  -->
      
					
				</div>
				<div class="edit-profile">
					<ul>
						<li><a href="manage-employee.jsp" class="hvr-float"> Add Employee</a></li>
						<li><a href="all-employee.jsp" class="hvr-float"> Edit Employee Profile</a></li>
						
						 
					</ul>
				</div>
			</div>
		
         
		 
		 <div class="col-md-4 col-lg-4 col-xs-12">
			<div class="white-blk">
				<div class="user-bg orange">
					<a href="#"><div class="user-circle">
						<img src="images/User-Icon.png" class="thumb-lg img-center img-responsive">
						<h4 >Reports</h4>
					</div></a>
					
				</div>
				<div class="edit-profile">
					<ul>
						<li><a href="attendance-reports.jsp" class="hvr-float"> Attendance Report</a></li>
						<li><a href="all-employee.jsp" class="hvr-float"> Employee Details</a></li>
											 
					</ul>
				</div>
			</div>
		
         </div>
		 </div>
		</div>	
           

         
<!-- ./wrapper -->


<script src="js/jquery.min.js"></script>

<script src="js/bootstrap.min.js"></script>

<script src="js/jquery.dataTables.min.js"></script>
<script src="js/dataTables.bootstrap.min.js"></script>

<script src="js/jquery.slimscroll.min.js"></script>

<script src="js/fastclick.js"></script>

<script src="js/adminlte.min.js"></script>

<script src="js/demo.js"></script>

<script>
  $(function () {
    $('#example1').DataTable()
    $('#example2').DataTable({
      'paging'      : true,
      'lengthChange': false,
      'searching'   : false,
      'ordering'    : true,
      'info'        : true,
      'autoWidth'   : false
    })
  })
</script>
</body>
</html>