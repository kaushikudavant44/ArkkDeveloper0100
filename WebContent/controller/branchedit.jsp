<%@page import="com.bionische.bean.BranchDetails"%>
<%@page import="com.bionische.database.DataRetrieve"%>
<%@ page import="com.bionische.database.DataSave"%>
<jsp:useBean id="obj" class="com.bionische.bean.BranchDetails"/>
<jsp:setProperty property="*" name="obj"/>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
HttpSession s=request.getSession(false);
String batchname=(String)session.getAttribute("batchname");
boolean branchDetails=DataSave.updatebatch(obj,batchname);
if(branchDetails)
{%>
<script>
if(confirm("Branch Edited Successfully")){
	window.location.href = "../manage-branch.jsp";
}</script>
<% }
else
{%>
<script>
if(confirm("Not Saved Successfully")){
	window.location.href = "../manage-branch.jsp";
}
</script>
<% }%>