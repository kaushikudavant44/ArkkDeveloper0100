package com.bionische.controller;

import java.awt.List;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bionische.database.DataRetrieve;

/**
 * Servlet implementation class Report
 */

public class Run extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String email;
    private static String date;
    private static String start;
    private static String end;
    private static String branch;
    private static String reporttype;
    private static String dayreport;
    private static String monthReport;
	/**
     * @see HttpServlet#HttpServlet()
     */
    public Run() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @return 
	 * @return 
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    public static java.util.List dailyIndivisualAttendance()
	{
	    return DataRetrieve.getEmployeeDailyAttendance(email,date);
	
	}
    public static java.util.List rangeIndivisualAttendance()
	{
	    return DataRetrieve.getEmployeeDailyAttendance(email,start,end);
	
	}
    public static java.util.List dailyBranchAttendance()
	{
	    return DataRetrieve.getEmployeeDailyAttendance(branch,date,5);
	
	}
    public static java.util.List rangeBranchAttendance()
	{
	    return DataRetrieve.getEmployeeDailyAttendance(branch,start,end,5);
	
	}
    public static java.util.List reportAttendance()
    {
    	java.util.List list=new ArrayList();
    if(reporttype=="Individual Report")
	{
			if(dayreport=="Day"){
				System.out.println(list);
				list=dailyIndivisualAttendance();
			
		}else if(monthReport=="month"){
			
			rangeIndivisualAttendance();
		}
	}	
	
else if(reporttype=="Branchwise Report")
	{
		if(dayreport=="Day"){
			dailyBranchAttendance();
			
		}else if(monthReport=="month"){
			rangeBranchAttendance();
		
	}
}
	return list;
    }
	protected  void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		reporttype=request.getParameter("report");
		branch=request.getParameter("branch");
		dayreport=request.getParameter("day");
		monthReport=request.getParameter("month");
		email=request.getParameter("mail");
		date=request.getParameter("date");
		start=request.getParameter("Startdate");
		end=request.getParameter("Enddate");
		System.out.println("report page");
		response.sendRedirect("../attendance-reports.jsp");
		}

	
}
