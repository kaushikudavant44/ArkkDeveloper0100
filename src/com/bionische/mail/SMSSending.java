package com.bionische.mail;

import static java.time.DayOfWeek.MONDAY;
import static java.time.DayOfWeek.SUNDAY;
import static java.time.temporal.TemporalAdjusters.nextOrSame;
import static java.time.temporal.TemporalAdjusters.previousOrSame;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Calendar;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;
import java.util.Properties;
import java.util.Timer;
import java.util.TimerTask;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.TimeUnit;

import com.bionische.bean.DailyAttendance;
import com.bionische.bean.EmployeeRegistration;
import com.bionische.database.DataRetrieve;
import com.bionische.database.ScheduledTaskExample;
import com.teknikindustries.bulksms.SMS;


public class SMSSending {
	
	private final static ScheduledExecutorService scheduler = Executors
	        .newScheduledThreadPool(1);
	
	/**
	 * This is sender mobile number.
	 */
	public static String SENDER_USERNAME;
	
	/**
	 * This is sender mobile number.
	 */
	public static String RECIEVER_MOBILE_NUMBER;
	/**
	 * This is receiver mobile no.
	 */
	public static String SENDER_PASSWORD;
	
	/**
	 * at this time the message will be sent.
	 */
	public static String FIRST_TIME;
	
	public static String SECOND_TIME;
	
	public static String BIRTHDAY_TIME;
	
	/**
	 * This method is created to make changes in database configuration file.
	 * When changes done in DatabaseConfig.properties file it automatically changes in application.
	 * @author Kaushik Udavant
	 */
	public static void databaseConfiguration() {
		try {
			String filePath="com/bionische/mail/SmsConfig.properties";
			
			//File file=new File(filePath);
			
			InputStream fileInput= SMSSending.class.getClassLoader().getResourceAsStream(filePath);
			
			Properties properties=new Properties();
			
			properties.load(fileInput);
			
			fileInput.close();
			
			Enumeration enumkeys=properties.keys();
			
			//This is a message key and value
			final String smsKey= (String) enumkeys.nextElement();
			SENDER_PASSWORD=properties.getProperty(smsKey);
			System.out.println("sms:"+smsKey+"="+SENDER_PASSWORD);
			
			/** Host system address on which the database is present*/
			final String second_time= (String) enumkeys.nextElement();
			SECOND_TIME=properties.getProperty(second_time);
			System.out.println("secondtime:"+second_time+"="+SECOND_TIME);
			

			/** Host system address on which the database is present*/
			final String reciever_mobile_number= (String) enumkeys.nextElement();
			RECIEVER_MOBILE_NUMBER=properties.getProperty(reciever_mobile_number);
			System.out.println("reciever_mobile_number:"+reciever_mobile_number+"="+RECIEVER_MOBILE_NUMBER);
				
			/** Host system address on which the database is present*/
			final String birthday_time= (String) enumkeys.nextElement();
			BIRTHDAY_TIME=properties.getProperty(birthday_time);
			System.out.println("birthdaytime:"+birthday_time+"="+BIRTHDAY_TIME);
		
			/** Host system address on which the database is present*/
			final String first_time= (String) enumkeys.nextElement();
			FIRST_TIME=properties.getProperty(first_time);
			System.out.println("firsttime:"+first_time+"="+FIRST_TIME);
			
			
						
			/** Host system address on which the database is present*/
			final String sender_username= (String) enumkeys.nextElement();
			System.out.println(sender_username);
			SENDER_USERNAME=properties.getProperty(sender_username);
			System.out.println("sender_mobilenumber:"+sender_username+"="+SENDER_USERNAME);
			
			
			} catch (FileNotFoundException e) {
				// Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// Auto-generated catch block
				e.printStackTrace();
			}

	}

	
	public static String getDate()
	{
		Date today=new Date();
		SimpleDateFormat dateformat=new SimpleDateFormat("yyyy-MM-dd");
		System.out.println(dateformat.format(today));
		return dateformat.format(today);
		
	}

	public static String getTime() {
        Calendar cal = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
       return sdf.format(cal.getTime()) ;
    }
	
	public static String getWeekDate() 
	{
		LocalDate today = LocalDate.now();

	    LocalDate monday = today.with(previousOrSame(MONDAY));
	    LocalDate sunday = today.with(nextOrSame(SUNDAY));

	    System.out.println("Today: " + today);
	    System.out.println("Monday of the Week: " + monday);
	    System.out.println("Sunday of the Week: " + sunday);
	    
	    return monday+" "+sunday;
		
	}
	
	public static boolean sendAtten()
	{   
		databaseConfiguration();
		String sms=" ";
		String date=getDate();
		List<EmployeeRegistration> indivisualDetail=DataRetrieve.getAbsentListAtTen(date);
		for(EmployeeRegistration indivisualReport : indivisualDetail){
			
			String lsp = System.getProperty("line.separator");
			sms=indivisualReport.getFirstName()+" "+indivisualReport.getEmpID()+" "+indivisualReport.getBranch()+lsp+sms;
			
		}
		
		String sResult = null;
		try 
		{
		System.out.println(SENDER_USERNAME);
		System.out.println(SENDER_PASSWORD);
		
		
		String data="user=" + URLEncoder.encode(SENDER_USERNAME, "UTF-8");
		data +="&password=" + URLEncoder.encode(SENDER_PASSWORD, "UTF-8");
		data +="&message=" + URLEncoder.encode(sms, "UTF-8");
		data +="&sender=" + URLEncoder.encode("Testid", "UTF-8");
		data +="&mobile=" + URLEncoder.encode(RECIEVER_MOBILE_NUMBER, "UTF-8");
		data +="&type=" + URLEncoder.encode("3", "UTF-8");
		URL url = new URL("https://login.bulksmsgateway.in/sendmessage.php?"+data);
		URLConnection conn = url.openConnection();
		conn.setDoOutput(true);
		OutputStreamWriter wr = new OutputStreamWriter(conn.getOutputStream());
		wr.write(data);
		wr.flush();
		// Get the response
		BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		String line;
		String sResult1="";
		while ((line = rd.readLine()) != null) 
		{
		// Process line...
		sResult1=sResult1+line+" ";
		}
		wr.close();
		rd.close();
		return true;
		} 
		catch (Exception e)
		{
		System.out.println("Error SMS "+e);
		return false;
		}

		
	}
	
	public static boolean sendAtTwelve()
	{   
		databaseConfiguration();
		String sms1=" ";
		String date=getDate();
		List<DailyAttendance> indivisualDetail=DataRetrieve.getAbsentListAtTwelve(date);
		for(DailyAttendance indivisualReport : indivisualDetail)
		{ 
			System.out.println("emplid:"+indivisualReport.getEmpID());
     		String lsp = System.getProperty("line.separator");
	    	sms1=indivisualReport.getFirstName()+" "+indivisualReport.getTime()+","+sms1;
	    	System.out.println("status:"+indivisualReport.getEmpID());
			
		}
		String sResult = null;
		try 
		{
		System.out.println(SENDER_USERNAME);
		System.out.println(SENDER_PASSWORD);
		
		
		String data="user=" + URLEncoder.encode(SENDER_USERNAME, "UTF-8");
		data +="&password=" + URLEncoder.encode(SENDER_PASSWORD, "UTF-8");
		data +="&message=" + URLEncoder.encode(sms1, "UTF-8");
		data +="&sender=" + URLEncoder.encode("Testid", "UTF-8");
		data +="&mobile=" + URLEncoder.encode(RECIEVER_MOBILE_NUMBER, "UTF-8");
		data +="&type=" + URLEncoder.encode("3", "UTF-8");
		URL url = new URL("https://login.bulksmsgateway.in/sendmessage.php?"+data);
		URLConnection conn = url.openConnection();
		conn.setDoOutput(true);
		OutputStreamWriter wr = new OutputStreamWriter(conn.getOutputStream());
		wr.write(data);
		wr.flush();
		// Get the response
		BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		String line;
		String sResult1="";
		while ((line = rd.readLine()) != null) 
		{
		// Process line...
		sResult1=sResult1+line+" ";
		}
		wr.close();
		rd.close();
		return true;
		} 
		catch (Exception e)
		{
		System.out.println("Error SMS "+e);
		return false;
		}

		
	}
	
	
	public static void startScheduleTaskAtTen() {
		
	    final ScheduledFuture<?> taskHandle = scheduler.scheduleAtFixedRate(
	        new Runnable() {
	            public void run() {
	            	databaseConfiguration();
	                try {
	                	Calendar cal = Calendar.getInstance();
	        	        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
	        	        String hour = sdf.format(cal.getTime()) ;
	                    System.out.println("hourproperty:"+hour);
	                    System.out.println("hourproperty:"+FIRST_TIME);
	        			if(hour.equals(FIRST_TIME)){
	           				sendAtten();
	        				System.out.println("doing the scheduled task");
	                	
	        			}	
	                }catch(Exception ex) {
	                    ex.printStackTrace(); //or loggger would be better
	                }
	            }
	        }, 0, 1, TimeUnit.MINUTES);
	    }

	   /* Method to send employee info at 12*/
	    
	    public static void startScheduleTaskAtTwelve() {
	    	
		    final ScheduledFuture<?> taskHandle = scheduler.scheduleAtFixedRate(
		        new Runnable() {
		            public void run() {
		            	databaseConfiguration();
		                try {
		                	Calendar cal = Calendar.getInstance();
		        	        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
		        	        String hour = sdf.format(cal.getTime()) ;
	                    
                           
		        			if(hour.equals(SECOND_TIME)){
		        				sendAtTwelve();
		        				System.out.println("doing the scheduled task");
		                	
		        			}	
		                }catch(Exception ex) {
		                    ex.printStackTrace(); //or loggger would be better
		                }
		            }
		        }, 0, 1, TimeUnit.MINUTES);
       }
/* Method to send birthday alert of employee*/
	    
	    public static void startScheduleTaskAtBirthday() {
	    	
		    final ScheduledFuture<?> taskHandle = scheduler.scheduleAtFixedRate(
		        new Runnable() {
		            public void run() {
		                try {
		                	databaseConfiguration();
		                	Calendar cal = Calendar.getInstance();
		        	        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
		        	        String hour = sdf.format(cal.getTime()) ;
		        	        
		        	       
		        			if(hour.equals(BIRTHDAY_TIME)){
		        				sendOnBirthday();
		        				System.out.println("doing the scheduled task");
		                	
		        			}	
		                }catch(Exception ex) {
		                    ex.printStackTrace(); //or loggger would be better
		                }
		            }
		        }, 0, 1, TimeUnit.MINUTES);
       }

	    public static boolean sendOnBirthday()
		{   
			databaseConfiguration();
			String sms1=" ";
			String date=getDate();
			List<EmployeeRegistration> indivisualDetail=DataRetrieve.getBirthdayEmployee();
			for(EmployeeRegistration indivisualReport : indivisualDetail)
			{
	     		String lsp = System.getProperty("line.separator");
		    	sms1="BirthDayAlert:"+indivisualReport.getFirstName()+" "+indivisualReport.getLastName()+" "+indivisualReport.getBranch()+","+sms1;
				
			}
			String sResult = null;
			try 
			{
			System.out.println(SENDER_USERNAME);
			System.out.println(SENDER_PASSWORD);
			
			
			String data="user=" + URLEncoder.encode(SENDER_USERNAME, "UTF-8");
			data +="&password=" + URLEncoder.encode(SENDER_PASSWORD, "UTF-8");
			data +="&message=" + URLEncoder.encode(sms1, "UTF-8");
			data +="&sender=" + URLEncoder.encode("Testid", "UTF-8");
			data +="&mobile=" + URLEncoder.encode(RECIEVER_MOBILE_NUMBER, "UTF-8");
			data +="&type=" + URLEncoder.encode("3", "UTF-8");
			URL url = new URL("https://login.bulksmsgateway.in/sendmessage.php?"+data);
			URLConnection conn = url.openConnection();
			conn.setDoOutput(true);
			OutputStreamWriter wr = new OutputStreamWriter(conn.getOutputStream());
			wr.write(data);
			wr.flush();
			// Get the response
			BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line;
			String sResult1="";
			while ((line = rd.readLine()) != null) 
			{
			// Process line...
			sResult1=sResult1+line+" ";
			}
			wr.close();
			rd.close();
			return true;
			} 
			catch (Exception e)
			{
			System.out.println("Error SMS "+e);
			return false;
			}

			
		}
		  
	    public static void main(String[] args) 
	    {
	    	SMSSending ste = new SMSSending();
	         ste.sendAtten();
	    	  
	         /*ste.startScheduleTaskAtBirthday();
	         ste.startScheduleTaskAtTen();
	         ste.startScheduleTaskAtTwelve();*/
	         
	    }
}
