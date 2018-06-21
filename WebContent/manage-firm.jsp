<%@include file="Header.jsp" %>
<!-- Main content -->
<section class="content index">
  <div class="1middle-bg">
    <div class="row">
      <div class="col-md-6 col-sm-6">
        <div class="add-blk">
          <div class="panel-heading blue">
            <h3>Add Firm</h3>
          </div>
          <div class="middle-bg">
      	<!-- Here Data is handle controller and saving in database -->
            <form action="controller/BranchDataSave.jsp">
              <div class="row">
                <div class="col-md-6 col-sm-6">
                <input type="hidden" class="form-control" id="branchtype" name="branchtype" value="firm">
                  <div class="form-group">
                    <label for="exampleInputEmail1">Firm Name :</label>
                    <input type="text" class="form-control" id="branchName" name="branchName" placeholder="Type Branch name...">
                  </div>
                </div>
                <div class="col-md-6 col-sm-6">
                  <div class="form-group">
                    <label for="exampleInputEmail1">Date :</label>
                    <input type="text" class="form-control" id="date" name="date" placeholder="Date...">
                  </div>
                </div>
                <div class="col-md-6 col-sm-6">
                  <div class="form-group">
                    <label for="exampleInputEmail1">City :</label>
                     <input type="text" class="form-control" id="city" name="city" placeholder="City">
                  </div>
                </div>
                <div class="col-md-6 col-sm-6">
                  <div class="form-group">
                    <label for="exampleInputEmail1">State :</label>
                    <select class="form-control" id="state" name="state">
                      
 
                      <option> Andra Pradesh</option>
                        <option>Arunachal Pradesh</option>
                         <option>Assam</option>
                           <option>Bihar</option>

 <option>Chhattisgarh</option>
 <option>Goa</option>
 <option>Gujarat</option>
 <option>Haryana</option>
 <option>Himachal Pradesh</option>
 <option>Jammu and Kashmir</option>
 <option>Jharkhand</option>
 <option>Karnataka</option>
 <option>Kerala</option>
 <option>Madya Pradesh</option>
 <option>Maharashtra</option>
 <option>Manipur</option>
 <option>Meghalaya</option>
 <option>Mizoram</option>
 <option>Nagaland</option>
 <option>Orissa</option>
 <option>Punjab</option>
 <option>Rajasthan</option>
 <option>Sikkim</option>
 <option>Tamil Nadu</option>
 <option>Tripura</option>
 <option>Uttaranchal</option>
 <option>Uttar Pradesh</option>
 <option>West Bengal</option>                   </select>
                  </div>
                </div>
                <div class="col-md-6 col-sm-6">
                  <div class="form-group">
                    <label for="exampleInputEmail1">country :</label>
                    <input type="text" class="form-control" id="country" name="country" placeholder="India">
                  </div>
                </div>
                
                <div class="col-md-6 col-sm-6">
                  <div class="form-group">
                    <label for="exampleInputEmail1">Pincode :</label>
                    <input type="text" class="form-control" id="pincode" name="pincode" placeholder="Pincode">
                  </div>
                </div>
                <div class="col-md-12 col-sm-12">
                  <div class="form-group">
                    <label for="exampleInputEmail1">Contact No :</label>
                    <input type="text" class="form-control" id="contactNumber" name="contactNumber" placeholder="Contact No">
                  </div>
                </div>
                <div class="col-md-12 col-sm-12">
                  <div class="form-group">
                    <label for="exampleInputEmail1">Address</label>
                    <textarea class="form-control" placeholder="Address" id="address" name="address" rows="3"></textarea>
                  </div>
                </div>
                <hr>
                <div class="col-md-12 col-sm-12">
                  <input type="submit" value="Save" class="btn btn-primary new-btn">
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
      
	    <div class="col-md-6 col-sm-6">
        <div class="add-blk">
          <div class="panel-heading orange">
            <h3> Added Firm List</h3>
          </div>
          <div class="middle-bg">
            <div class="table-responsive">
              <table id="example2" class="table table-bordered table-hover tbl">
                <thead>
                  <tr>
                    <th>Firm Name</th>
                    <th>Date</th>
                    <th>State</th>
                    <th>Country</th>
                    <th>Address</th>
                    <th>Contact No</th>
                    
                 </tr>
                </thead>
                <tbody>
                  
      			<%
      				List<BranchDetails> branchData=new ArrayList<BranchDetails>();
      				
                    branchData=DataRetrieve.getBranchDetails();
                    	
                    System.out.println(branchData);		
      				for(BranchDetails branchDetail : branchData){
      			%>
      			
                 <tr>
                 <td><%=branchDetail.getBranchName() %></td>
                 <td><%=branchDetail.getDate() %> </td>
                 <td><%=branchDetail.getState()%> </td>
                 <td><%=branchDetail.getCountry()%> </td>
                 <td><%=branchDetail.getAddress() %> </td>
                 <td><%=branchDetail.getContactNumber() %> </td>
                 
                 </tr>
                 <%} %>
                    
                </tbody>
              </table>
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

</body>
</html>
