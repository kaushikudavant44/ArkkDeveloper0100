<%@page import="com.bionische.bean.BranchDetails"%>
<%@page import="com.bionische.bean.EmployeeRegistration"%>
<%@page import="com.bionische.database.DataRetrieve"%>
<%@ page import="com.bionische.database.DataSave"%>
<%@ page import="java.io.*,java.util.*,java.sql.*" %> 
 

<jsp:useBean id="obj" class="com.bionische.bean.BranchDetails"/>
<jsp:setProperty property="*" name="obj"/>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Arc Builder Dashboard</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  
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
<body class="black-bg">
<div class="wrapper">
<%-- <% String id=request.getParameter("idd");
System.out.println("pop"+id); %> --%>


<%
HttpSession sess = request.getSession(); 

String batchname=request.getParameter("id");
 
sess.setAttribute("batchname", batchname);

%>
   
<!-- Main content -->
<section class="content index edit-modal">
  <div class="1middle-bg">
    <div class="row">
      <div class="col-md-12 col-sm-12">
        <div class="add-blk">
          <div class="panel-heading blue">
            <h3>Edit Branch</h3>
          </div>
          <div class="middle-bg">
            <form action="controller/branchedit.jsp">
                           <% List<BranchDetails> batchData=new ArrayList<BranchDetails>();
             				
                           batchData=DataRetrieve.getBranchDetails(batchname);
                       	
             				for(BranchDetails batchDetail : batchData){%>
						
                
                <div class="col-md-12 col-sm-12">
                  <div class="form-group">
                    <label for="exampleInputEmail1">Address :</label>
                    <input type="text" class="form-control" id="batchTeacher" name="address" value="<%=batchDetail.getAddress()%>" placeholder="BatchTeacher">
                  </div>
                </div>
                <div class="col-md-12 col-sm-12">
                  <div class="form-group">
                    <label for="exampleInputEmail1">Contact_No</label>
                  <input type="text" class="form-control" id="contactNumber" name="contactNumber" value="<%=batchDetail.getContactNumber()%>" placeholder="Contact_No">
                    
                  </div>
                </div>
                <%} %>
                
                <div class="col-md-12 col-sm-12">
                  <input type="submit" value="Save" class="btn btn-primary new-btn">
                </div>
			    </div>
				</form>

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
  
  
  
  
  
  
  
  
  
  
  
  
  
 