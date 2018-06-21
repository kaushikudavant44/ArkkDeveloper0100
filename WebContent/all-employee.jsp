
<%@include file="Header.jsp" %>    
<!-- Main content -->
    <section class="content index">
		<% HttpSession S=request.getSession();
S.setAttribute("LABOURPGE","Employeeedit"); %>
			<div class="1middle-bg">
				<div class="row">
				<div class="col-md-4 col-sm-4">
								<div class="form-group">
							<label for="exampleInputEmail1">Employee Id :</label>
							
							 <input type="text" class="form-control"  name="empid" onclick="this.select()" onKeyDown="if(event.keyCode==13)"  id="empid" placeholder="employee or labour ID">
							 
                             
							</div>
							</div> 
					<div class="col-md-4 col-sm-4">
						<div class="form-group" >
							<label for="exampleInputEmail1">Branch Employees :</label>
							
							 <select class="form-control" id="selectBox" onchange="changeEmployee();">
							 <option>--Please Select--</option>
                             <% List<BranchDetails> branchData=new ArrayList<BranchDetails>();      				
                            branchData=DataRetrieve.getBranchDetails();
                    			
      				          for(BranchDetails branchDetail : branchData){%>
							
                              <option><%=branchDetail.getBranchName() %></option>
                              <%} %>
                            </select>
                           
							</div>
					</div>	
					
					</div>	
			
			<div class="row">
				<div class="col-md-12 col-sm-12">
				<div class="add-blk">
				<div class="panel-heading new-bg"><h3> Show All Employees</h3></div>
				<div class="middle-bg" id="tableWrap">
				<form action="">
              <table id="example2" class="table table-bordered table-hover tbl">
  <tr>
    <th>Sr. No</th>
    <th>Employee ID</th>
    <th>Name</th>
    <th>Firm</th>
    <th>Contact No</th>
    <th>Designation</th>
    <th>Salary</th>
    <th>Photo</th>
    <th>Document</th>
    <th>Delete</th>
    <th>Edit</th>
  </tr>
  
  <%                

                      String empid=request.getParameter("id"); 
                      String type=request.getParameter("type"); 
                      System.out.println("type:"+type);
      				List<EmployeeRegistration> employeeData=new ArrayList<EmployeeRegistration>();
      				System.out.println("type:"+type);
      				if(type==null){
      					System.out.println("came:"+type);
      					employeeData=DataRetrieve.getEmployeeProfile(empid);
      				}
      				else
      				{
      					employeeData=DataRetrieve.getEmployeeProfile(empid,type); 	
      				}
                    
                    	int i=0;
                    System.out.println(employeeData);		
      				for(EmployeeRegistration empRegistration : employeeData){
      					i++;
      					
      					String image="image/"+empRegistration.getPicture();
      					System.out.println("image:"+image);
  %>
  <tr>
    <td><%=i%></td>
    <td><%=empRegistration.getEmpID()%></td>
    <td><%=empRegistration.getFirstName()%> <%=empRegistration.getLastName() %></td>
    <td><%=empRegistration.getBranch()%></td>
    <td><%=empRegistration.getMobileNumber()%></td>
    <td><%=empRegistration.getDesignation()%></td>
    <td><%=empRegistration.getSalary()%></td>
    
    <td class="invert-image"><a href="image/<%=empRegistration.getPicture()%>" download><img src="image/<%=empRegistration.getPicture()%>" height="100" width="100" class="img-responsive" ></a></td>
    
    <td><a href="document/<%=empRegistration.getDocument()%>" ><%=empRegistration.getDocument()%></a></td>
 
 
  <td><input type="submit" value="delete" onClick="deleteRecord(<%=empRegistration.getEmpID()%>,'<%=empRegistration.getBranch()%>')" ></td>
    <script>
    function deleteRecord(id,branch){
    	alert(branch);
    	window.open("controller/Delete.jsp?id="+id +"&branch="+branch,"_blank");

    }</script>
    <td><input type="submit" value="Edit" onClick="editeRecord(<%=empRegistration.getEmpID()%>,'<%=empRegistration.getBranch()%>')" ></td>
   <script>
    function editeRecord(id,branch){
    	
    	window.open("popup.jsp?id="+id +"&branch="+branch,"_blank");

    }</script>
  </tr>
  <%} %>
 </table>
</form>
		<button id="btn" name="btn" class="btn btn-primary">Download</button> 			
	    <input type="button" value="Print Me" class="btn btn-primary" onclick="printData()"> 			
				</div>
			</div>
		</div>
	</div>
</div>
</section>
       
<!-- ./wrapper -->
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

<!-- Script to print table -->
<script>
function printData()
{
   var divToPrint=document.getElementById("example2");
   newWin= window.open("");
   newWin.document.write(divToPrint.outerHTML);
   newWin.print();
   newWin.close();
}

/* $('button').on('click',function(){
printData();
}) */
</script>

<script type="text/javascript">

    document.getElementById('empid').onkeydown = function(event) {
	var id=document.getElementById('empid').value;
    if (event.keyCode == 13) {
          alert(id);
          window.open("all-employee.jsp?id="+id,"_self");
    }
}
</script> 
<script type="text/javascript">

   function changeEmployee() {
	  
    var selectBox = document.getElementById("selectBox");
    var id = selectBox.options[selectBox.selectedIndex].value;
   
       window.open("all-employee.jsp?id="+id + "&type=Employee","_self");
   }

  </script>

<script type="text/javascript">

   function changeLabour() {
	  
    var selectbox = document.getElementById("selectbox");
    var id = selectbox.options[selectbox.selectedIndex].value;
        window.open("all-employee.jsp?id="+id+ "&type=Labour","_self");
   }

  </script>



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
