<%@include file="Header.jsp" %>
<!-- Main content -->
   <section class="content index">
		
			<div class="1middle-bg">
			    <label for="exampleInputEmail1">Indivisual Employee Salary :</label>
			    <div class="row">
			    <div class="col-md-4 col-sm-4">
					<div class="form-group">
					<input type="text" class="form-control"  name="stu_id"   id="stu_id" placeholder="enter ID">
					</div>
				</div> 
					<div class="col-md-4 col-sm-4">
						<div class="form-group" >
							<!-- <label for="exampleInputEmail1">Branch :</label> -->
							
							 <select class="form-control" id="selectBoxx" onchange="changeIndEmployee()">
							 <option>--Please Select Branch--</option>
                             <% List<BranchDetails> batchData=new ArrayList<BranchDetails>();      				
                            batchData=DataRetrieve.getLabourBranchDetails();
                    	
                              System.out.println(batchData);		
      				          for(BranchDetails batchDetail : batchData){%>
							
                              <option><%=batchDetail.getBranchName() %></option>
                              <%} %>
                            </select>
                           
						</div>
					</div>	
                </div>
                
                <div class="row">
			    
				
					<div class="col-md-4 col-sm-4">
						<div class="form-group" >
							<label for="exampleInputEmail1">Branch Salary :</label> 
							
							 <select class="form-control" id="selectBox" onchange="changeEmployee()">
							 <option>--Please Select Branch--</option>
                             <% List<BranchDetails> batchDataa=new ArrayList<BranchDetails>();      				
                            batchDataa=DataRetrieve.getLabourBranchDetails();
                    	
                              System.out.println(batchData);		
      				          for(BranchDetails batchDetail : batchDataa){%>
							
                              <option><%=batchDetail.getBranchName() %></option>
                              <%} %>
                            </select>
                           
						</div>
					</div>	
                </div>
  

  <script type="text/javascript">

   function changeEmployee() {
	  
    var selectBox = document.getElementById("selectBox");
    var branch = selectBox.options[selectBox.selectedIndex].value;
   
    window.open("LabourAutoSalary.jsp?branch="+branch+ "&type=B","_self");
   }

  </script>
  
  <script type="text/javascript">

   function changeIndEmployee() {
	var indid=document.getElementById('stu_id').value; 
    var selectBoxx = document.getElementById("selectBoxx");
    var branch = selectBoxx.options[selectBoxx.selectedIndex].value;
    var id=indid+" "+branch;
 
    window.open("LabourAutoSalary.jsp?id="+id+ "&type=I","_self");
   }

  </script>
							
							
			<div class="row">
			
				<div class="col-md-12 col-sm-12">
				<div class="add-blk">
				<div class="panel-heading new-bg"><h3>Labour Salary Details</h3></div>
				<div class="middle-bg" id="tableWrap">
				<form action="">
                           <table id="example2" class="table table-bordered table-hover tbl">
              <tbody>
                 <tr>
                  <th>Sr. No</th>
                  <th>emp_Id</th>
                  <th>Name</th>
                  <th>Branch</th>
                  <th>From</th>
                  <th>End</th>
                  <th>Salary</th>
                  
                </tr> 
      			<%
      			DataRetrieve.storeDailyAttendance();
      			List<EmployeeRegistration> list = new ArrayList<EmployeeRegistration>();
      			HttpSession s=request.getSession(false);
      			
                String salreporttype=request.getParameter("type");
                String emp_id=request.getParameter("id");
      			String branchsal=request.getParameter("branch");
      			String id=null;
      			String branch=null;
      			if(emp_id!=null)
      			{
      			 String[] branchandid=emp_id.split(" "); 
      			 id=branchandid[0];
      			 branch=branchandid[1];
      			}
      			
      			System.out.println("type"+salreporttype);
      			System.out.println("emp_id"+emp_id);
      			
      			String s1="I";
       			String s4="B";
      			String weeekdate=SMSSending.getWeekDate();
      			String[] part=weeekdate.split(" ");
      			String salstart=part[0];
      			String salend=part[1];
      			System.out.println("salstart"+salstart);
      			if( salreporttype != null && salreporttype.equals(s1))
      			{System.out.println("ddddd");
      					
      			list=DataRetrieve.indivisualLabourSalary(id,salstart,salend,branch);
      				 
      			}	
      			
      		  else if(salreporttype != null && salreporttype.equals(s4))
      			{
      			list= DataRetrieve.branchLabourSalary(branchsal,salstart,salend);
      			
      			}

      			for(EmployeeRegistration indivisualsalary : list){
      			
      					int i=0;
      						  
      			%>
                
                 <tr>
                   <td><%=i+1%></td>
                   <td> <%=indivisualsalary.getEmpID() %></td>
                   <td> <%=indivisualsalary.getFirstName() %>  <%=indivisualsalary.getLastName() %></td>
                   <td> <%=indivisualsalary.getBranch() %></td>
                   <td><%=salstart%></td>
                   <td><%=salend %>
                   <td> <%=indivisualsalary.getSalary() %></td>
                </tr> 
                  <%} %> 
              </table> <button id="btn" name="btn" class="btn btn-primary">Download</button>
              <input type="button" value="Print Me" class="btn btn-primary" onclick="printData()"> 
              
             </form>
		
		  </div>
	    </div>
	  </div>
    </div>
  </div>
</section>
	
			
       
         
<!-- ./wrapper -->

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
