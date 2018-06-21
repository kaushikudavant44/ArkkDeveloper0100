package com.bionische.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import com.bionische.database.DatabaseConfiguration;
import com.bionische.database.CreateDatabase;

public class CreateDatabase {

	/** This variable hold the connection with database */
	private Connection conn;
	
	/** Default user configuration */
	private final static String OWNER_ACCOUNT_DETAIL = "insert into employeeregistration(emp_type,emp_id,initial,firstname,lastname,country_code,mobile_number,gender,email,qualification,designation,branch,salary,logInID,password,photo,fingerprint) values ('001','admin','Mr','Kaushik','Udavant','91','9823875548','male','kaushikudavant@gmail.com','BE','Java Developer','Bionische','500000','kaushik','12345678','hi','fdfd')";
	
	/**
	 * TODO
	 */
	public CreateDatabase() {	
	} 

	/**
	 * TODO return true only when successful.
	 * This method will load the MySQL driver's and get connection with database.
	 * @return
	 */
	private boolean createMySQLConnection()
	{
		try {
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("Drivers are loaded");
			conn=DriverManager.getConnection("jdbc:mysql://"+DatabaseConfiguration.HOST_NAME+"/"+DatabaseConfiguration.DATABASE_NAME+"?useUnicode=true&characterEncoding=utf-8",DatabaseConfiguration.USERNAME,DatabaseConfiguration.PASSWORD);
			System.out.println("Connection is successfully with database.");
			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return true;
	}
	
	/**
	 * This will create Employee details table.
	 * @return true - if table successfully created else return false.
	 */
	private boolean createEmployeeDetailTable() {
		createMySQLConnection();
		try {
			Statement stmt = conn.createStatement();
			String query = "create table employeeregistration(ID integer  not null primary key,emp_type varchar(60) unique not null,emp_id varchar(500) unique not null,initial varchar(10) not null,firstname varchar(200) not null,lastname varchar(200),country_code varchar(20) not null,mobile_number varchar(10) not null,gender varchar(10) not null,email varchar(100) unique ,qualification varchar(100) not null,designation varchar(100) not null,branch varchar(100) not null,salary varchar(100) not null,logInID varchar(100),password varchar(20),photo varchar(100),fingerprint varchar(100) unique not null)";
			stmt.executeUpdate(query);
			stmt.executeUpdate(OWNER_ACCOUNT_DETAIL);
			System.out.println("Employee detail table successfully created.");
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				conn.close();
				System.out.println("createEmployeeDetailTable() closed");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}
	
	/**
	 * TODO
	 * @return true - if table successfully created else return false.
	 */
	private boolean createDailyAttendanceTable() {
		createMySQLConnection();
		try {
			Statement stmt = conn.createStatement();
			String query = "create table dailyattendance(emp_id varchar(100) not null primary key,firstname varchar(100) not null,lastname varchar(100) not null,branch varchar(100) not null,date varchar(50) not null,status varchar(50) not null,time_spent varchar(100) not null,in_time varchar(100) not null,out_time varchar(100) not null)";
			stmt.executeUpdate(query);
			System.out.println("Create daily attendance table successfully created.");
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				conn.close();
				System.out.println("createDailyAttendanceTable() closed");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}


	/**
	 * TODO
	 * @return true - if table successfully created else return false.
	 */
	private boolean createBrancheDetailTable() {
		createMySQLConnection();
		try {
			Statement stmt = conn.createStatement();
			String query = "create table branchdetails(ID integer AUTO_INCREMENT not null primary key,branch_name varchar(50) not null,branch_address varchar(50) not null,branch_city varchar(100) not null,branch_country varchar(100) not null,branch_state varchar(100) not null,branch_pincode varchar(100) not null,branch_contact varchar(100) not null,date varchar(20) not null)";
			stmt.executeUpdate(query);
			System.out.println("Create Branch Detail Table table successfully created.");
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				conn.close();
				System.out.println("createBrancheDetailTable() closed");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}

	
	
	/**
	 * This will create all initial tasks.
	 */
	public void init() {
		createEmployeeDetailTable();
		createDailyAttendanceTable();
		createBrancheDetailTable();
	}
	
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		new CreateDatabase().init();
	}	
}
