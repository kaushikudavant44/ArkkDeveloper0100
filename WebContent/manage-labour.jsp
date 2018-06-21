<%@include file="Header.jsp" %>
    <!-- Main content -->
    <section class="content index">
		
			<div class="1middle-bg">
			<div class="row">
				<div class="col-md-12 col-sm-12">
				<div class="add-blk">
				<div class="panel-heading blue"><h3>Add Labour</h3></div>
				<form action="UploadServlet" method="Post" enctype="multipart/form-data">
<% HttpSession S=request.getSession();
S.setAttribute("LABOURPGE","LABOUR"); %>
<table style='width:500px;  margin:auto'>
<tr>
<td> Select Photo  </td>
<td><input type="file" name="file" size="50" /></td>
<td colspan="2" align="center">
<input type="submit" value="Upload File" />
</td>
</tr>
</table>
</form>
<form action="UploadDocument" method="Post" enctype="multipart/form-data">

<table style='width:500px;  margin:auto'>
<tr>
<td> Select Photo  </td>
<td><input type="file" name="file" size="50" /></td>
<td colspan="2" align="center">
<input type="submit" value="Upload File" />
</td>
</tr>
</table>
</form>
				<div class="middle-bg">
					<form action="controller/LabourDataSave.jsp">
						<div class="row">
                        
                          <div class="col-md-4 col-sm-4">
								<div class="form-group">
							<label for="exampleInputEmail1">Type :</label>
			  <input type="text" class="form-control" id="type" name="type" value="Labour" style='text-transform:uppercase'>
							
							</div>
							</div>
                        
                            <div class="col-md-4 col-sm-4">
								<div class="form-group">
							<label for="exampleInputEmail1">Initial :</label>
							<select class="form-control" id="initial" name="initial">
                              <option>Ms</option>
                              <option>Mr</option>
                            </select>
							</div>
							</div>
													
							<div class="col-md-4 col-sm-4">
								<div class="form-group">
							<label for="exampleInputEmail1">First name :</label>
							<input type="text" class="form-control" id="firstName" name="firstName" placeholder="First name" style='text-transform:uppercase'>
							</div>
							</div>
							
							<div class="col-md-4 col-sm-4">
								<div class="form-group">
							<label for="exampleInputEmail1">Last name :</label>
							<input type="text" class="form-control" id="lastName" name="lastName" placeholder="Last name" style='text-transform:uppercase'>
							</div>
							</div>
							
							<div class="col-md-4 col-sm-4">
								<div class="form-group">
							<label for="exampleInputEmail1">Country code :</label>
							<select class="form-control" id="countryCode" name="countryCode">
                              <option>IND(91)</option>
                              <option>AF(93)</option>
                            </select>
							</div>
							</div>
							
							<div class="col-md-4 col-sm-4">
							<div class="form-group">
							<label for="exampleInputEmail1">Mobile number :</label>
							<input type="text" class="form-control" id="mobileNumber" name="mobileNumber" placeholder="Mobile number">
							</div>
							</div>
							
							<div class="col-md-4 col-sm-4">
								<div class="form-group">
							<label for="exampleInputEmail1">Gender :</label>
							<select class="form-control" id="gender" name="gender">
                              <option>Male</option>
                              <option>Female</option>
                            </select>
							</div>
							</div>
							
							
                            
                            <div class="col-md-4 col-sm-4">
							<div class="form-group">
							<label for="exampleInputEmail1">Type of Labour</label>
							<input type="text" class="form-control" id="tol" name="tol" placeholder="Type of Labour">
							</div>
							</div>
							
							                          
                            <div class="col-md-4 col-sm-4">
					    	<div class="form-group">
							<label for="exampleInputEmail1">Labour Id</label>
							<input type="text" class="form-control" id="empID" name="empID" placeholder="Employee Id">
							</div>
							</div>
							
							<div class="col-md-4 col-sm-4">
								<div class="form-group">
							<label for="exampleInputEmail1">Site :</label>
							
							 <select class="form-control" id="branch" name="branch">
                             <% List<BranchDetails> branchData=new ArrayList<BranchDetails>();      				
                            branchData=DataRetrieve.getLabourBranchDetails();
                    	
                              System.out.println(branchData);		
      				          for(BranchDetails branchDetail : branchData){%>
							
                              <option><%=branchDetail.getBranchName() %></option>
                              <%} %>
                            </select>
							</div>
							</div>
							<div class="col-md-4 col-sm-4">
								<div class="form-group">
							<label for="exampleInputEmail1">Device Id</label>
							<select class="form-control" id="deviceid" name="deviceid">
                              <option>101</option>
                              <option>102</option>
                              <option>103</option>
							</div>
							</div>
							
							<div class="col-md-4 col-sm-4">
								<div class="form-group">
							<label for="exampleInputEmail1">Salary :</label>
							<input type="text" class="form-control" id="salary" name="salary" placeholder="Salary">
							</div>
							</div>
							
							<div class="col-md-4 col-sm-4">
								<div class="form-group">
							<label for="exampleInputEmail1">Address:</label>
							<textarea rows="3" type="text" class="form-control" id="address" name="address" placeholder="Salary"> </textarea>
							</div>
							</div>
							
							
<% 
							   String filename=(String)S.getAttribute("filename");
							   String documentname=(String)S.getAttribute("documentname");
							%>
							<input type="hidden" class="form-control" id="picture" name="picture" value="<%=filename%>"> 
							
							
							<input type="hidden" class="form-control" id="document" name="document" value="<%=documentname%>"> 
							
							
							
							

							
							
							<div class="col-md-12 col-sm-12">
                            <div class="form-group">
								<input type="submit" value="Save" class="btn btn-primary new-btn">
								
                                </div>
							</div>
							<script>
							function clearText()
							{
								document.getElementId('text1').value="";
								document.getElementById(text2).value="";
								document.getElementById(initial).value="";
								document.getElementById(firstName).value="";
								document.getElementById(lastName).value="";
								document.getElementById(countryCode).value="";
								document.getElementById(mobileNumbder).value="";
								document.getElementById(grender).value="";
								document.getElementById(email).value="";
								document.getElementById(qualification).value="";
								document.getElementById(designation).value="";
								document.getElementById(empId).value="";
								document.getElementById(branch).value="";
								document.getElementById(salary).value="";
								document.getElementById(email).value="";
								
							}
							
							</script>
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
