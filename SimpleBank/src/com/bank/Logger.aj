package com.bank;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Calendar;

public aspect Logger {
	
	pointcut success() : call(* create*(..) );
    after() : success() {
    	System.out.println("**** User created ****");
    }
    
    pointcut successRetiro() : call(* Bank.moneyWithdrawal(..));
    after() : successRetiro(){
    	System.out.println("**** Retiro exitoso ****");
    	
    }
    
    public String timeGet() {
		Calendar now = Calendar.getInstance();
		int year = now.get(Calendar.YEAR);
		int month = now.get(Calendar.MONTH) + 1; // Note: zero based!
		int day = now.get(Calendar.DAY_OF_MONTH);
		int hour = now.get(Calendar.HOUR_OF_DAY);
		int minute = now.get(Calendar.MINUTE);
		int second = now.get(Calendar.SECOND);
		
		
		return year+"-"+month+"-"+day+"-"+hour+"-"+minute+"-"+second;
	}

	public void Escritura(String date, String info) {
		try {
			File f= new File("Log.txt");
		 	f.createNewFile();
		 }  catch (IOException e) {
			System.out.println("Err creando"+e.getMessage());
		 }
		
		//Escribimos el registro de la transacción
		try {
		   
		    BufferedWriter bw = new BufferedWriter(new FileWriter("Log.txt",true));
		    bw.write(date+" "+info);
		    bw.newLine();
	        bw.flush();
		    bw.close();
		    
		  } catch (IOException e) {
		    System.out.println("An error occurred.");
		    e.printStackTrace();
		    }
		
		
	}
    
}
