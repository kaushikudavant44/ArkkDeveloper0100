<%@page import="com.bionische.bean.BranchDetails"%>
<%@page import="com.bionische.bean.EmployeeRegistration"%>
<%@page import="com.bionische.database.DataRetrieve"%>
<%@ page import="com.bionische.database.DataSave"%>
<%@ page import="java.io.*,java.util.*,java.sql.*" %> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
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

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <header class="main-header">
    <!-- Logo -->
    <a href="../../index2.html" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>A</b>RKK</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>ARKK</b>BUILDERS</span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </a>

      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          
          <li>
            <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
          </li>
        </ul>
      </div>
    </nav>
  </header>
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="../../dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p>Alexander Pierce</p>
          <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
        </div>
      </div>
      <!-- search form -->
      <form action="#" method="get" class="sidebar-form">
        <div class="input-group">
          <input type="text" name="q" class="form-control" placeholder="Search...">
          <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
              </span>
        </div>
      </form>
      <!-- /.search form -->
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header">MAIN NAVIGATION</li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-fw fa-user"></i>  <span>Account Management</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="company-details.jsp"><i class="fa fa-circle-o"></i> Company Details</a></li>
            <li><a href="manage-branch.jsp"><i class="fa fa-circle-o"></i> Manage Branch</a></li>
			<li><a href="manage-employee.jsp"><i class="fa fa-circle-o"></i> Manage Employee</a></li>
			<li><a href="employee-device-map.html"><i class="fa fa-circle-o"></i> Employee Device Map</a></li>
			<li><a href="all-employee.jsp"><i class="fa fa-circle-o"></i> Show All Employee </a></li>
			
          </ul>
        </li>
        
        <li class="treeview">
          <a href="#">
            <i class="fa fa-pie-chart"></i>
            <span>Report</span>
            <span class="pull-right-container">
                  <i class="fa fa-angle-left pull-right"></i>
                </span>
          </a>
          <ul class="treeview-menu">
			<li><a href="attendance-reports.jsp"><i class="fa fa-circle-o"></i>Attendance Reports</a></li>
            
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-fw fa-money"></i>
            <span>Salary</span>
            <span class="pull-right-container">
                  <i class="fa fa-angle-left pull-right"></i>
                </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="Employee-salary.jsp"><i class="fa fa-circle-o"></i> Employee</a></li>
            <li><a href="labour-salary.html"><i class="fa fa-circle-o"></i> Labour</a></li>
            </ul>
        </li>
        
        <li class="treeview">
          <a href="#">
            <i class="fa fa-fw fa-gear"></i> <span>Settings</span>
            <span class="pull-right-container">
                  <i class="fa fa-angle-left pull-right"></i>
                </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="change-password.html"><i class="fa fa-circle-o"></i> Change Password</a></li>
            
          </ul>
        </li>
        
         
        
        
      </ul>
    </section>
  
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header head-bg">
      <h1>
        Data Tables
        <small>advanced tables</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="index.jsp"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="Logout.jsp">Logout</a></li>
        
      </ol>
	  
	  
    </section>

    <!-- Main content -->
    <section class="content index">
		
			<div class="1middle-bg">
				<div class="row">
					<div class="col-lg-12 col-md-12">
						<div class="emply-details">
							<div class="row">
								<div class="col-md-4 col-ms-4">
									<div class="counter-blk">
				<%
      				List<BranchDetails> branchData=new ArrayList<BranchDetails>();
      				
                    branchData=DataRetrieve.getBranchDetails();
                    	
                 //   System.out.println(branchData);		
      			BranchDetails branchDetails=new BranchDetails();
      			%>
									<div class="counter hvr-radial-in"><%=branchDetails.getTotalBranch() %></div>
									<div class="emply-count">Total Branch</div>
									<div class="clearfix"></div>
									</div>
								
								</div>
								<div class="col-md-4 col-ms-4">
									<div class="counter-blk">
									<div class="counter orange hvr-radial-in">150</div>
									<div class="emply-count">Employee Count</div>
									<div class="clearfix"></div>
									</div>
									
								</div>
								
							</div>
						</div>
					</div>
					
				</div>
			
			<div class="row">
				<div class="col-xs-8">
				<div class="add-blk">
				<div class="panel-heading green"><h3>ADDRESS</h3></div>
				<div class="middle-bg">
					<h3>Arkk Builders & Developer</h3>
					<p>admin@arkkbuilders.com</p>
					<p>H-5, New Sankheswar Parshevanath Apartment, Behind Sugar Marchant Association, Opp Pawan Dairy Lane, Lane besides Abhinandan Lawns, off Lam Road Deolali, Nashik-422401, Maharashtra, India.</p>
					<p>Phone : 9892980681</p>
					
				</div>
					</div>
				</div>
			</div>
			</div>
		
		
	</section>
	
	 
     
			
           

         
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
