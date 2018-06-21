<%@include file="Header.jsp" %>

<!-- Main content -->
<section class="content index">
  <div class="1middle-bg">
    <div class="row">
      <div class="col-md-6 col-sm-6">
        <div class="add-blk">
          <div class="panel-heading blue">
            <h3>Report</h3>
          </div>
          <form action="controller/Report2.jsp" >
          <div class="middle-bg">
            
              <div class="row">
                <div class="col-md-4 col-sm-4">
                  <div class="form-group">
                    <label for="exampleInputEmail1">Report Type :</label>
                    <select id="country" name="report" class="form-control">
                      <option value="B" id="text">Sitewise Report</option>
                      <option value="I">Indivisual Report </option>
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
                    <input id="id_radio3" type="radio" name="Day" value="Range" />
                    Date Range Report </label>
                </div>
                <div style="padding:15px;">
                  <div id="div1">
                    <div class="row">
                      <div class="col-md-6 col-sm-6">
                        <div class="form-group">
                          <label for="exampleInputEmail1">Choose date :</label>
                          <input type="text" class="form-control" id="datepicker" name="date" placeholder="Choose date...">
                        </div>
                        <div class="checkbox">
                          <label>
                            <input type="checkbox" value="">
                            Include Intermediate time in download report </label>
                        </div>
                      </div>
                    </div> 
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
             
                
                <div style="margin:30;">
                  <input type="submit" value="Run" >
                </div> 
                
              
              </div>
           </div>
           </form>
        </div>
      </div>
      <div class="col-md-6 col-sm-6">
        <div class="add-blk">
          <div class="panel-heading blue">
            <h3>Labour Report</h3>
          </div>
          <div class="middle-bg" id="tableWrap">
          
            <div class="table-responsive">
              <table id="example2" class="table table-bordered table-hover tbl">
              <tbody>
                 <tr>
                  <th>Sr. No</th>
                  <th>ID</th>
                  <th>Name</th>
                  <th>Site</th>
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
      			/* String monthReport=(String)session.getAttribute("monthReport"); */
      			String id=(String)session.getAttribute("name");
      			String date=(String)session.getAttribute("date");
      			String start=(String)session.getAttribute("start");
      			String end=(String)session.getAttribute("end");
      			
      			String s1="I";
      			String s2="Day";
      			String s3="Range";
      			String s4="B";
      			String s5="null";
      			if( reporttype != null && reporttype.equals(s1))
      			{System.out.println("ddddd");
      					if(dayreport != null && dayreport.equals(s2)){
      						
      						indivisualDetail=DataRetrieve.getLabourDailyAttendance(id,date);
      					
      				}/* else if(monthReport != null && monthReport.equals(s3)) */
      					else if(dayreport != null && dayreport.equals(s3))
      				
      				{
      					
      					indivisualDetail=DataRetrieve.getLabourDailyAttendance(id,start,end);
      				}
      			}	
      			
      		 else if(reporttype != null && reporttype.equals(s4))
      			{
      				if(dayreport != null && dayreport.equals(s2)){
      					System.out.println("dfghjk");
      					indivisualDetail=DataRetrieve.getLabourDailyAttendance(branch,date,5);
      					
      				}/* else if(monthReport != null && monthReport.equals(s3)) */
      					else if(dayreport != null && dayreport.equals(s3))
      				
      				{
      					 indivisualDetail= DataRetrieve.getLabourDailyAttendance(branch,start,end,5);
      				
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


<!-- <!-- DatePicker Scripts-->

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
 