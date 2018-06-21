package com.bionische.database;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.TimeUnit;

public class ScheduledTaskExample {
    private final ScheduledExecutorService scheduler = Executors
        .newScheduledThreadPool(1);
public String FIRST_TIME="17:25";
    public void startScheduleTask() {
    
    final ScheduledFuture<?> taskHandle = scheduler.scheduleAtFixedRate(
        new Runnable() {
            public void run() {
                try {
                	System.out.println(TimeUnit.MINUTES);
                	Calendar cal = Calendar.getInstance();
        	        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
        	        String hour = sdf.format(cal.getTime()) ;
                    
        			if(hour.equals(FIRST_TIME)){
        				getDataFromDatabase();
        				System.out.println("doing the scheduled task");
                    
                }}catch(Exception ex) {
                    ex.printStackTrace(); //or loggger would be better
                }
            }
        }, 0, 1, TimeUnit.MINUTES);
    }

    private void getDataFromDatabase() {
       
        System.out.println("timer");
    }

    public static void main(String[] args) {
        ScheduledTaskExample ste = new ScheduledTaskExample();
        ste.startScheduleTask();
    }
}