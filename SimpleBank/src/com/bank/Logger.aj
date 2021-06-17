package com.bank;

import java.util.Calendar;

public aspect Logger {

	pointcut logPrestamo(): call(* Bank.moneyWithdrawal(..));
	pointcut logTransaction(): call(* Bank.moneyMakeTransaction(..));
	pointcut success1() : call(* Bank.createUser(..) );
	
	 after() : success1() {
	    	System.out.println("**** User created ****");
	    	System.out.println(timeGet());
	    }
	after() : logPrestamo(){
		//Escribimos en consola el Mensaje
		System.out.println("*** Retiro realizado ***");
		System.out.println(timeGet());
		}
	  
	after() : logTransaction(){
		//Escribimos en consola el Mensaje
		System.out.println("*** Transacción realizada ***");
		System.out.println(timeGet());
		}
	  
	public String timeGet() {
		Calendar now = Calendar.getInstance();
		int year = now.get(Calendar.YEAR);
		int month = now.get(Calendar.MONTH) + 1; // Note: zero based!
		int day = now.get(Calendar.DAY_OF_MONTH);
		int hour = now.get(Calendar.HOUR_OF_DAY);
		int minute = now.get(Calendar.MINUTE);
		int second = now.get(Calendar.SECOND);
		
		
		return year+"/"+month+"/"+day+"/"+hour+"/"+minute+"/"+second;
	}
	
}
