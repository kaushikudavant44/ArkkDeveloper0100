<%@include file="Header.jsp" %>    
<!-- Main content -->
    <section class="content index">
		
			<div class="1middle-bg">
			<div class="row">
				<div class="col-md-12 col-sm-12">
				<div class="add-blk">
				<div class="panel-heading new-bg"><h3> Day Report</h3></div>
				<div class="middle-bg" id="tableWrap">
				<form action="">
              <table id="example2" class="table table-bordered table-hover tbl">
  <tr>
    <th>Sr. No</th>
    <th>Employee ID</th>
    <th>Name</th>
    <th>Branch</th>
    <th>Date</th>
    <th>Direction</th>
    <th>Time</th>
    
  </tr>
  
  <%                
                     DataRetrieve.storeDailyAttendance();
                    
      				List<DailyAttendance> employeeData=new ArrayList<DailyAttendance>();
      				
      				employeeData=DataRetrieve.getEmployeeDetailsOfinandout(); 	
                    int i=0;
                    		
      				for(DailyAttendance empRegistration : employeeData){
      					i++;
      					
      				String time= empRegistration.getTime();
      				String[] parts=time.split(":");
      				int hr=Integer.parseInt(parts[0]);
      				if(hr>12)
      				{
      					hr=hr-12;
      					String hr1=String.valueOf(hr);
      					time=hr1+":"+parts[1]+":"+parts[2];
      				}
      					
      					
      			%>
  <tr>
    <td><%=i%></td>
    <td><%=empRegistration.getEmpID()%></td>
    <td><%=empRegistration.getFirstName()%> <%=empRegistration.getLastName() %></td>
    <td><%=empRegistration.getBranch()%></td>
    <td><%=empRegistration.getCurrentdate()%></td>
    <td><%=empRegistration.getDirection()%></td>
    <td><%=time%></td>
    
    
  </tr>
  <%} %>
 </table>
</form>
		<button id="btn" name="btn" class="btn btn-primary">Download</button> 			
					
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


<script type="text/javascript">

    document.getElementById('empid').onkeydown = function(event) {
	var id=document.getElementById('empid').value;
    if (event.keyCode == 13) {
      
        window.open("all-employee.jsp?id="+id,"_self");
    }
}
</script> 
<script type="text/javascript">

   function changeEmployee() {
	  
    var selectBox = document.getElementById("selectBox");
    var id = selectBox.options[selectBox.selectedIndex].value;
   
    window.open("all-employee.jsp?id="+id + "&type=employee","_self");
   }

  </script>

<script type="text/javascript">

   function changeLabour() {
	  
    var selectBox = document.getElementById("selectBox");
    var id = selectBox.options[selectBox.selectedIndex].value;
    
    window.open("all-employee.jsp?id="+id+ "&type=employee","_self");
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
