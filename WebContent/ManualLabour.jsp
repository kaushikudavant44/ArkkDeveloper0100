<%@include file="Header.jsp" %>              
    <!-- Main content -->
    <section class="content index">
    
			<div class="1middle-bg">
			<div class="row">
				<div class="col-md-12 col-sm-12">
				<div class="add-blk">
				<div class="panel-heading blue"><h3>Manaul Attendance</h3></div>
				<div class="middle-bg">
					<form action="controller/LabourAttendance.jsp">
  						<div class="row">
                 
	                       <%String empid=request.getParameter("id"); 
									System.out.println("studid:"+empid);
									if(empid!=null)
									{
										
                              List<EmployeeRegistration> employeeData=new ArrayList<EmployeeRegistration>();
              				
                             employeeData=DataRetrieve.getLabourProfile(empid);
                             	
                             System.out.println(employeeData);
                             
                             String date=SMSSending.getDate();
                             String time=SMSSending.getTime();
                             
               				for(EmployeeRegistration studRegistration : employeeData){ 

                             
                             %>
							<div class="col-md-4 col-sm-4">
								<div class="form-group">
							<label for="exampleInputEmail1">Employee Id :</label>
							
							 <input type="text" class="form-control"  name="empID"   id="empID" value="<%=empid %>">
							 
     	    				</div>
							</div>
																				
							<div class="col-md-4 col-sm-4">
								<div class="form-group">
							<label for="exampleInputEmail1">First name :</label>
							<input type="text" class="form-control" id="firstName" name="firstName" value="<%=studRegistration.getFirstName()%>" placeholder="First name">
							</div>
							</div>
							
							<div class="col-md-4 col-sm-4">
								<div class="form-group">
							<label for="exampleInputEmail1">Last name :</label>
							<input type="text" class="form-control" id="lastName" name="lastName"  value="<%=studRegistration.getLastName()%>"  >
							</div>
							</div>
							
							
							<div class="col-md-4 col-sm-4">
								<div class="form-group">
							<label for="exampleInputEmail1">Branch :</label>
							<input type="text" class="form-control" id="branch" name="branch"  value="<%=studRegistration.getBranch()%>" >
							</div>
							</div>
							
							<div class="col-md-4 col-sm-4">
								<div class="form-group">
							<label for="exampleInputEmail1">DeviceId :</label>
							<input type="text" class="form-control" id="deviceid" name="deviceid"  value="<%=studRegistration.getDeviceid()%>" >
							</div>
							</div>
							
							<div class="col-md-4 col-sm-4">
								<div class="form-group">
							<label for="exampleInputEmail1">direction :</label>
							<select class="form-control" id="direction" name="direction">
                              <option value="in">in</option>
                              <option value="out">out</option>
                            </select>
							</div>
							</div>
                            
                            
							
                            <div class="col-md-4 col-sm-4">
								<div class="form-group">
							<label for="exampleInputEmail1">Date</label>
							<input type="text" class="form-control" id="date" name="date"  value="<%=date%>"  placeholder="Date">
							</div>
							</div>
							
							<div class="col-md-4 col-sm-4">
								<div class="form-group">
							<label for="exampleInputEmail1">time</label>
							<input type="text" class="form-control" id="inTime" name="time" value="<%=time%>" placeholder="In_Time">
							</div>
							</div>
							
							<div class="col-md-4 col-sm-4">
								<div class="form-group">
							<label for="exampleInputEmail1">Type</label>
							<input type="text" class="form-control" id="type" name="type" value="<%=studRegistration.getType()%>" placeholder="In_Time">
							</div>
							</div>
							
							
							<div class="col-md-12 col-sm-12">
                            <div class="form-group">
								<input type="submit" value="Save" class="btn btn-primary new-btn">
	                        </div>
							</div> 
							
                     <%}} %>  
                                        
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
