<%@include file="Header.jsp" %>
<!-- Main content -->
<section class="content index">
  <div class="1middle-bg">
    <div class="row">
      <div class="col-md-6 col-sm-6">
        <div class="add-blk">
          <div class="panel-heading blue">
            <h3>Add Branch</h3>
          </div>
          <form action="controller/Report1.jsp" >
          <div class="middle-bg">
            
              <div class="row">
                <div class="col-md-6 col-sm-6">
                  <div class="form-group">
                    <label for="exampleInputEmail1">Choose Report Type :</label>
                    <select id="country" name="report" class="form-control">
                      <option value="B" id="text">Branchwise Report</option>
                      <option value="I">Individual Report</option>
                    </select>
                  </div>
               </div>
               <div class="col-md-6 col-sm-6">
                  <div class="form-group">
                   <label id="otherName">Enter Your Name
                  <input  type="text" class="form-control" id="choose" value="email" name="name"/> 
                  </label>
                  
                    <label id="otherbranch" for="exampleInputEmail1">Choose Branch
                    <select class="form-control" id="selectBox" name="batch" >
							 <option>--Please Select--</option>
                             <% List<BranchDetails> branchData=new ArrayList<BranchDetails>();      				
                            branchData=DataRetrieve.getBranchDetails();
                    	
                              System.out.println(branchData);		
      				          for(BranchDetails branchDetail : branchData){%>
							
                              <option><%=branchDetail.getBranchName() %></option>
                              <%} %>
                            </select></label>
                  </div>
                </div>
                
                
                <div class="row">
                <div class="col-md-12 col-sm-12">
                <div style="padding:0 15px;">
                  <label class="radio-inline">
                    <input id="id_radio1" type="radio" name="Day" value="Day" />
                    Day Report </label>
                  
                  <label class="radio-inline">
                    <input id="id_radio3" type="radio" name="Range" value="Range" />
                    Date Range Report </label>
                </div>
                <div style="padding:15px;">
                  <div id="div1">
                    <div class="row">
                      <div class="col-md-6 col-sm-6">
                        <div class="form-group">
                          <label for="exampleInputEmail1">Choose date :</label>
                          <input type="text" class="form-control" id="exampleInputEmail1" name="date" placeholder="Choose date...">
                        </div>
                       
                      </div>
                    </div>
                  </div>
                  
                  <div id="div3" style="display:none;">
                    <div class="row">
                      <div class="col-md-6 col-sm-6">
                        <div class="form-group">
                          <label for="exampleInputEmail1">Start date :</label>
                          <input type="text" class="form-control" name="Startdate" id="exampleInputEmail1" placeholder="">
                        </div>
                      </div>
                      <div class="col-md-6 col-sm-6">
                        <div class="form-group">
                          <label for="exampleInputEmail1">End date :</label>
                          <input type="text" class="form-control" name="Enddate" id="exampleInputEmail1" placeholder="">
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
            <h3>Report</h3>
          </div>
          <div class="middle-bg" id="tableWrap">
          
            <div class="table-responsive">
              <table id="example2" class="table table-bordered table-hover tbl">
              <tbody>
                 <tr>
                  <th>Sr. No</th>
                  <th>ID</th>
                  <th>Name</th>
                  
                  <th>Branch</th>
                  <th>Date</th>
                  <th>Direction</th>
                  <th>Time</th>
                  
                </tr> 
      			<%
      			
      			List<DailyAttendance> indivisualDetail=new ArrayList<DailyAttendance>();
      			HttpSession s=request.getSession(false);
      			String reporttype=(String)session.getAttribute("reporttype");
      			String branch=(String)session.getAttribute("branch");
      			String dayreport=(String)session.getAttribute("dayreport");
      			String monthReport=(String)session.getAttribute("monthReport");
      			String id=(String)session.getAttribute("name");
      			String date=(String)session.getAttribute("date");
      			String start=(String)session.getAttribute("start");
      			String end=(String)session.getAttribute("end");
      			System.out.println(branch);
      			System.out.println(dayreport);
      			System.out.println(reporttype);
      			System.out.println(date);
      			System.out.println(id);

      			String s1="I";
      			String s2="Day";
      			String s3="month";
      			String s4="B";
      			String s5="null";
      			if( reporttype != null && reporttype.equals(s1))
      			{System.out.println("ddddd");
      					if(dayreport != null && dayreport.equals(s2)){
      						
      						indivisualDetail=DataRetrieve.getEmployeeDailyAttendance(id,date);;
      					
      				}else if(monthReport != null && monthReport.equals(s3)){
      					
      					indivisualDetail=DataRetrieve.getEmployeeDailyAttendance(id,start,end);
      				}
      			}	
      			
      		 else if(reporttype != null && reporttype.equals(s4))
      			{
      				if(dayreport != null && dayreport.equals(s2)){
      					System.out.println("dfghjk");
      					indivisualDetail=DataRetrieve.getEmployeeDailyAttendance(branch,date,5);
      					
      				}else if(monthReport != null && monthReport.equals(s3)){
      					 indivisualDetail= DataRetrieve.getEmployeeDailyAttendance(branch,start,end,5);
      				
      			}
      			}
	
      			    int i=0;
      				for(DailyAttendance indivisualReport : indivisualDetail){
      				System.out.println(indivisualReport.getStatus());
      				i++;
      			%>
                
                 <tr>
                    <td><%=i%></td>
                    <td> <%=indivisualReport.getEmpID()%></td>
                    <td> <%=indivisualReport.getFirstName()%><%=indivisualReport.getLastName()%></td>
                    <td> <%=indivisualReport.getBranch()%></td>
                    <td> <%=indivisualReport.getCurrentdate()%></td>
                    <td> <%=indivisualReport.getDirection()%></td>
                    <td> <%=indivisualReport.getTime()%></td>
                 </tr> 
                  <%} %>
              </table>
              
           </div>
           <button id="btn" name="btn" class="btn btn-primary">Download</button>
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
        $('#div2').hide('fast');
        $('#div3').show('fast');
    });
});
</script>
</body>
</html>





