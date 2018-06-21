<%@include file="Header.jsp" %>
<%-- <% 
   HttpSession sess=request.getSession(); 
   String userId = (String)sess.getAttribute("logInID");
   if(userId == null) {
      response.sendRedirect("Login.jsp");
   }
%> --%>
<!-- Main content -->
<section class="content index">
  <div class="1middle-bg">
    <div class="row">
      <div class="col-md-6 col-sm-6">
        <div class="add-blk">
          <div class="panel-heading blue">
            <h3>Labour Salary</h3>
          </div>
          <form action="controller/LabourSalaryController.jsp" >
          <div class="middle-bg">
            
              <div class="row">
                <div class="col-md-4 col-sm-4">
                  <div class="form-group">
                    <label for="exampleInputEmail1">Report Type :</label>
                    <select id="country" name="report" class="form-control">
                      <option value="B" id="text">Sitewise Salary</option>
                      <option value="I">Individual Indivisual Salary</option>
                    </select>
                  </div>
                </div>
                <div class="col-md-4 col-sm-4">
                  <div class="form-group">
                   <label id="otherName">Enter Your Id
                  <input  type="text" class="form-control" id="choose" placeholder="ID" name="name"/> 
                  </label>
                  
                    <label id="otherbranch" for="exampleInputEmail1">Choose Site
                    <select class="form-control" id="selectBox" name="batch" >
							 <option>--Please Select--</option>
                             <% List<BranchDetails> branchData=new ArrayList<BranchDetails>();      				
                            branchData=DataRetrieve.getLabourBranchDetails();
                    	
                              System.out.println(branchData);		
      				          for(BranchDetails branchDetail : branchData){%>
							
                              <option><%=branchDetail.getBranchName() %></option>
                              <%} %>
                            </select></label>
                  </div>
                </div>
                <div class="col-md-4 col-sm-4">
						<div class="form-group" >
							<label for="exampleInputEmail1">Labour Site :</label> 
							
							 <select class="form-control" id="indbranch" name="indbranch">
							 <option>--Please Select Branch--</option>
                             <% List<BranchDetails> batchDataa=new ArrayList<BranchDetails>();      				
                            batchDataa=DataRetrieve.getLabourBranchDetails();
                    			
      				          for(BranchDetails batchDetail : batchDataa){%>
							
                              <option><%=batchDetail.getBranchName() %></option>
                              <%} %>
                            </select>
                           
						</div>
					</div>	
                
                <div class="row">
                <div class="col-md-12 col-sm-12">
                <div style="padding:0 15px;">
                  <!-- <label class="radio-inline">
                    <input id="id_radio1" type="radio" name="Day" value="Day" />
                    Day Salary</label> -->
                  
                  <label class="radio-inline">
                    <input id="id_radio3" type="radio" name="between" value="Range" />
                    Date Range Report </label>
                </div>
                <div style="padding:15px;">
                  <div id="div1">
                    <!-- <div class="row">
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
                    </div> -->
                  </div>
                  <div id="div2" style="display:none;">
                   
                  </div>
                  <div id="div3" style="display:none;">
                    <div class="row">
                      <div class="col-md-6 col-sm-6">
                        <div class="form-group">
                          <label for="exampleInputEmail1">Start date :</label>
                          <input type="text" class="form-control" name="Startdate" id="datepicker1" placeholder="">
                        </div>
                      </div>
                      <div class="col-md-6 col-sm-6">
                        <div class="form-group">
                          <label for="exampleInputEmail1">End date :</label>
                          <input type="text" class="form-control" name="Enddate" id="datepicker2" placeholder="">
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
            <h3>Labour Salary Details</h3>
          </div>
          <div class="middle-bg" id="tableWrap">
          
            <div class="table-responsive">
              <table id="example2" class="table table-bordered table-hover tbl">
              <tbody>
                 <tr>
                  <th>Sr. No</th>
                  <th>emp_Id</th>
                  <th>FirstName</th>
                  <th>LastName</th>
                  <th>Branch</th>
                  <th>From</th>
                  <th>End</th>
                  <th>Salary</th>
                  
                  
                </tr> 
      			<%
      			
      			List<EmployeeRegistration> list = new ArrayList<EmployeeRegistration>();
      			HttpSession s=request.getSession(false);
      			String salreporttype=(String)session.getAttribute("salreporttype");
      			String salbranch=(String)session.getAttribute("salbranch");
      			String labind=(String)session.getAttribute("labind");
      			/* String daysalary=(String)session.getAttribute("daysalary"); */
      			String monthsalary=(String)session.getAttribute("monthsalary");
      			String emp_id=(String)session.getAttribute("emp_id");
      			/* String saldate=(String)session.getAttribute("saldate"); */
      			String salstart=(String)session.getAttribute("salstart");
      			String salend=(String)session.getAttribute("salend");
      			System.out.println(salreporttype);
      			System.out.println(salbranch); 
      			/* System.out.println(daysalary); */
      			System.out.println(monthsalary);
      			System.out.println(emp_id);

      			String s1="I";
      			/* String s2="Day"; */
      			String s3="between";
      			String s4="B";
      			String s5="null";
      			if( salreporttype != null && salreporttype.equals(s1))
      			{System.out.println("ddddd");
      					
      					list=DataRetrieve.indivisualLabourSalary(emp_id,salstart,salend,labind);
      				 
      			}	
      			
      		  else if(salreporttype != null && salreporttype.equals(s4))
      			{        
      			  
      			System.out.println("yyyyyyyy");
      					 list= DataRetrieve.branchLabourSalary(salbranch,salstart,salend);
      			
      			}

      			for(EmployeeRegistration indivisualsalary : list){
      			
      					int i=0;
      						  
      			%>
                
                 <tr>
                   <td> <%=i+1%></td>
                   <td> <%=indivisualsalary.getEmpID() %></td>
                   <td> <%=indivisualsalary.getFirstName() %></td>
                   <td> <%=indivisualsalary.getLastName() %></td>
                   <td> <%=indivisualsalary.getBranch() %></td>
                   <td> <%=salstart%></td>
                   <td> <%=salend %>
                   <td> <%=indivisualsalary.getSalary() %></td>
                </tr> 
                  <%} %> 
              </table>
              
               <button id="btn" name="btn" class="btn btn-primary">Download</button>
               <input type="button" value="Print Me" class="btn btn-primary" onclick="printData()"> 
               
              
            </div>
           
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<!-- ./wrapper --> 

   <script src="https://code.jquery.com/jquery-1.12.4.js"></script> 
 <script src="js/jquery.min.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#datepicker" ).datepicker({dateFormat: 'yy-mm-dd'});   
  });
  </script>
  <script>
  $( function() {
    $( "#datepicker1" ).datepicker({dateFormat: 'yy-mm-dd'});   
  });
  </script>
  <script>
  $( function() {
    $( "#datepicker2" ).datepicker({dateFormat: 'yy-mm-dd'});   
  });
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
 
        
    
    
    

<script src="js/bootstrap.min.js"></script>  
<script src="js/jquery.dataTables.min.js"></script> 
<script src="js/dataTables.bootstrap.min.js"></script> 
<script src="js/fastclick.js"></script> 
<script src="js/jquery.slimscroll.min.js"></script> 
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
        $('#div1').hide('fast');
        $('#div3').show('fast');
    });
});
</script>

<script type="text/javascript">
	$(function(){
	
    $('#btn').click(function(){
   
    	var url='data:application/vnd.ms-excel,' + encodeURIComponent($('#tableWrap').html()) 
        location.href=url
        return false
    })
})
</script>
</body>
</html> 
 