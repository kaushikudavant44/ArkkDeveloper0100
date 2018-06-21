<%@include file="Header.jsp" %>               
    <!-- Main content -->
    <section class="content index">
    <div class="1middle-bg">
			<div class="row">
				<div class="col-md-12 col-sm-12">
				<div class="add-blk">
				<div class="panel-heading blue"><h3>ManaulAttendance</h3></div>
				<div class="middle-bg">
					
  						<div class="row">
                                <div class="col-md-4 col-sm-4">
								<div class="form-group">
							<label for="exampleInputEmail1">EmployeeId :</label>
							
							 <input type="text" class="form-control"  name="stu_id" onclick="this.select()" onKeyDown="if(event.keyCode==13)"  id="stu_id">
							                             
							</div>
							</div>
	
	<script type="text/javascript">

    document.getElementById('stu_id').onkeydown = function(event) {
	var id=document.getElementById('stu_id').value;
    if (event.keyCode == 13) {
       
        window.open("ManualLabour.jsp?id="+id,"_self");
    }
}


</script> 

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
