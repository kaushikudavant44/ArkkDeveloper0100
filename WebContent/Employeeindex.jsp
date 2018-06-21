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
<%
HttpSession sess = request.getSession();
String employeeidentity=(String)sess.getAttribute("logInId");
%>
<!-- Left side column. contains the logo and sidebar -->
<aside class="main-sidebar"> 
  <!-- sidebar: style can be found in sidebar.less -->
  <section class="sidebar"> 
    <!-- Sidebar user panel -->

    
    <!-- sidebar menu: : style can be found in sidebar.less -->
    <ul class="sidebar-menu" data-widget="tree">
      <li class="header"><%=employeeidentity %></li>
      
      <!-- <li class="treeview"> <a href="#"> <i class="fa fa-pie-chart"></i> <span>Report</span> <span class="pull-right-container"> <i class="fa fa-angle-left pull-right"></i> </span> </a>
        <ul class="treeview-menu"> -->
          <li><a href="Employeeindex.jsp"><i class="fa fa-circle-o"></i>Employee Attendance Reports</a></li>
          <li><a href="change-password.html"><i class="fa fa-circle-o"></i> Change Password</a></li>
        <!-- </ul>
      </li> -->
    
       </ul>
  </section>
</aside>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
<!-- Content Header (Page header) -->
<section class="content-header head-bg">
  <h1> Data Tables <small>advanced tables</small> </h1>
  <ol class="breadcrumb">
    <li><a href="index.jsp"><i class="fa fa-dashboard"></i> Home</a></li>
    <li><a href="Logout.jsp">Logout</a></li>
    
  </ol>
</section>

<!-- Main content -->
<section class="content index">
  <div class="1middle-bg">
    <div class="row">
      <div class="col-md-6 col-sm-6">
        <div class="add-blk">
          <div class="panel-heading blue">
            <h3>Add Branch</h3>
          </div>
          <form action="controller/Report1.jsp" >
          <div class="middle-bg">
            
              <div class="row">
                <div class="col-md-6 col-sm-6">
                  <div class="form-group">
                    <label for="exampleInputEmail1">Choose Report Type :</label>
                    <select id="country" name="report" class="form-control">
                      <option value="B" id="text">Branchwise Report</option>
                      <option value="I">Individual Report</option>
                    </select>
                  </div>
                </div>
                <div class="col-md-6 col-sm-6">
                  <div class="form-group">
                   <label id="otherName">Enter Your Name
                  <input  type="text" class="form-control" id="choose" value="email" name="name"/> 
                  </label>
                  
                    <label id="otherbranch" for="exampleInputEmail1">Choose Branch
                    <select class="form-control" id="selectBox" name="batch" >
							 <option>--Please Select--</option>
                             <% List<BranchDetails> branchData=new ArrayList<BranchDetails>();      				
                            branchData=DataRetrieve.getBranchDetails();
                    	
                              System.out.println(branchData);		
      				          for(BranchDetails branchDetail : branchData){%>
							
                              <option><%=branchDetail.getBranchName() %></option>
                              <%} %>
                            </select></label>
                  </div>
                </div>
                
                
                <div class="row">
                <div class="col-md-12 col-sm-12">
                <div style="padding:0 15px;">
                  <label class="radio-inline">
                    <input id="id_radio1" type="radio" name="Day" value="Day" />
                    Day Report </label>
                  <label class="radio-inline">
                    <input id="id_radio2" type="radio" name="Month" value="Month" />
                    Month Report </label>
                  <label class="radio-inline">
                    <input id="id_radio3" type="radio" name="Range" value="Range" />
                    Date Range Report </label>
                </div>
                <div style="padding:15px;">
                  <div id="div1">
                    <div class="row">
                      <div class="col-md-6 col-sm-6">
                        <div class="form-group">
                          <label for="exampleInputEmail1">Choose date :</label>
                          <input type="text" class="form-control" id="exampleInputEmail1" name="date" placeholder="Choose date...">
                        </div>
                        <div class="checkbox">
                          <label>
                            <input type="checkbox" value="">
                            Include Intermediate time in download report </label>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div id="div2" style="display:none;">
                    <div class="row">
                      <div class="col-md-6 col-sm-6">
                        <div class="form-group">
                          <label for="exampleInputEmail1">Year  :</label>
                          <select class="form-control">
                            <option>-- please Select --</option>
                            <option>Year</option>
                            <option>2017</option>
                          </select>
                        </div>
                      </div>
                      <div class="col-md-6 col-sm-6">
                        <div class="form-group">
                          <label for="exampleInputEmail1">Month  :</label>
                          <select class="form-control">
                            <option>-- please Select --</option>
                            <option>Month </option>
                            <option>2017</option>
                          </select>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div id="div3" style="display:none;">
                    <div class="row">
                      <div class="col-md-6 col-sm-6">
                        <div class="form-group">
                          <label for="exampleInputEmail1">Start date :</label>
                          <input type="text" class="form-control" name="Startdate" id="exampleInputEmail1" placeholder="">
                        </div>
                      </div>
                      <div class="col-md-6 col-sm-6">
                        <div class="form-group">
                          <label for="exampleInputEmail1">End date :</label>
                          <input type="text" class="form-control" name="Enddate" id="exampleInputEmail1" placeholder="">
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                </div>
                </div>
             
                  <input type="submit" value="Run" >
                  
              </div>
           </div>
          </form>
        </div>
      </div>
      <div class="col-md-6 col-sm-6">
        <div class="add-blk">
          <div class="panel-heading blue">
            <h3>Report</h3>
          </div>
          <div class="middle-bg" id="tableWrap">
          
            <div class="table-responsive">
              <table id="example2" class="table table-bordered table-hover tbl">
              <tbody>
                 <tr>
                  <th>Sr. No</th>
                  <th>ID</th>
                  <th>First Name</th>
                  <th>Last Name</th>
                  <th>Date</th>
                  <th>Status</th>
                  <th>In Time</th>
                  <th>Out Time</th>
                </tr> 
      			<%
      			
      			List<DailyAttendance> indivisualDetail=new ArrayList<DailyAttendance>();
      			HttpSession s=request.getSession(false);
      			String reporttype=(String)session.getAttribute("reporttype");
      			String branch=(String)session.getAttribute("branch");
      			String dayreport=(String)session.getAttribute("dayreport");
      			String monthReport=(String)session.getAttribute("monthReport");
      			String id=(String)session.getAttribute("name");
      			String date=(String)session.getAttribute("date");
      			String start=(String)session.getAttribute("start");
      			String end=(String)session.getAttribute("end");
      			
      			String s1="I";
      			String s2="Day";
      			String s3="month";
      			String s4="B";
      			String s5="null";
      			if( reporttype != null && reporttype.equals(s1))
      			{System.out.println("ddddd");
      					if(dayreport != null && dayreport.equals(s2)){
      						
      						indivisualDetail=DataRetrieve.getEmployeeDailyAttendance(id,date);;
      					
      				}else if(monthReport != null && monthReport.equals(s3)){
      					
      					indivisualDetail=DataRetrieve.getEmployeeDailyAttendance(id,start,end);
      				}
      			}	
      			
      		 else if(reporttype != null && reporttype.equals(s4))
      			{
      				if(dayreport != null && dayreport.equals(s2)){
      					System.out.println("dfghjk");
      					indivisualDetail=DataRetrieve.getEmployeeDailyAttendance(branch,date,5);
      					
      				}else if(monthReport != null && monthReport.equals(s3)){
      					 indivisualDetail= DataRetrieve.getEmployeeDailyAttendance(branch,start,end,5);
      				
      			}
      			}

      				
      			
                    	
      			int i=0;
      				for(DailyAttendance indivisualReport : indivisualDetail){
      					
      					System.out.println(indivisualReport.getStatus());
      					i++;
      			%>
                
                 <tr>
                    <td><%=i%></td>
                    <td> <%=indivisualReport.getEmpID() %></td>
                    <td> <%=indivisualReport.getFirstName() %></td>
                    <td> <%=indivisualReport.getLastName() %></td>
                    <td> <%=indivisualReport.getCurrentdate() %></td>
                    <td> <%=indivisualReport.getStatus() %></td>
                    <td> <%=indivisualReport.getIntime() %></td>
                    <td> <%=indivisualReport.getOuttime() %></td>
  			            
                  </tr> 
                  <%} %>
              </table>
              
           </div>
           <button id="btn" name="btn" class="btn btn-primary">Download</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<!-- ./wrapper --> 
<!-- pop-up -->
<div class="modal fade" id="sendemail" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
  <div class="modal-dialog">
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
			<h3 class="modal-title text-center" id="lineModalLabel">Send New E-Mail </h3>
		</div>
		<div class="modal-body">
			
            <!-- content goes here -->
			 <form>
              <div class="row">
                
                <div class="col-md-6 col-sm-6">
                  <div class="form-group">
                    <label for="exampleInputEmail1">Recipient Address :</label>
                     <input type="text" class="form-control" id="recipientadd" placeholder="Recipient Address">
                  </div>
                </div>
                
                <div class="col-md-6 col-sm-6">
                  <div class="form-group">
                    <label for="exampleInputEmail1">Subject :</label>
                    <input type="text" class="form-control" id="subject" placeholder="Subject">
                  </div>
                </div>
                <div class="col-md-12 col-sm-12">
                  <div class="form-group">
                    <label for="content">Content</label>
                    <textarea class="form-control" placeholder="Content " rows="3"></textarea>
                  </div>
                </div>
                <div class="col-md-12 col-sm-12">
                  <div class="form-group">
                    <label for="content">Attach File</label>
                    <input type="file">
                  </div>
                </div>
                <hr>
                <div class="col-md-12 col-sm-12 text-right">
                  <input type="button" value="Send" class="btn btn-primary new-btn">
                  
                </div>
              </div>
            </form>
		</div>
	</div>
  </div>
</div>

<script src="js/jquery.min.js"></script> 
<script src="js/bootstrap.min.js"></script> 
<script src="js/jquery.dataTables.min.js"></script> 
<script src="js/dataTables.bootstrap.min.js"></script> 
<script src="js/jquery.slimscroll.min.js"></script> 
<script src="js/fastclick.js"></script> 
<script src="js/adminlte.min.js"></script> 
<script src="js/demo.js"></script> 
<!-- script to convert data into excel format -->     

<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
   
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.0.js"></script>
<script type="text/javascript">
	$(function(){
	
    $('#btn').click(function(){
   
    	var url='data:application/vnd.ms-excel,' + encodeURIComponent($('#tableWrap').html()) 
        location.href=url
        return false
    })
})
</script>
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
<script>
	$(document).ready(function() {
    $("#country").on("change", function() {
        if ($(this).val() === "I") {
            $("#otherName").show();
        }
        else {
            $("#otherName").hide();
        }
    });
});
</script>

<script>
	$(document).ready(function() {
    $("#country").on("change", function() {
        if ($(this).val() === "B") {
            $("#otherbranch").show();
        }
        else {
            $("#otherbranch").hide();
        }
    });
});
</script>
<script type="text/javascript">
   $(document).ready(function () {
    $('#id_radio1').click(function () {
        $('#div3').hide('fast');
        $('#div1').show('fast');
    });
    $('#id_radio2').click(function () {
        $('#div1').hide('fast');
        $('#div2').show('fast');
    });
	$('#id_radio3').click(function () {
        $('#div2').hide('fast');
        $('#div3').show('fast');
    });
});
</script>
</body>
</html>
