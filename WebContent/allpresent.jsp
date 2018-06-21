<%@include file="Header.jsp" %>               
    <!-- Main content -->
    <section class="content index">
  <div class="1middle-bg">
      <div class="massege-block">
        <div class="add-blk">
          <div class="middle-bg">
          <div class="alert alert-success fade in">
        <a href="#" class="close" data-dismiss="alert">&times;</a>
        <strong></strong>Do You Want To Proceed.........?.
  </div>
           
       	  <a href="controller/allpresentcontroller.jsp"><button class="btn btn-danger" value="Ok">OK</button></div>
        </div>
      </div>
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
