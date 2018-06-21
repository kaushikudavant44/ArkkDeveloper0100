package com.bionische.database;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.util.Properties;

import com.bionische.bean.BranchDetails;
import com.bionische.bean.DailyAttendance;
import com.bionische.bean.EmployeeRegistration;
import com.bionische.mail.SMSSending;

/**
 * 
 * 
 * @author Maza Bhau
 */
public class DataRetrieve {
		
	/** This variable hold the connection with database */
	private static Connection conn;
	
	/**This is mysql drivers */
	public static String DB_DRIVER_MYSQL;
	
	/**
	 * This is mysql url which include hostname and database name
	 */
	public static String DB_URL_MYSQL;
	
	/**
	 * This is mysql username
	 */
	public static String DB_USERNAME_MYSQL;
	
	/**
	 * This is mysql password.
	 */
	public static String DB_PASSWORD_MYSQL;
	
	
	
	
	/**
	 * This method is created to make changes in database configuration file.
	 * When changes done in DatabaseConfig.properties file it automatically changes in application.
	 * @author Kaushik Udavant
	 */
	public static void databaseConfiguration() {
		try {
			String filePath="com/bionische/database/DatabaseConfig.properties";
			
			//File file=new File(filePath);
			
			InputStream fileInput= DataRetrieve.class.getClassLoader().getResourceAsStream(filePath);
			
			Properties properties=new Properties();
			
			properties.load(fileInput);
			
			fileInput.close();
			
			Enumeration enumkeys=properties.keys();
			
			
			
			
		/** User name to connect with database*/
			
			/** Host system address on which the database is present*/
			final String dbKey= (String) enumkeys.nextElement();
			DB_URL_MYSQL=properties.getProperty(dbKey);
			System.out.println(dbKey+"="+DB_URL_MYSQL);
			
			
			final String userKey= (String) enumkeys.nextElement();
			DB_USERNAME_MYSQL=properties.getProperty(userKey);
			System.out.println(userKey+"="+DB_USERNAME_MYSQL);
			
			
			/** Database name to which connection is going to be established */
			final String hostKey= (String) enumkeys.nextElement();
			DB_DRIVER_MYSQL=properties.getProperty(hostKey);
			System.out.println(hostKey+"="+DB_DRIVER_MYSQL);
			
			
			/** Password to connect with the database */
			final String PasswordKey= (String) enumkeys.nextElement();
			DB_PASSWORD_MYSQL=properties.getProperty(PasswordKey);
			System.out.println(PasswordKey+"="+DB_PASSWORD_MYSQL);
			
			
			} catch (FileNotFoundException e) {
				// Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// Auto-generated catch block
				e.printStackTrace();
			}

	}
	

	
	/**
	 * This method will load the MySQL driver's and get connection with database.
	 * @return true - if connection successfully created.
	 */
	public static boolean createMySQLConnection() {
		try {
			databaseConfiguration();
		
			Class.forName(DB_DRIVER_MYSQL);
			
			conn=DriverManager.getConnection(DB_URL_MYSQL,DB_USERNAME_MYSQL,DB_PASSWORD_MYSQL);
			
			System.out.println("Connection is successfully with database.");

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return true;
	}

	

	/**
	 * This method is used to get user detail using user identifier.
	 * @author Kaushik Udavant
	 * @param userId - identifier of the user who's detail is required.
	 * @return {@link EmployeeRegistration} - if exist or return null.
	 */
	public static List getEmployeeProfile(String empid){
		System.out.println("came"+empid);
		List<EmployeeRegistration> allEmployeeList=new ArrayList<EmployeeRegistration>();
		EmployeeRegistration empRegistration = null;
		try{
			createMySQLConnection();
			String query="select * from employeeregistration where emp_type=? and emp_id=?";
			PreparedStatement stmt=conn.prepareStatement(query);
			
			stmt.setString(1,"Employee");
			stmt.setString(2,empid);
			
			
			ResultSet resultSet=stmt.executeQuery();

			while(resultSet.next()){
				empRegistration = new EmployeeRegistration();
				
				empRegistration.setType(resultSet.getString("emp_type"));
				empRegistration.setEmpID(resultSet.getString("emp_id"));
				
				empRegistration.setFirstName(resultSet.getString("firstname"));
				empRegistration.setLastName(resultSet.getString("lastname"));
				empRegistration.setCountryCode(resultSet.getString("country_code"));
				empRegistration.setMobileNumber(resultSet.getString("mobile_number"));
				
				empRegistration.setEmail(resultSet.getString("email"));
				empRegistration.setQualification(resultSet.getString("qualification"));
				empRegistration.setDesignation(resultSet.getString("designation"));
				empRegistration.setBranch(resultSet.getString("branch"));
				empRegistration.setSalary(resultSet.getInt("salary"));
				empRegistration.setDeviceid(resultSet.getInt("deviceid"));
				empRegistration.setPicture(resultSet.getString("photo"));
				empRegistration.setDocument(resultSet.getString("document"));
				
				allEmployeeList.add(empRegistration);
			}
		}catch(SQLException sql){
			sql.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				conn.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
			System.out.println("getEmployeeProfile() closed");
		}
		return allEmployeeList;
	}	
	
	/**
	 * This method is used to get user detail using user identifier.
	 * @author Kaushik Udavant
	 * @param userId - identifier of the user who's detail is required.
	 * @return {@link EmployeeRegistration} - if exist or return null.
	 */
	public static List getLabourProfile(String empid){
		System.out.println("came"+empid);
		List<EmployeeRegistration> allEmployeeList=new ArrayList<EmployeeRegistration>();
		EmployeeRegistration empRegistration = null;
		try{
			createMySQLConnection();
			String query="select * from employeeregistration where emp_id=? and emp_type=?";
			PreparedStatement stmt=conn.prepareStatement(query);
			stmt.setString(1,empid);
			stmt.setString(2,"Labour");
			
			
			ResultSet resultSet=stmt.executeQuery();

			while(resultSet.next()){
				empRegistration = new EmployeeRegistration();
				
				empRegistration.setType(resultSet.getString("emp_type"));
				empRegistration.setEmpID(resultSet.getString("emp_id"));
				
				empRegistration.setFirstName(resultSet.getString("firstname"));
				empRegistration.setLastName(resultSet.getString("lastname"));
				empRegistration.setCountryCode(resultSet.getString("country_code"));
				empRegistration.setMobileNumber(resultSet.getString("mobile_number"));
				
				empRegistration.setEmail(resultSet.getString("email"));
				empRegistration.setTol(resultSet.getString("typeoflab"));
				empRegistration.setDesignation(resultSet.getString("designation"));
				empRegistration.setBranch(resultSet.getString("branch"));
				empRegistration.setSalary(resultSet.getInt("salary"));
				empRegistration.setDeviceid(resultSet.getInt("deviceid"));
				empRegistration.setDocument(resultSet.getString("document"));
				empRegistration.setPicture(resultSet.getString("photo"));
				
				allEmployeeList.add(empRegistration);
			}
		}catch(SQLException sql){
			sql.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				conn.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
			System.out.println("getEmployeeProfile() closed");
		}
		return allEmployeeList;
	}	
	/**
	 * This method is used to get user detail using user identifier.
	 * @author Kaushik Udavant
	 * @param userId - identifier of the user who's detail is required.
	 * @return {@link EmployeeRegistration} - if exist or return null.
	 */
	public static List getEmployeeProfile(String empid,int deviceid){
		System.out.println("came2"+empid);
		List<EmployeeRegistration> allEmployeeList=new ArrayList<EmployeeRegistration>();
		EmployeeRegistration empRegistration = null;
		try{
			createMySQLConnection();
			String query="select * from employeeregistration where emp_id=? and deviceid=?";
			PreparedStatement stmt=conn.prepareStatement(query);
			stmt.setString(1,empid);
			stmt.setInt(2,deviceid);
			
			ResultSet resultSet=stmt.executeQuery();

			while(resultSet.next()){
				empRegistration = new EmployeeRegistration();
				
				empRegistration.setType(resultSet.getString("emp_type"));
				empRegistration.setEmpID(resultSet.getString("emp_id"));
				
				empRegistration.setFirstName(resultSet.getString("firstname"));
				empRegistration.setLastName(resultSet.getString("lastname"));
				empRegistration.setCountryCode(resultSet.getString("country_code"));
				empRegistration.setMobileNumber(resultSet.getString("mobile_number"));
				
				empRegistration.setEmail(resultSet.getString("email"));
				empRegistration.setQualification(resultSet.getString("qualification"));
				empRegistration.setDesignation(resultSet.getString("designation"));
				empRegistration.setBranch(resultSet.getString("branch"));
				empRegistration.setSalary(resultSet.getInt("salary"));
				
				allEmployeeList.add(empRegistration);
			}
		}catch(SQLException sql){
			sql.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				conn.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
			System.out.println("getEmployeeProfile() closed");
		}
		return allEmployeeList;
	}	

	
	/**
	 * This method is used to get user detail using user identifier.
	 * @author Kaushik Udavant
	 * @param userId - identifier of the user who's detail is required.
	 * @return {@link EmployeeRegistration} - if exist or return null.
	 */
	public static List getEmployeeProfile(String empid,String type){
		System.out.println("came"+empid);
		List<EmployeeRegistration> allEmployeeList=new ArrayList<EmployeeRegistration>();
		EmployeeRegistration empRegistration = null;
		try{
			createMySQLConnection();
			String query="select * from employeeregistration where branch=? and emp_type=?";
			PreparedStatement stmt=conn.prepareStatement(query);
			stmt.setString(1,empid);
			stmt.setString(2,type);
			
			ResultSet resultSet=stmt.executeQuery();

			while(resultSet.next()){
				empRegistration = new EmployeeRegistration();
				
				empRegistration.setType(resultSet.getString("emp_type"));
				empRegistration.setEmpID(resultSet.getString("emp_id"));
				
				empRegistration.setFirstName(resultSet.getString("firstname"));
				empRegistration.setLastName(resultSet.getString("lastname"));
				empRegistration.setCountryCode(resultSet.getString("country_code"));
				empRegistration.setMobileNumber(resultSet.getString("mobile_number"));
				
				empRegistration.setEmail(resultSet.getString("email"));
				empRegistration.setQualification(resultSet.getString("qualification"));
				empRegistration.setDesignation(resultSet.getString("designation"));
				empRegistration.setBranch(resultSet.getString("branch"));
				empRegistration.setSalary(resultSet.getInt("salary"));
				empRegistration.setPicture(resultSet.getString("photo"));
				empRegistration.setDocument(resultSet.getString("document"));
				
				allEmployeeList.add(empRegistration);
			}
		}catch(SQLException sql){
			sql.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				conn.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
			System.out.println("getEmployeeProfile() closed");
		}
		return allEmployeeList;
	}	

	/**
	 * This method is used to get daily attendance details.
	 * @author Kaushik Udavant
	 * @param userId - identifier of the user who's detail is required.
	 * @return {@link EmployeeRegistration} - if exist or return null.
	 */
		
	
	public static boolean removeEmployee(int id) {
		//Vector<String> userList = new Vector<String>();
		try{

			createMySQLConnection();
			
			String query = "delete from employeeregistration where id = ? ";
			PreparedStatement prepareStatement=conn.prepareStatement(query);
			
			prepareStatement.setInt(1, id);
			prepareStatement.executeUpdate();
			System.out.println("Employee has deleted from employeeregistration");
			return true;
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			try{
				conn.close();
				System.out.println("removeUser() successfully closed");
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return false;	
	}
	
	/**
	 * This method is used to get branch details using branch identifier.
	 * @author Kaushik Udavant
	 * @param branchDetails - identifier of the branch which details are required.
	 * @return {@link BranchDetails} - if exist or return null.
	 */
	public static List getBranchDetails(){
		BranchDetails branchDetails = null;
		List<BranchDetails> branchList=new ArrayList<BranchDetails>();
		try{
			createMySQLConnection();
			String query="select * from branchdetails where branchtype=?";
			PreparedStatement stmt=conn.prepareStatement(query);
		    stmt.setString(1,"firm");
			ResultSet resultSet=stmt.executeQuery();
			
			while(resultSet.next()){
				branchDetails = new BranchDetails();
				
				branchDetails.setBranchName(resultSet.getString("branch_name"));
				branchDetails.setDate(resultSet.getString("date"));	
				branchDetails.setContactNumber(resultSet.getString("branch_contact"));
				branchDetails.setState(resultSet.getString("branch_state"));
				branchDetails.setCountry(resultSet.getString("branch_country"));
				branchDetails.setAddress(resultSet.getString("branch_address"));
				branchList.add(branchDetails);
			}
			
			System.out.println("DataRetrieve Successfully");
		}catch(SQLException sql){
			sql.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				conn.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
			System.out.println("getBranchDetails() closed");
		}
		return branchList;
	}
	
	/**
	 * This method is used to get branch details using branch identifier.
	 * @author Kaushik Udavant
	 * @param branchDetails - identifier of the branch which details are required.
	 * @return {@link BranchDetails} - if exist or return null.
	 */
	public static List getLabourBranchDetails(){
		BranchDetails branchDetails = null;
		List<BranchDetails> branchList=new ArrayList<BranchDetails>();
		try{
			createMySQLConnection();
			String query="select * from branchdetails where branchtype=?";
			PreparedStatement stmt=conn.prepareStatement(query);
		    stmt.setString(1,"site");
			ResultSet resultSet=stmt.executeQuery();
			
			while(resultSet.next()){
				branchDetails = new BranchDetails();
				
				branchDetails.setBranchName(resultSet.getString("branch_name"));
				branchDetails.setDate(resultSet.getString("date"));	
				branchDetails.setContactNumber(resultSet.getString("branch_contact"));
				branchDetails.setAddress(resultSet.getString("branch_address"));
				branchList.add(branchDetails);
			}
			
			System.out.println("DataRetrieve Successfully");
		}catch(SQLException sql){
			sql.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				conn.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
			System.out.println("getBranchDetails() closed");
		}
		return branchList;
	}
	
	
	/**
	 * This method is used to get branch details using branch identifier.
	 * @author Kaushik Udavant
	 * @param branchDetails - identifier of the branch which details are required.
	 * @return {@link BranchDetails} - if exist or return null.
	 */
	public static List getBranchDetails(String branch){
		BranchDetails branchDetails = null;
		List<BranchDetails> branchList=new ArrayList<BranchDetails>();
		try{
			createMySQLConnection();
			String query="select * from branchdetails where branch_name=?";
			PreparedStatement stmt=conn.prepareStatement(query);
			stmt.setString(1,branch);
			ResultSet resultSet=stmt.executeQuery();
			
			while(resultSet.next()){
				branchDetails = new BranchDetails();
				
				branchDetails.setBranchName(resultSet.getString("branch_name"));
				branchDetails.setDate(resultSet.getString("date"));	
				branchDetails.setContactNumber(resultSet.getString("branch_contact"));
				branchDetails.setAddress(resultSet.getString("branch_address"));
				branchList.add(branchDetails);
			}
			
			System.out.println("DataRetrieve Successfully");
		}catch(SQLException sql){
			sql.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				conn.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
			System.out.println("getBranchDetails() closed");
		}
		return branchList;
	}	
	/**
	 * This method is used to get daily attendance details.
	 * @author Kaushik Udavant
	 * @param userId - identifier of the user who's detail is required.
	 * @return {@link EmployeeRegistration} - if exist or return null.
	 */
	public static List getEmployeeDailyAttendance(String id,String date){
		List<DailyAttendance> EmployeeAttendanceList=new ArrayList<DailyAttendance>();
		DailyAttendance empAttendance = null;
		try{
			createMySQLConnection();
			String query="select * from dailyattendance where ID=? AND date=? AND type=? ";
			PreparedStatement stmt=conn.prepareStatement(query);
			stmt.setString(1,id);
			stmt.setString(2,date);
			stmt.setString(3,"Employee");
			ResultSet resultSet=stmt.executeQuery();

			while(resultSet.next()){
				empAttendance = new DailyAttendance();
				empAttendance.setEmail(resultSet.getString("email"));
				empAttendance.setEmpID(resultSet.getString("id"));
				empAttendance.setFirstName(resultSet.getString("firstname"));
				empAttendance.setLastName(resultSet.getString("lastname"));
				empAttendance.setCurrentdate(resultSet.getString("date"));
				empAttendance.setStatus(resultSet.getString("status"));
				empAttendance.setTime(resultSet.getString("time"));
				empAttendance.setDirection(resultSet.getString("direction"));
				empAttendance.setBranch(resultSet.getString("branch"));
				
			
				EmployeeAttendanceList.add(empAttendance);
			}
		}catch(SQLException sql){
			sql.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				conn.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
			System.out.println("getEmployeeProfile() closed");
		}
		return EmployeeAttendanceList;
	}	
	
	
	/**
	 * This method is used to get daily attendance details.
	 * @author Kaushik Udavant
	 * @param userId - identifier of the user who's detail is required.
	 * @return {@link EmployeeRegistration} - if exist or return null.
	 */
	public static List getLabourDailyAttendance(String id,String date){
		List<DailyAttendance> EmployeeAttendanceList=new ArrayList<DailyAttendance>();
		DailyAttendance empAttendance = null;
		try{
			createMySQLConnection();
			String query="select * from dailyattendance where ID=? AND date=? AND type=?";
			PreparedStatement stmt=conn.prepareStatement(query);
			stmt.setString(1,id);
			stmt.setString(2,date);
			stmt.setString(3,"Labour");
			ResultSet resultSet=stmt.executeQuery();

			while(resultSet.next()){
				empAttendance = new DailyAttendance();
				empAttendance.setEmail(resultSet.getString("email"));
				empAttendance.setEmpID(resultSet.getString("id"));
				empAttendance.setFirstName(resultSet.getString("firstname"));
				empAttendance.setLastName(resultSet.getString("lastname"));
				empAttendance.setCurrentdate(resultSet.getString("date"));
				empAttendance.setStatus(resultSet.getString("status"));
				empAttendance.setTime(resultSet.getString("time"));
				empAttendance.setDirection(resultSet.getString("direction"));
				empAttendance.setBranch(resultSet.getString("branch"));
				
			
				EmployeeAttendanceList.add(empAttendance);
			}
		}catch(SQLException sql){
			sql.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				conn.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
			System.out.println("getEmployeeProfile() closed");
		}
		return EmployeeAttendanceList;
	}	
	/**
	 * This method is used to get daily attendance details.
	 * @author Kaushik Udavant
	 * @param userId - identifier of the user who's detail is required.
	 * @return {@link EmployeeRegistration} - if exist or return null.
	 */
	public static List getEmployeeDailyAttendance(String name,String start,String end){
		List<DailyAttendance> EmployeeAttendanceList=new ArrayList<DailyAttendance>();
		DailyAttendance empAttendance = null;
		try{
			
			createMySQLConnection();
			String query="select * from dailyattendance where ID=? AND type=? AND date between ? and ?";
			PreparedStatement stmt=conn.prepareStatement(query);
			stmt.setString(1,name);
			stmt.setString(2,"employee");
			stmt.setString(3,start);
			stmt.setString(4,end);
		
			ResultSet resultSet=stmt.executeQuery();

			while(resultSet.next()){
				empAttendance = new DailyAttendance();
				empAttendance = new DailyAttendance();
				empAttendance.setEmail(resultSet.getString("email"));
				empAttendance.setEmpID(resultSet.getString("id"));
				empAttendance.setFirstName(resultSet.getString("firstname"));
				empAttendance.setLastName(resultSet.getString("lastname"));
				empAttendance.setCurrentdate(resultSet.getString("date"));
				empAttendance.setStatus(resultSet.getString("status"));
				empAttendance.setTime(resultSet.getString("time"));
				empAttendance.setDirection(resultSet.getString("direction"));
				empAttendance.setBranch(resultSet.getString("branch"));
				
			
				EmployeeAttendanceList.add(empAttendance);
			}
		}catch(SQLException sql){
			sql.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				conn.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
			System.out.println("getEmployeeProfile() closed");
		}
		return EmployeeAttendanceList;
	}	
	
	/**
	 * This method is used to get daily attendance details.
	 * @author Kaushik Udavant
	 * @param userId - identifier of the user who's detail is required.
	 * @return {@link EmployeeRegistration} - if exist or return null.
	 */
	public static List getLabourDailyAttendance(String name,String start,String end){
		List<DailyAttendance> EmployeeAttendanceList=new ArrayList<DailyAttendance>();
		DailyAttendance empAttendance = null;
		try{
			
			createMySQLConnection();
			String query="select * from dailyattendance where ID=? AND type=? AND date between ? and ?";
			PreparedStatement stmt=conn.prepareStatement(query);
			stmt.setString(1,name);
			stmt.setString(2,"Labour");
			stmt.setString(3,start);
			stmt.setString(4,end);
		
			ResultSet resultSet=stmt.executeQuery();

			while(resultSet.next()){
				empAttendance = new DailyAttendance();
				empAttendance = new DailyAttendance();
				empAttendance.setEmail(resultSet.getString("email"));
				empAttendance.setEmpID(resultSet.getString("id"));
				empAttendance.setFirstName(resultSet.getString("firstname"));
				empAttendance.setLastName(resultSet.getString("lastname"));
				empAttendance.setCurrentdate(resultSet.getString("date"));
				empAttendance.setStatus(resultSet.getString("status"));
				empAttendance.setTime(resultSet.getString("time"));
				empAttendance.setDirection(resultSet.getString("direction"));
				empAttendance.setBranch(resultSet.getString("branch"));
				
			
				EmployeeAttendanceList.add(empAttendance);
			}
		}catch(SQLException sql){
			sql.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				conn.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
			System.out.println("getEmployeeProfile() closed");
		}
		return EmployeeAttendanceList;
	}
	/**
	 * This method is used to get daily attendance details.
	 * @author Kaushik Udavant
	 * @param userId - identifier of the user who's detail is required.
	 * @return {@link EmployeeRegistration} - if exist or return null.
	 */
	
	public static List getLabourDailyAttendance(String branch,String start,String end,int no){
		List<DailyAttendance> EmployeeAttendanceList=new ArrayList<DailyAttendance>();
		DailyAttendance empAttendance = null;
		try{
			createMySQLConnection();
			String query="select * from dailyattendance where branch=? AND type=? AND date between ? and ?";
			PreparedStatement stmt=conn.prepareStatement(query);
			stmt.setString(1,branch);
			stmt.setString(2,"Labour");
			stmt.setString(3,start);
			stmt.setString(4,end);
		
			ResultSet resultSet=stmt.executeQuery();

			while(resultSet.next()){
				empAttendance = new DailyAttendance();
				empAttendance.setEmail(resultSet.getString("email"));
				empAttendance.setEmpID(resultSet.getString("id"));
				empAttendance.setFirstName(resultSet.getString("firstname"));
				empAttendance.setLastName(resultSet.getString("lastname"));
				empAttendance.setCurrentdate(resultSet.getString("date"));
				empAttendance.setStatus(resultSet.getString("status"));
				empAttendance.setTime(resultSet.getString("time"));
				empAttendance.setDirection(resultSet.getString("direction"));
				empAttendance.setBranch(resultSet.getString("branch"));
				
			
				EmployeeAttendanceList.add(empAttendance);
			}
		}catch(SQLException sql){
			sql.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				conn.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
			System.out.println("getEmployeeProfile() closed");
		}
		return EmployeeAttendanceList;
	}	

	/**
	 * This method is used to get daily attendance details.
	 * @author Kaushik Udavant
	 * @param userId - identifier of the user who's detail is required.
	 * @return {@link EmployeeRegistration} - if exist or return null.
	 */
	
	
	
	public static List getEmployeeDailyAttendance(String branch,String start,String end,int no){
		List<DailyAttendance> EmployeeAttendanceList=new ArrayList<DailyAttendance>();
		DailyAttendance empAttendance = null;
		try{
			createMySQLConnection();
			String query="select * from dailyattendance where branch=? AND type=? AND date between ? and ?";
			PreparedStatement stmt=conn.prepareStatement(query);
			stmt.setString(1,branch);
			stmt.setString(2,"employee");
			stmt.setString(3,start);
			stmt.setString(4,end);
		
			ResultSet resultSet=stmt.executeQuery();

			while(resultSet.next()){
				empAttendance = new DailyAttendance();
				empAttendance.setEmail(resultSet.getString("email"));
				empAttendance.setEmpID(resultSet.getString("id"));
				empAttendance.setFirstName(resultSet.getString("firstname"));
				empAttendance.setLastName(resultSet.getString("lastname"));
				empAttendance.setCurrentdate(resultSet.getString("date"));
				empAttendance.setStatus(resultSet.getString("status"));
				empAttendance.setTime(resultSet.getString("time"));
				empAttendance.setDirection(resultSet.getString("direction"));
				empAttendance.setBranch(resultSet.getString("branch"));
				
			
				EmployeeAttendanceList.add(empAttendance);
			}
		}catch(SQLException sql){
			sql.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				conn.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
			System.out.println("getEmployeeProfile() closed");
		}
		return EmployeeAttendanceList;
	}	

	/**
	 * This method is used to get daily attendance details.
	 * @author Kaushik Udavant
	 * @param userId - identifier of the user who's detail is required.
	 * @return {@link EmployeeRegistration} - if exist or return null.
	 */
	
	
	
	public static List getEmployeeDailyAttendance(String branch,String date,int no){
		List<DailyAttendance> EmployeeAttendanceList=new ArrayList<DailyAttendance>();
		DailyAttendance empAttendance = null;
		try{
			createMySQLConnection();
			String query="select * from dailyattendance where branch=? AND type=? AND date=?";
			PreparedStatement stmt=conn.prepareStatement(query);
			stmt.setString(1,branch);
			stmt.setString(2,"Employee");
			stmt.setString(3,date);
		
			ResultSet resultSet=stmt.executeQuery();

			while(resultSet.next()){
				empAttendance = new DailyAttendance();
				empAttendance.setEmail(resultSet.getString("email"));
				empAttendance.setEmpID(resultSet.getString("ID"));
				empAttendance.setFirstName(resultSet.getString("firstname"));
				empAttendance.setLastName(resultSet.getString("lastname"));
				empAttendance.setCurrentdate(resultSet.getString("date"));
				empAttendance.setStatus(resultSet.getString("status"));
				empAttendance.setTime(resultSet.getString("time"));
				empAttendance.setDirection(resultSet.getString("direction"));
				empAttendance.setBranch(resultSet.getString("branch"));
				
			
				EmployeeAttendanceList.add(empAttendance);
				System.out.println("function");
			}
		}catch(SQLException sql){
			sql.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				conn.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
			System.out.println("getEmployeeProfile() closed");
		}
		return EmployeeAttendanceList;
	}	
	
	
	/**
	 * This method is used to get daily attendance details.
	 * @author Kaushik Udavant
	 * @param userId - identifier of the user who's detail is required.
	 * @return {@link EmployeeRegistration} - if exist or return null.
	 */
	
	
	
	public static List getLabourDailyAttendance(String branch,String date,int no){
		List<DailyAttendance> EmployeeAttendanceList=new ArrayList<DailyAttendance>();
		DailyAttendance empAttendance = null;
		try{
			createMySQLConnection();
			String query="select * from dailyattendance where branch=? AND date=? AND type=?";
			PreparedStatement stmt=conn.prepareStatement(query);
			stmt.setString(1,branch);
			stmt.setString(2,date);
			stmt.setString(3,"Labour");
		
			ResultSet resultSet=stmt.executeQuery();

			while(resultSet.next()){
				empAttendance = new DailyAttendance();
				empAttendance.setEmail(resultSet.getString("email"));
				empAttendance.setEmpID(resultSet.getString("ID"));
				empAttendance.setFirstName(resultSet.getString("firstname"));
				empAttendance.setLastName(resultSet.getString("lastname"));
				empAttendance.setCurrentdate(resultSet.getString("date"));
				empAttendance.setStatus(resultSet.getString("status"));
				empAttendance.setTime(resultSet.getString("time"));
				empAttendance.setDirection(resultSet.getString("direction"));
				empAttendance.setBranch(resultSet.getString("branch"));
				
			
				EmployeeAttendanceList.add(empAttendance);
				System.out.println("function");
			}
		}catch(SQLException sql){
			sql.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				conn.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
			System.out.println("getEmployeeProfile() closed");
		}
		return EmployeeAttendanceList;
	}	
	
	/**
	 * This method delete existing user list.
	 * @author kaushik udavant
	 */
	public static boolean removeProduct(String id,String branch) {
		System.out.println(id);
		
		try{
			
			createMySQLConnection();
			//String s=regetParameter("id");
		//	int productName=addToCart.getId();
		//	System.out.println(productName);
			String query = "delete from employeeregistration where emp_id = ? and branch=?";
			PreparedStatement prepareStatement=conn.prepareStatement(query);

			prepareStatement.setString(1, id);
			prepareStatement.setString(2, branch);
			prepareStatement.executeUpdate();
			System.out.println("Product has deleted from addtocart");
			return true;
		}catch(SQLException e){
			//e.printStackTrace();
		}finally{
			try{
				conn.close();
				//System.out.println("removeUser() successfully closed");
			}catch(SQLException e){
				//e.printStackTrace();
			}
		}
		return false;
		
	}

	/**
	 * This method update existing user list.
	 * @author kaushik udavant
	 */
	public static boolean edit(String id,String firstname,String lastname,String mobile_number,String email,String qualification,String designation,String salary,String picture,String document,String branch) {
		
		try{
			String photo="\\"+picture;
			String doc="\\"+document;
			createMySQLConnection();
			
		    System.out.println(id);
			String query = "update employeeregistration SET firstname=?,lastname=?,mobile_number=?,email=?,qualification=?,designation=?,salary=?,photo=?,document=? where emp_id=? and branch=? and emp_type=?";
			PreparedStatement prepareStatement=conn.prepareStatement(query);

			
			prepareStatement.setString(1, firstname);
			prepareStatement.setString(2, lastname);
			prepareStatement.setString(3, mobile_number);
			prepareStatement.setString(4, email);
			prepareStatement.setString(5, qualification);
			prepareStatement.setString(6, designation);
			prepareStatement.setString(7, salary);
			prepareStatement.setString(8, photo);
			prepareStatement.setString(9, doc);
			
			prepareStatement.setString(10, id);
			prepareStatement.setString(11, branch);
			prepareStatement.setString(12, "Employee");
			
			prepareStatement.executeUpdate();
			System.out.println("Details Edited");
			return true;
		}catch(SQLException e){
			//e.printStackTrace();
		}finally{
			try{
				conn.close();
				//System.out.println("removeUser() successfully closed");
			}catch(SQLException e){
				//e.printStackTrace();
			}
		}
		return false;
		
	}

	/**
	 * This method is to reset the admin password.
	 * @author kaushik udavant
	 */
	
	public static boolean compareOldPsw(String old) {
		//Vector<String> userList = new Vector<String>();
		ResultSet rst=null;
		String retrievedpwd=null;
		try{
            
			createMySQLConnection();
			String emp_id="admin";
			String query = "select password from employeeregistration where emp_id = ?";
			PreparedStatement prepareStatement=conn.prepareStatement(query);
			
			prepareStatement.setString(1, emp_id);
			rst=prepareStatement.executeQuery();
			
			while(rst.next())
			{
				 retrievedpwd=rst.getString(1);
				 System.out.println(retrievedpwd);
			}
			if(old.equals(retrievedpwd)){
    	    	
    	    	return true;
    	    }
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			try{
				conn.close();
				System.out.println("removeUser() successfully closed");
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return false;	
	}
	
	/**
	 * This is to reset admin password list.
	 * @author kaushik udavant
	 */
	public static boolean reset(String Currentpwd,String Newpwd) {
		
		
		String pwd=null;
		try{
            
			createMySQLConnection();
			String emp_id="admin";
			String query = "update employeeregistration SET password=? where emp_id = ? ";
			PreparedStatement prepareStatement=conn.prepareStatement(query);
			
			prepareStatement.setString(1, Newpwd);
			prepareStatement.setString(2, emp_id);
			prepareStatement.executeUpdate();
			
			
    	    	return true;
    	    
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			try{
				conn.close();
				System.out.println("removeUser() successfully closed");
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return false;	
	}
	
	/**
	 * TODO
	 * @param email
	 * @return
	 */
	public static String isValidUser(String email)
	{
		int id=0;
		String pwd=null;
		System.out.println(email);
		try{
			createMySQLConnection();
			Statement s=conn.createStatement();
			ResultSet rs=s.executeQuery("select * from employeeregistration where email='"+email+"'");
			while(rs.next())
			{
				 pwd = rs.getString(16);
				 System.out.println(pwd);
			}
			
			System.out.println(id);
			
			
		}catch(SQLException se) {
			System.out.println(se);
		}finally {
			try {
				conn.close();
				System.out.println("isValidUser() closed");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		 System.out.println(pwd);
		 if(pwd!=null){
		return pwd;
		 }
		 else{
			 return null;
 
		 }	
		
	}
	
	/**
	 * This method is used to check the user is valid or not.If the user name and password is correct 
	 * then user login successfully else it gives message enter correct user name and password.
	 * This is for employee login.
	 * @author Kaushik Udavant
	 * @param email
	 * @param password
	 * @return int - ID of the user if exist else return 0
	 */
	public static int isValidUser(String logInID,String password)
	{
		
		int admin=1;
		int employee=2;
		String empid=null;
		String s1="adminmasacademy";
		try{
			
			System.out.println("logInID"+logInID);
			System.out.println("password"+password);
			createMySQLConnection();
			Statement s=conn.createStatement();
			ResultSet rs=s.executeQuery("select * from employeeregistration where logInID='"+logInID+"' and password='"+password+"'");
			
			while(rs.next())
			{
				empid = (String)rs.getString(2);
				String s2=empid;
				/*String s2="empidadminmasacademy";*/
				 System.out.println("empidthis"+empid);
				 if(s2.equals(s1))
				 {
					 return admin;
					 
				 }
				 else
				 {   
					 return employee;
				 }
				 
				 
			}
		
		}catch(SQLException se) {
			System.out.println(se);
		}finally {
			try {
				conn.close();
				System.out.println("isValidUser() closed");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return 0;
	
	}

	/** this metod generates the salary of indivisual employeee of whole branch*/
	
public static List branchEmployeeSalary(String branch,String start,String end){
		
	 List<EmployeeRegistration> list = new ArrayList<EmployeeRegistration>();
		EmployeeRegistration empRegistration = null;
		
		try{
			createMySQLConnection();
            String query="select emp_id,firstname,lastname from employeeregistration where branch=? and emp_type=?";
			PreparedStatement stmt=conn.prepareStatement(query);
			stmt.setString(1,branch);
			stmt.setString(2,"employee");
			ResultSet resultSet=stmt.executeQuery();

			while(resultSet.next()){
				
				int salary=calculateSalary(resultSet.getString(1),start,end,branch);
				
				
				empRegistration = new EmployeeRegistration();
				
				empRegistration.setEmpID(resultSet.getString("emp_id"));
				empRegistration.setSalary(salary);
				empRegistration.setFirstName(resultSet.getString("firstname"));
				empRegistration.setLastName(resultSet.getString("lastname"));
				
				
				list.add(empRegistration);
				
			}
		}catch(SQLException sql){
			sql.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				conn.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
			System.out.println("getEmployeeProfile() closed");
		}
		return list;
	}	

/** this metod generates the salary of indivisual employeee*/

public static List indivisualEmployeeSalary(String emp_id,String start,String end,String branch){
		
	 List<EmployeeRegistration> list = new ArrayList<EmployeeRegistration>();
		EmployeeRegistration empRegistration = null;
		System.out.println("empid"+emp_id);
		try{
			createMySQLConnection();
			String query="SELECT salary/26,(SELECT COUNT(DISTINCT date) FROM dailyattendance WHERE ID=? AND type=? AND direction=? AND branch=? AND date between ? and ?),emp_id,firstname,lastname FROM employeeregistration where emp_id=? AND branch=? AND emp_type=?";
				 
			PreparedStatement stmt=conn.prepareStatement(query);
			stmt.setString(1, emp_id);
			stmt.setString(2, "Employee");
			stmt.setString(3, "in");
			stmt.setString(4, branch);
			stmt.setString(5, start);
			stmt.setString(6, end);
			stmt.setString(7, emp_id);
			stmt.setString(8, branch);
			stmt.setString(9, "Employee");
			ResultSet resultSet=stmt.executeQuery();

			while(resultSet.next()){
				empRegistration = new EmployeeRegistration();
				int salary=resultSet.getInt(1);
				int days=resultSet.getInt(2);
				int monthsalary=salary*days;
				System.out.println("days"+days);
				empRegistration.setEmpID(resultSet.getString(3));
				empRegistration.setFirstName(resultSet.getString(4));
				empRegistration.setLastName(resultSet.getString(5));
				empRegistration.setSalary(monthsalary);
				
				
				
				list.add(empRegistration);
				
			}
		}catch(SQLException sql){
			sql.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				conn.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
			System.out.println("getEmployeeProfile() closed");
		}
		return list;
	}	

/** this metod generates the salary of indivisual employeee*//*

public static List indivisualEmployeeSalary(String salbranch,String salday,int no){
	
	System.out.println("infunction");	
	 List<EmployeeRegistration> list = new ArrayList<EmployeeRegistration>();
		EmployeeRegistration empRegistration = null;
		System.out.println("infunction"+salbranch);
		System.out.println("infunction"+salday);
		      
		try{
			createMySQLConnection();
			String query="select employeeregistration.salary,employeeregistration.emp_id,employeeregistration.firstname,dailyattendance.date, dailyattendance.time_spent from dailyattendance join employeeregistration on employeeregistration.emp_id=dailyattendance.emp_id where  dailyattendance.date=? and dailyattendance.branch=?";
			PreparedStatement stmt=conn.prepareStatement(query);
			stmt.setString(1, salbranch);
			stmt.setString(2, salday);
			
			ResultSet resultSet=stmt.executeQuery();

			while(resultSet.next()){
				empRegistration = new EmployeeRegistration();
				
				empRegistration.setEmpID(resultSet.getString("emp_id"));
				empRegistration.setSalary(resultSet.getString("salary"));
				System.out.println(resultSet.getString("salary"));
				empRegistration.setFirstName(resultSet.getString("firstname"));
				empRegistration.setSpent_time(resultSet.getString("time_spent"));
				System.out.println("queryin"+resultSet.getString("salary"));
				list.add(empRegistration);
				
			}
		}catch(SQLException sql){
			sql.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				conn.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
			System.out.println("getEmployeeProfile() closed");
		}
		return list;
	}	
*/
/*this method gives indivisual labour salary*/

public static List indivisualLabourSalary(String emp_id,String start,String end,String branch){
	
	 List<EmployeeRegistration> list = new ArrayList<EmployeeRegistration>();
		EmployeeRegistration empRegistration = null;
		int hours=0;
		int totalhours=0;
		int totalsalary=0;
		try{
			createMySQLConnection();
/*			String query="SELECT salary,(SELECT COUNT(DISTINCT date) FROM dailyattendance WHERE ID=? AND type=? AND direction=? AND branch=? AND date between ? and ?),firstname,lastname,branch FROM employeeregistration where emp_id=? AND emp_type=?";
*/			String query="SELECT MAX(time) AS LatestDate,MIN(time) AS MinPrice,firstname,lastname,branch,salary/24,date,ID FROM dailyattendance WHERE ID=? and date between ? and ? and branch=? and type=? group by date";
	 
			PreparedStatement stmt=conn.prepareStatement(query);
			stmt.setString(1, emp_id);
		    stmt.setString(2, start);
			stmt.setString(3, end);
			stmt.setString(4, branch);
			stmt.setString(5, "Labour");
			ResultSet resultSet=stmt.executeQuery();

			while(resultSet.next()){
				empRegistration = new EmployeeRegistration();
				String max=resultSet.getString(1);
				String min=resultSet.getString(2);
				String part[]=max.split(":");
				String part1[]=min.split(":");
				int maxhour=Integer.parseInt(part[0]);
				int minhour=Integer.parseInt(part1[0]);
				System.out.println("maxhour:"+maxhour);
				System.out.println("minhor:"+minhour);
				hours=maxhour-minhour;
				totalhours=totalhours+hours;
				totalsalary=resultSet.getInt(6)*totalhours;
				empRegistration.setFirstName(resultSet.getString(3));
				empRegistration.setLastName(resultSet.getString(4));
				empRegistration.setBranch(resultSet.getString(5));
				empRegistration.setDate(resultSet.getString(7));
				empRegistration.setSalary(totalsalary);
				empRegistration.setEmpID(resultSet.getString(8));
				
				
				
			}
			System.out.println("totalsalary:"+totalsalary);
			System.out.println("totalhours:"+totalhours);
			list.add(empRegistration);
		}catch(SQLException sql){
			sql.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				conn.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
			System.out.println("getEmployeeProfile() closed");
		}
		return list;
	}	

  /* this method calculate the indivisual salary for branch*/

public static int calculateSalary(String emp_id,String start,String end,String branch){
	
	 List<EmployeeRegistration> list = new ArrayList<EmployeeRegistration>();
		EmployeeRegistration empRegistration = null;
		int monthsalary=0;
		try{
			
			createMySQLConnection();
			String query="SELECT salary/26,(SELECT COUNT(DISTINCT date) FROM dailyattendance WHERE ID=? AND type=? AND direction=? AND branch=? AND date between ? and ?),firstname,lastname FROM employeeregistration where emp_id=? AND emp_type=?";
				 
			PreparedStatement stmt=conn.prepareStatement(query);
			stmt.setString(1, emp_id);
			stmt.setString(2, "Employee");
			stmt.setString(3, "in");
			stmt.setString(4, branch);
			stmt.setString(5, start);
			stmt.setString(6, end);
			stmt.setString(7, emp_id);
			stmt.setString(8, "Employee");
			
			ResultSet resultSet=stmt.executeQuery();

			while(resultSet.next()){
				empRegistration = new EmployeeRegistration();
				int salary=resultSet.getInt(1);
				int days=resultSet.getInt(2);
				System.out.println("days"+days);
				 monthsalary=salary*days;
				
			}
		}catch(SQLException sql){
			sql.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				conn.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
			System.out.println("getEmployeeProfile() closed");
		}
		return monthsalary;
	}	

/** this metod generates the salary of indivisual employeee of whole branch*/

public static List branchLabourSalary(String branch,String start,String end){
		
	 List<EmployeeRegistration> list = new ArrayList<EmployeeRegistration>();
		EmployeeRegistration empRegistration = null;
		System.out.println("camein branchfirst");
		System.out.println("branch"+branch);
		try{
			createMySQLConnection();
            String query="select emp_id,firstname,lastname,branch from employeeregistration where branch=? and emp_type=?";
			PreparedStatement stmt=conn.prepareStatement(query);
			stmt.setString(1,branch);
			stmt.setString(2,"Labour");
			ResultSet resultSet=stmt.executeQuery();

			while(resultSet.next()){
				System.out.println(resultSet.getString(1));
				int salary=calculateLabourSalary(resultSet.getString(1),start,end,branch);
				
				
				empRegistration = new EmployeeRegistration();
				
				empRegistration.setEmpID(resultSet.getString("emp_id"));
				empRegistration.setSalary(salary);
				empRegistration.setFirstName(resultSet.getString("firstname"));
				empRegistration.setLastName(resultSet.getString("lastname"));
				empRegistration.setBranch(resultSet.getString("branch"));
				
				
				list.add(empRegistration);
				
			}
		}catch(SQLException sql){
			sql.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				conn.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
			System.out.println("getEmployeeProfile() closed");
		}
		return list;
	}	

/* this method calculate the indivisual salary for branch*/

public static int calculateLabourSalary(String emp_id,String start,String end,String branch){
	System.out.println("labourgroup");
	int hours=0;
	int totalhours=0;
	int totalsalary=0;
	 List<EmployeeRegistration> list = new ArrayList<EmployeeRegistration>();
		EmployeeRegistration empRegistration = null;
		int monthsalary=0;
		try{
			
			createMySQLConnection();
			/*String query="SELECT salary,(SELECT COUNT(DISTINCT date) FROM dailyattendance WHERE ID=? AND type=? AND direction=? AND branch=? AND date between ? and ?),firstname,lastname FROM employeeregistration where emp_id=? AND emp_type=?";
				 
			PreparedStatement stmt=conn.prepareStatement(query);
			stmt.setString(1, emp_id);
			stmt.setString(2, "Labour");
			stmt.setString(3, "in");
			stmt.setString(4, branch);
			stmt.setString(5, start);
			stmt.setString(6, end);
			stmt.setString(7, emp_id);
			stmt.setString(8, "Labour");
			ResultSet resultSet=stmt.executeQuery();

			while(resultSet.next()){
				empRegistration = new EmployeeRegistration();
				int salary=resultSet.getInt(1);
				int days=resultSet.getInt(2);
				 monthsalary=salary*days;*/
			String query="SELECT MAX(time) AS LatestDate,MIN(time) AS MinPrice,firstname,lastname,branch,salary/24,date,ID FROM dailyattendance WHERE ID=? and date between ? and ? and branch=? and type=? group by date";
			 
			PreparedStatement stmt=conn.prepareStatement(query);
			stmt.setString(1, emp_id);
		    stmt.setString(2, start);
			stmt.setString(3, end);
			stmt.setString(4, branch);
			stmt.setString(5, "Labour");
			ResultSet resultSet=stmt.executeQuery();

			while(resultSet.next()){
				empRegistration = new EmployeeRegistration();
				String max=resultSet.getString(1);
				String min=resultSet.getString(2);
				String part[]=max.split(":");
				String part1[]=min.split(":");
				int maxhour=Integer.parseInt(part[0]);
				int minhour=Integer.parseInt(part1[0]);
				System.out.println("maxhour:"+maxhour);
				System.out.println("minhor:"+minhour);
				hours=maxhour-minhour;
				totalhours=totalhours+hours;
				totalsalary=resultSet.getInt(6)*totalhours;
				empRegistration.setFirstName(resultSet.getString(3));
				empRegistration.setLastName(resultSet.getString(4));
				empRegistration.setBranch(resultSet.getString(5));
				empRegistration.setDate(resultSet.getString(7));
				empRegistration.setSalary(totalsalary);
				empRegistration.setEmpID(resultSet.getString(8));
				
				
				
			}
			System.out.println("totalsalary:"+totalsalary);
			System.out.println("totalhours:"+totalhours);
			list.add(empRegistration);

				
			
		}catch(SQLException sql){
			sql.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				conn.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
			System.out.println("getEmployeeProfile() closed");
		}
		return totalsalary;
	}	
/**
 * This method is to store the daily attendance
 * @author kaushik udavant
 */

public static boolean storeDailyAttendance() {
	System.out.println("came1");
	ResultSet rst=null;
	
	String todaydate=SMSSending.getDate();
	
	String date=null;
	System.out.println("todaydate:"+todaydate);
	String UserId=null;
	int devicelogid=0;
	int deviceid=0;
	String direction=null;
	
	 List<EmployeeRegistration> employeeData=new ArrayList<EmployeeRegistration>();
	try{
        
		createMySQLConnection();
		
	   	    
		String query = "select DeviceLogId,DeviceId,UserId,LogDate,Direction from DeviceLogs where (substring(LogDate,1,10)=?) ";
		PreparedStatement prepareStatement=conn.prepareStatement(query);
		prepareStatement.setString(1, todaydate);
		
		rst=prepareStatement.executeQuery();
		if(rst!=null)
		{
		while(rst.next())
		{ 
			devicelogid=rst.getInt(1);
			deviceid=rst.getInt(2);
			UserId =rst.getString(3);
			date =rst.getString(4);
			direction =rst.getString(5);
			
			String[] parts = date.split(" ");
			String part1=parts[0];
			String part2=parts[1];
			
			System.out.println("part1"+part1);
			System.out.println(UserId);
			employeeData=DataRetrieve.getEmployeeProfile(UserId,deviceid);
			saveAttendance(employeeData,part1,part2,direction,devicelogid);
			 		
		}	 
		}  
		
		
	    	return true;
	    
		
	}catch(SQLException e){
		e.printStackTrace();
	}finally{
		/*try{
			conn.close();
			
			System.out.println("removeUser() successfully closed");
		}catch(SQLException e){
			e.printStackTrace();
		}*/
	}
	return false;	
}

/** Method to store attendance in dailyattendance table**/
public static boolean saveAttendance(List<EmployeeRegistration> empDailyAttendance,String date,String time,String direction,int devicelogid){
	System.out.println("came3");
	createMySQLConnection();
	String status="present";
	String s=String.valueOf(devicelogid);
	try{
		
		String query = "insert into dailyattendance(id,firstname,lastname,branch,devicelogid,date,type,status,email,time,direction,salary)values (?,?,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement prepareStatement=conn.prepareStatement(query);
		
		       
		for(EmployeeRegistration st : empDailyAttendance){
			 			
			    prepareStatement.setString(1, st.getEmpID());
				prepareStatement.setString(2, st.getFirstName());
				prepareStatement.setString(3, st.getLastName());
				prepareStatement.setString(4, st.getBranch());
				prepareStatement.setString(5, s);
				prepareStatement.setString(6, date);
				prepareStatement.setString(7, st.getType() );
				prepareStatement.setString(8, status);
				prepareStatement.setString(9, st.getEmail() );
				prepareStatement.setString(10, time );
				prepareStatement.setString(11, direction );
				prepareStatement.setInt(12, st.getSalary() );
				
			 
		  }
		 
			
		prepareStatement.executeUpdate();
		
		System.out.println("Information Store in student"
				+ "DailyAttendanceTable table");
		return true;
	}catch(SQLException e){
		e.printStackTrace();
	}/*finally{
		try{
			conn.close();
			System.out.println("empDailyAttendance() successfully closed");
		}catch(SQLException e){
			e.printStackTrace();
		}
	}*/
	return false;
}

/*method to find employees in and out time who are working in both the branches*/

public static List getEmployeeDetailsOfinandout(){
	System.out.println("inout");
   String date=SMSSending.getDate();	
	
    DailyAttendance empAttendance = null;	
	List<DailyAttendance> EmployeeAttendanceList=new ArrayList<DailyAttendance>();
	List<String> userid=call(date);
	
	try{
		createMySQLConnection();
		for(String obj:userid)
		{
		String query="select * from dailyattendance where ID=? AND date=?";
		PreparedStatement stmt=conn.prepareStatement(query);
		stmt.setString(1,obj);
		stmt.setString(2,date);
	
		ResultSet resultSet=stmt.executeQuery();

		while(resultSet.next()){
			empAttendance = new DailyAttendance();
			empAttendance.setBranch(resultSet.getString("branch"));
			empAttendance.setEmpID(resultSet.getString("ID"));
			empAttendance.setFirstName(resultSet.getString("firstname"));
			empAttendance.setLastName(resultSet.getString("lastname"));
			empAttendance.setCurrentdate(resultSet.getString("date"));
			empAttendance.setStatus(resultSet.getString("status"));
			empAttendance.setTime(resultSet.getString("time"));
			empAttendance.setDirection(resultSet.getString("direction"));
			
			String branch1=resultSet.getString("branch");
			
			
			
		
			EmployeeAttendanceList.add(empAttendance);
			System.out.println("function");
		}
		}
	}catch(SQLException sql){
		sql.printStackTrace();
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		try{
			conn.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		System.out.println("getEmployeeProfile() closed");
	}
	return EmployeeAttendanceList;
}	
/*the call method to get the userid of employees who are worked at two branches on the same day */

    public static List call(String date){
	System.out.println(date);
	List<String> list=new ArrayList<String>();
	
	try{
		
		createMySQLConnection();
		String query="select ID from dailyattendance where date=? and direction =?";
		PreparedStatement stmt=conn.prepareStatement(query);
	    stmt.setString(1,date);
	    stmt.setString(2,"out");
		ResultSet resultSet=stmt.executeQuery();

		while(resultSet.next()){
			
			list.add(resultSet.getString("ID"));
		
		
			System.out.println("qwertyu");
		}
	}catch(SQLException sql){
		sql.printStackTrace();
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		try{
			conn.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		System.out.println("getEmployeeProfile() closed");
	}
	return list;
}	

    /**
     * This method is used to get absent list using branch identifier.
     * @author Kaushik Udavant
     * @param branchDetails - identifier of the branch which details are required.
     * @return {@link BatchDetails} - if exist or return null.
     */

    public static List getAbsentListAtTen(String date){
    	EmployeeRegistration attendancedetails = null;
    	List<EmployeeRegistration> attendanceList=new ArrayList<EmployeeRegistration>();
    	    	
    	try{
    		
    		createMySQLConnection();
    		String query="SELECT * FROM employeeregistration WHERE emp_type=? and emp_id NOT IN ( SELECT emp_id FROM dailyattendance where type=? and date=?)";
    		
    		PreparedStatement stmt=conn.prepareStatement(query);
    		
    		stmt.setString(1,"Employee");
    		stmt.setString(2,"Employee");
    		stmt.setString(3,date);
    	
    		ResultSet resultSet=stmt.executeQuery();
    		
    		while(resultSet.next()){
    			attendancedetails = new EmployeeRegistration();
    			attendancedetails.setEmpID(resultSet.getString("emp_id"));
    			attendancedetails.setFirstName(resultSet.getString("firstname"));
    			attendancedetails.setBranch(resultSet.getString("branch"));
    			    							
    			attendanceList.add(attendancedetails);
    		}
    		
    		System.out.println("DataRetrieve Successfully");
    	}catch(SQLException sql){
    		sql.printStackTrace();
    	}catch(Exception e){
    		e.printStackTrace();
    	}finally{
    		try{
    			conn.close();
    		}catch(SQLException e){
    			e.printStackTrace();
    		}
    		System.out.println("getBatchchDetails() closed");
    	}
    	
    	    	return attendanceList;
    	}
    	
    /**
     * This method is used to get absent list using branch identifier.
     * @author Kaushik Udavant
     * @param branchDetails - identifier of the branch which details are required.
     * @return {@link BatchDetails} - if exist or return null.
     */

    public static List getAbsentListAtTwelve(String date){
    	
    	date="2018-01-13";
    	DailyAttendance attendancedetails = null;
    	List<DailyAttendance> attendanceList=new ArrayList<DailyAttendance>();
    	    	
    	try{
    		
    		createMySQLConnection();
    		String query="SELECT * from dailyattendance where date=? AND type=? AND substring(time,1,5)>?";
    		
    		PreparedStatement stmt=conn.prepareStatement(query);
    		
    		stmt.setString(1,date);
    		stmt.setString(2,"Employee");
    		stmt.setString(3,"10:30");
    	
    		ResultSet resultSet=stmt.executeQuery();
    		
    		while(resultSet.next()){
    			attendancedetails = new DailyAttendance();
    			attendancedetails.setEmpID(resultSet.getString("ID"));
    			attendancedetails.setFirstName(resultSet.getString("firstname"));
    			attendancedetails.setBranch(resultSet.getString("branch"));
    			attendancedetails.setTime(resultSet.getString("time"));
    			    							
    			attendanceList.add(attendancedetails);
    		}
    		
    		System.out.println("DataRetrieve Successfully");
    	}catch(SQLException sql){
    		sql.printStackTrace();
    	}catch(Exception e){
    		e.printStackTrace();
    	}finally{
    		try{
    			conn.close();
    		}catch(SQLException e){
    			e.printStackTrace();
    		}
    		System.out.println("getBatchchDetails() closed");
    	}
    	
    	    	return attendanceList;
    	}

    
    /* This method is for geting employee who is having his birthday*/
    
    public static List getBirthdayEmployee(){
		String date=SMSSending.getDate();
		List<EmployeeRegistration> allEmployeeList=new ArrayList<EmployeeRegistration>();
		EmployeeRegistration empRegistration = null;
		date="2018-01-13";
		try{
			createMySQLConnection();
			String query="select * from employeeregistration where emp_type=? and dob=?";
			PreparedStatement stmt=conn.prepareStatement(query);
			stmt.setString(1,"Employee");
			stmt.setString(2,date);
			
			
			ResultSet resultSet=stmt.executeQuery();

			while(resultSet.next()){
				empRegistration = new EmployeeRegistration();
				
				
				empRegistration.setEmpID(resultSet.getString("emp_id"));
				empRegistration.setFirstName(resultSet.getString("firstname"));
				empRegistration.setLastName(resultSet.getString("lastname"));
				empRegistration.setBranch(resultSet.getString("branch"));
				allEmployeeList.add(empRegistration);
			}
		}catch(SQLException sql){
			sql.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				conn.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
			System.out.println("getEmployeeProfile() closed");
		}
		return allEmployeeList;
	}	
	
    
    
    /**
	 * This method delete existing user list.
	 * @author kaushik udavant
	 */
	public static boolean removeAllLabourBranch(String id) {
		
		try{
			
			
			createMySQLConnection();
			
			String query = "DELETE branchdetails,employeeregistration FROM branchdetails INNER JOIN employeeregistration WHERE branchdetails.branch_name =? and employeeregistration.branch=?";
			PreparedStatement prepareStatement=conn.prepareStatement(query);

			prepareStatement.setString(1, id);
			prepareStatement.setString(2, id);
			prepareStatement.executeUpdate();
			System.out.println("Product has deleted from addtocart");
			return true;
		}catch(SQLException e){
			//e.printStackTrace();
		}finally{
			try{
				conn.close();
				//System.out.println("removeUser() successfully closed");
			}catch(SQLException e){
				//e.printStackTrace();
			}
		}
		return false;
		
	}
    
	/**
	 * This method is used to get user detail using user identifier.
	 * @author Kaushik Udavant
	 * @param userId - identifier of the user who's detail is required.
	 * @return {@link EmployeeRegistration} - if exist or return null.
	 */
	public static List getEmployeeProfileEdit(String empid,String branch){
		System.out.println("came"+empid);
		List<EmployeeRegistration> allEmployeeList=new ArrayList<EmployeeRegistration>();
		EmployeeRegistration empRegistration = null;
		try{
			createMySQLConnection();
			String query="select * from employeeregistration where emp_id=? and branch=? and emp_type=?";
			PreparedStatement stmt=conn.prepareStatement(query);
			stmt.setString(1,empid);
			stmt.setString(2,branch);
			stmt.setString(3,"Employee");
			
			ResultSet resultSet=stmt.executeQuery();

			while(resultSet.next()){
				empRegistration = new EmployeeRegistration();
				
				empRegistration.setType(resultSet.getString("emp_type"));
				empRegistration.setEmpID(resultSet.getString("emp_id"));
				
				empRegistration.setFirstName(resultSet.getString("firstname"));
				empRegistration.setLastName(resultSet.getString("lastname"));
				empRegistration.setCountryCode(resultSet.getString("country_code"));
				empRegistration.setMobileNumber(resultSet.getString("mobile_number"));
				
				empRegistration.setEmail(resultSet.getString("email"));
				empRegistration.setQualification(resultSet.getString("qualification"));
				empRegistration.setDesignation(resultSet.getString("designation"));
				empRegistration.setBranch(resultSet.getString("branch"));
				empRegistration.setSalary(resultSet.getInt("salary"));
				empRegistration.setPicture(resultSet.getString("photo"));
				empRegistration.setDocument(resultSet.getString("document"));
				
				allEmployeeList.add(empRegistration);
			}
		}catch(SQLException sql){
			sql.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				conn.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
			System.out.println("getEmployeeProfile() closed");
		}
		return allEmployeeList;
	}
	
	/**
	 * This method is used to get user detail using user identifier.
	 * @author Kaushik Udavant
	 * @param userId - identifier of the user who's detail is required.
	 * @return {@link EmployeeRegistration} - if exist or return null.
	 */
	public static List getLabourProfileEdit(String empid,String branch){
		System.out.println("came"+empid);
		List<EmployeeRegistration> allEmployeeList=new ArrayList<EmployeeRegistration>();
		EmployeeRegistration empRegistration = null;
		try{
			createMySQLConnection();
			String query="select * from employeeregistration where emp_id=? and branch=? and emp_type=?";
			PreparedStatement stmt=conn.prepareStatement(query);
			stmt.setString(1,empid);
			stmt.setString(2,branch);
			stmt.setString(3,"Labour");
			
			ResultSet resultSet=stmt.executeQuery();

			while(resultSet.next()){
				empRegistration = new EmployeeRegistration();
				
				empRegistration.setType(resultSet.getString("emp_type"));
				empRegistration.setEmpID(resultSet.getString("emp_id"));
				
				empRegistration.setFirstName(resultSet.getString("firstname"));
				empRegistration.setLastName(resultSet.getString("lastname"));
				empRegistration.setCountryCode(resultSet.getString("country_code"));
				empRegistration.setMobileNumber(resultSet.getString("mobile_number"));
				
				empRegistration.setTol(resultSet.getString("typeoflab"));
				
				empRegistration.setSalary(resultSet.getInt("salary"));
				empRegistration.setPicture(resultSet.getString("photo"));
				empRegistration.setDocument(resultSet.getString("document"));
				
				allEmployeeList.add(empRegistration);
			}
		}catch(SQLException sql){
			sql.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				conn.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
			System.out.println("getEmployeeProfile() closed");
		}
		return allEmployeeList;
	}	


	/**
	 * This method update existing user list.
	 * @author kaushik udavant
	 */
	public static boolean editLabour(String id,String firstname,String lastname,String mobile_number,String tol,String salary,String picture,String document,String branch) {
		
		try{
			String photo="\\"+picture;
			String doc="\\"+document;
			createMySQLConnection();
			
		    System.out.println(id);
			String query = "update employeeregistration SET firstname=?,lastname=?,mobile_number=?,typeoflab=?,salary=?,photo=?,document=? where emp_id=? and branch=? and emp_type=?";
			PreparedStatement prepareStatement=conn.prepareStatement(query);

			
			prepareStatement.setString(1, firstname);
			prepareStatement.setString(2, lastname);
			prepareStatement.setString(3, mobile_number);
			prepareStatement.setString(4, tol);
			prepareStatement.setString(5, salary);
			prepareStatement.setString(6, photo);
			prepareStatement.setString(7,doc);
			
			prepareStatement.setString(8, id);
			prepareStatement.setString(9, branch);
			prepareStatement.setString(10, "Labour");
			
			prepareStatement.executeUpdate();
			System.out.println("Details Edited");
			return true;
		}catch(SQLException e){
			//e.printStackTrace();
		}finally{
			try{
				conn.close();
				//System.out.println("removeUser() successfully closed");
			}catch(SQLException e){
				//e.printStackTrace();
			}
		}
		return false;
		
	}
	
	

}

