

package com.bionische.database;

import java.sql.Timestamp;
import java.util.Date;
import java.util.Enumeration;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.bionische.bean.BranchDetails;
import com.bionische.bean.DailyAttendance;
import com.bionische.bean.EmployeeRegistration;
import com.bionische.mail.SMSSending;

public class DataSave  {
	static int i=0;
	/**
	 * This variable used to create connection with database.
	 */
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
	 * This method will store the employee details in table.
	 * This method return the true or false value.
	 * @return
	 * @author Kaushik Udavant
	 */
	public static boolean setEmployeeProfileDetails(EmployeeRegistration empRegistration){
		createMySQLConnection();
		try{
			int salary=empRegistration.getSalary();
			String pic=empRegistration.getPicture();
			System.out.println(":"+pic);
			int dailysalary=salary/30;
           
			String photo="\\"+empRegistration.getPicture();
			String doc="\\"+empRegistration.getDocument();

			String query = "insert into employeeregistration(emp_id,emp_type,initial,firstname,lastname,country_code,mobile_number,gender,email,qualification,designation,branch,deviceid,salary,dailysalary,photo,document,dob,typeoflab) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement prepareStatement=conn.prepareStatement(query);
			
			prepareStatement.setString(1,empRegistration.getEmpID());
			prepareStatement.setString(2,empRegistration.getType());
			prepareStatement.setString(3,empRegistration.getInitial());
			prepareStatement.setString(4,empRegistration.getFirstName());
			prepareStatement.setString(5,empRegistration.getLastName());
			prepareStatement.setString(6,empRegistration.getCountryCode());
			prepareStatement.setString(7,empRegistration.getMobileNumber());
			prepareStatement.setString(8,empRegistration.getGender());
			prepareStatement.setString(9,empRegistration.getEmail());
			prepareStatement.setString(10,empRegistration.getQualification());
			prepareStatement.setString(11,empRegistration.getDesignation());
			prepareStatement.setString(12,empRegistration.getBranch());
			prepareStatement.setInt(13,empRegistration.getDeviceid());
			prepareStatement.setInt(14,empRegistration.getSalary());
			prepareStatement.setInt(15,dailysalary);
			prepareStatement.setString(16,photo);
			prepareStatement.setString(17,doc);
			prepareStatement.setString(18,empRegistration.getDob());
			prepareStatement.setString(19,empRegistration.getTol());
			
			
			
			prepareStatement.executeUpdate();
			
			System.out.println("Information Store in employeeRegistration table");
			return true;
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			try{
				conn.close();
				System.out.println("setUserProfileDetails() successfully closed");
			}catch(SQLException e){
				e.printStackTrace();
			}
		}

		return false;
	}
	/*
	*//**
	 * 
	 * @param empRegistration
	 * @param empDailyAttendance
	 * @return
	 *//*
	public static boolean empDailyAttendance(EmployeeRegistration empRegistration, DailyAttendance empDailyAttendance){
		
		createMySQLConnection();
		try{


			String query = "insert into employeeDailyAttendance(name,firmName,current_date,presentStatus,salary)values (?,?,?,?,?)";
			PreparedStatement prepareStatement=conn.prepareStatement(query);
			
		//	prepareStatement.setString(1, empRegistration.getEmpName());
		//	prepareStatement.setString(2, empRegistration.getFirmName());
			prepareStatement.setString(3, empDailyAttendance.getCurrentDate());
			prepareStatement.setString(4, empDailyAttendance.getPresentDays());
			prepareStatement.setString(5, empDailyAttendance.getInTime());
			prepareStatement.setString(6, empDailyAttendance.getOutTime());
			prepareStatement.setString(7, empDailyAttendance.getEmpSalary());
			
			prepareStatement.executeUpdate();
			
			System.out.println("Information Store in employeeDailyAttendanceTable table");
			return true;
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			try{
				conn.close();
				System.out.println("empDailyAttendance() successfully closed");
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return false;
	}
	*/
	/**
	 * 
	 * @param empRegistration
	 * @param empDailyAttendance
	 * @return
	 */
	public static boolean empDailyAttendance(DailyAttendance empDailyAttendance){
		
		createMySQLConnection();
		try{
    
			String date=SMSSending.getDate();
             String time=SMSSending.getTime();
             String logdate=date+" "+time;
           
         /*    i++;
             String devicelogid="a"+i;*/
			/*String query = "insert into dailyattendance(id,firstname,lastname,branch,date,type,direction,email,time,devicelogid)values (?,?,?,?,?,?,?,?,?,?)";*/
             String query = "insert into DeviceLogs(DeviceId,UserId,LogDate,Direction)values(?,?,?,?)";
			PreparedStatement prepareStatement=conn.prepareStatement(query);
			
			prepareStatement.setInt(1, empDailyAttendance.getDeviceid());
			prepareStatement.setString(2, empDailyAttendance.getEmpID());
			prepareStatement.setString(3,logdate);
			prepareStatement.setString(4, empDailyAttendance.getDirection());
			
			
			prepareStatement.executeUpdate();
			
			System.out.println("Information Store in employeeDailyAttendanceTable table");
			return true;
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			try{
				conn.close();
				System.out.println("empDailyAttendance() successfully closed");
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return false;
	}
	
	/**
	 * 
	 * Storing labour manual attendance
	 */
	public static boolean labDailyAttendance(DailyAttendance empDailyAttendance){
		
		createMySQLConnection();
		try{
    
			String date=SMSSending.getDate();
             String time=SMSSending.getTime();
             String logdate=date+" "+time;
           
         /*    i++;
             String devicelogid="a"+i;*/
			/*String query = "insert into dailyattendance(id,firstname,lastname,branch,date,type,direction,email,time,devicelogid)values (?,?,?,?,?,?,?,?,?,?)";*/
             String query = "insert into DeviceLogs(DeviceId,UserId,LogDate,Direction)values(?,?,?,?)";
			PreparedStatement prepareStatement=conn.prepareStatement(query);
			
			prepareStatement.setInt(1, empDailyAttendance.getDeviceid());
			prepareStatement.setString(2, empDailyAttendance.getEmpID());
			prepareStatement.setString(3,logdate);
			prepareStatement.setString(4, empDailyAttendance.getDirection());
			
			
			prepareStatement.executeUpdate();
			
			System.out.println("Information Store in employeeDailyAttendanceTable table");
			return true;
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			try{
				conn.close();
				System.out.println("empDailyAttendance() successfully closed");
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return false;
	}





	/**
	 * This method will store the employee details in table.
	 * This method return the true or false value.
	 * @return
	 * @author Kaushik Udavant
	 */
	public static boolean setBranchDetails(BranchDetails branchDetails){
		createMySQLConnection();
		try{

			Timestamp timestamp = new Timestamp(new Date().getTime());
			String query = "insert into branchdetails(branch_name,branch_city,branch_state,branch_country,branch_pincode,branch_contact,branch_address,date,branchtype) values (?,?,?,?,?,?,?,?,?)";
			PreparedStatement prepareStatement=conn.prepareStatement(query);
			prepareStatement.setString(1,branchDetails.getBranchName());
			prepareStatement.setString(2,branchDetails.getCity());
			prepareStatement.setString(3,branchDetails.getState());
			prepareStatement.setString(4,branchDetails.getCountry());
			prepareStatement.setInt(5,branchDetails.getPincode());
			prepareStatement.setString(6,branchDetails.getContactNumber());
			prepareStatement.setString(7,branchDetails.getAddress());
			prepareStatement.setString(8,branchDetails.getDate());
			prepareStatement.setString(9, branchDetails.getBranchtype());		
			prepareStatement.executeUpdate();
			
			System.out.println("Information Store in branch-details table");
			return true;
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			try{
				conn.close();
				System.out.println("setBranchDetails() successfully closed");
			}catch(SQLException e){
				e.printStackTrace();
			}
		}

		return false;
	}
 
	/*This method stores all employees in dailyattendance as present*/
public static boolean allarepresent(){
	List<EmployeeRegistration> allEmployeeList=new ArrayList<EmployeeRegistration>();
	EmployeeRegistration empRegistration = null;
		createMySQLConnection();
		try{
             String status="present";
             String date=SMSSending.getDate();
			String query = "select * from employeeregistration where emp_type=?";
			PreparedStatement prepareStatement=conn.prepareStatement(query);
			prepareStatement.setString(1, "employee");
			
			ResultSet resultSet=prepareStatement.executeQuery();

			while(resultSet.next()){
				empRegistration = new EmployeeRegistration();
				empRegistration.setEmpID(resultSet.getString("emp_id"));
				empRegistration.setFirstName(resultSet.getString("firstname"));
				empRegistration.setLastName(resultSet.getString("lastname"));
				empRegistration.setType(resultSet.getString("emp_type"));
				empRegistration.setBranch(resultSet.getString("branch"));
				empRegistration.setEmail(resultSet.getString("email"));
				
				
				
				
				allEmployeePresent(empRegistration);
			}
			
			System.out.println("Information Store in employeeDailyAttendanceTable table");
			return true;
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			try{
				conn.close();
				System.out.println("empDailyAttendance() successfully closed");
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return false;
	}

	/*This method stores employees in daily attendance table*/

public static boolean allEmployeePresent(EmployeeRegistration empDailyAttendance){
	
	createMySQLConnection();
	try{
         String status="present";
         String date=SMSSending.getDate();
		String query = "insert into dailyattendance(id,firstname,lastname,branch,date,type,status,email)values (?,?,?,?,?,?,?,?)";
		PreparedStatement prepareStatement=conn.prepareStatement(query);
		
		prepareStatement.setString(1, empDailyAttendance.getEmpID());
		prepareStatement.setString(2, empDailyAttendance.getFirstName());
		prepareStatement.setString(3, empDailyAttendance.getLastName());
		prepareStatement.setString(4, empDailyAttendance.getBranch());
		prepareStatement.setString(5, date);
		prepareStatement.setString(6, empDailyAttendance.getType() );
		prepareStatement.setString(7, status);
		prepareStatement.setString(8, empDailyAttendance.getEmail() );
		
		prepareStatement.executeUpdate();
		
		System.out.println("Information Store in employeeDailyAttendanceTable table");
		return true;
	}catch(SQLException e){
		e.printStackTrace();
	}finally{
		try{
			conn.close();
			System.out.println("empDailyAttendance() successfully closed");
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
	return false;
}
/**
 * This method will store the employee details in table.
 * This method return the true or false value.
 * @return
 * @author Kaushik Udavant
 */
public static boolean updatebatch(BranchDetails batchDetails,String batchname){
	createMySQLConnection();
	try{
		
		String query = "update branchdetails set branch_address=?,branch_contact=? where branch_name=?";
		PreparedStatement prepareStatement=conn.prepareStatement(query);
		prepareStatement.setString(1,batchDetails.getAddress());
		prepareStatement.setString(2,batchDetails.getContactNumber());
		prepareStatement.setString(3,batchname);
	    prepareStatement.executeUpdate();
		
		System.out.println("Information Store in branch-details table");
		return true;
	}catch(SQLException e){
		e.printStackTrace();
	}finally{
		try{
			conn.close();
			System.out.println("setBranchDetails() successfully closed");
		}catch(SQLException e){
			e.printStackTrace();
		}
	}

	return false;
}
/**
 * 
 * @param empRegistration
 * @param empDailyAttendance
 * @return
 */
public static boolean allEmpDailyAttendance(){
	
	createMySQLConnection();
	try{
		
		 
         String direction="in";
         String date=SMSSending.getDate();
         String time=SMSSending.getTime();
         String logdate=date+" "+time;
         List<EmployeeRegistration> allEmployeeList=DataRetrieve.getEmployeeProfile("employee");
         for(EmployeeRegistration empRegistration : allEmployeeList){
        	 
         System.out.println("employees:"+empRegistration.getEmpID());	 
        
         String query = "insert into DeviceLogs(DeviceId,UserId,LogDate,Direction)values(?,?,?,?)";
			PreparedStatement prepareStatement=conn.prepareStatement(query);
			
			prepareStatement.setInt(1, empRegistration.getDeviceid());
			prepareStatement.setString(2, empRegistration.getEmpID());
			prepareStatement.setString(3,logdate);
			prepareStatement.setString(4,direction);
		
		prepareStatement.executeUpdate();
         }
		System.out.println("Information Store in employeeDailyAttendanceTable table");
		return true;
	}catch(SQLException e){
		e.printStackTrace();
	}finally{
		try{
			conn.close();
			System.out.println("empDailyAttendance() successfully closed");
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
	return false;
}


	
	
}
