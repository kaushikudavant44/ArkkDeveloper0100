<%@include file="Header.jsp" %>    
<!-- Main content -->
    <section class="content index">
		
			<div class="1middle-bg">
				<div class="row">
				<div class="col-md-4 col-sm-4">
								<div class="form-group">
<% HttpSession S=request.getSession();
S.setAttribute("LABOURPGE","LABOURedit"); %>
							<label for="exampleInputEmail1">Labour Id :</label>
							
							 <input type="text" class="form-control"  name="empid" onclick="this.select()" onKeyDown="if(event.keyCode==13)"  id="empid" placeholder="Labour ID">
							 
                             
							</div>
							</div> 
					
					
				  <div  class="col-md-4 col-sm-4">
						<div class="form-group" >
							<label for="exampleInputEmail1">Site Labours :</label>
							
							 <select class="form-control" id="selectbox" onchange="changeLabour();">
							 <option>--Please Select--</option>
                             <% List<BranchDetails> branchDat=new ArrayList<BranchDetails>();      				
                            branchDat=DataRetrieve.getLabourBranchDetails();
                    			
      				          for(BranchDetails branchDetail : branchDat){%>
							
                              <option><%=branchDetail.getBranchName() %></option>
                              <%} %>
                            </select>
                           
							</div>
					</div>		
					</div>	
			
			<div class="row">
				<div class="col-md-12 col-sm-12">
				<div class="add-blk">
				<div class="panel-heading new-bg"><h3> Show All Labours</h3></div>
				<div class="middle-bg" id="tableWrap">
				<form action="">
              <table id="example2" class="table table-bordered table-hover tbl">
  <tr>
    <th>Sr. No</th>
    <th>Labour ID</th>
    <th>Name</th>
    <th>Site</th>
    <th>Contact No</th>
    <th>type</th>
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
      				
      				if(type==null){
      					employeeData=DataRetrieve.getLabourProfile(empid);
      				}
      				else
      				{
      					employeeData=DataRetrieve.getEmployeeProfile(empid,type); 	
      				}
                    
                    	int i=0;
                    System.out.println(employeeData);		
      				for(EmployeeRegistration empRegistration : employeeData){
      					i++;
  %>
  <tr>
    <td><%=i%></td>
    <td><%=empRegistration.getEmpID()%></td>
    <td><%=empRegistration.getFirstName()%> <%=empRegistration.getLastName() %></td>
    <td><%=empRegistration.getBranch()%></td>
    <td><%=empRegistration.getMobileNumber()%></td>
    <td><%=empRegistration.getTol()%></td>
    <td><%=empRegistration.getSalary()%></td>
    <td class="invert-image"><a href="image/<%=empRegistration.getPicture()%>" download><img src="image/<%=empRegistration.getPicture()%>" height="100" width="100" class="img-responsive" ></a></td>
    
    <td><a href="document/<%=empRegistration.getDocument()%>" ><%=empRegistration.getDocument()%></a></td>
 
    <td><input type="submit" value="delete" onClick="deleteRecord(<%=empRegistration.getEmpID()%>)" ></td>
    <script>
    function deleteRecord(id){
    	
    	window.open("controller/Delete.jsp?id="+id,"_self");

    }</script>
   <td><input type="submit" value="Edit" onClick="editeRecord(<%=empRegistration.getEmpID()%>,'<%=empRegistration.getBranch()%>')" ></td>
   <script>
    function editeRecord(id,branch){
    	
    	window.open("LabourPopup.jsp?id="+id +"&branch="+branch,"_blank");

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
<!-- Script to print tabe -->
<script>
function printData()
{
   var divToPrint=document.getElementById("example2");
   newWin= window.open("");
   newWin.document.write(divToPrint.outerHTML);
   newWin.print();
   newWin.close();
}

</script>

<script type="text/javascript">

    document.getElementById('empid').onkeydown = function(event) {
	var id=document.getElementById('empid').value;
    if (event.keyCode == 13) {

          window.open("all-labour.jsp?id="+id,"_self");
    }
}
</script> 


<script type="text/javascript">

   function changeLabour() {
	  
    var selectbox = document.getElementById("selectbox");
    var id = selectbox.options[selectbox.selectedIndex].value;
        window.open("all-labour.jsp?id="+id+ "&type=Labour","_self");
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
