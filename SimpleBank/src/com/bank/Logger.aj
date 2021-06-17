package com.bank;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Calendar;
import java.util.Date;

public aspect Logger {
	
	// POINTCUT ---> USUARIO/CONSOLA
	pointcut success() : call(* Bank.createUser(..) );
    after() : success() {
    	System.out.println("**** User created ****");
		String time = timeGet();
		System.out.println("\nUsuario creado con éxito a las: " + time);
    }
    
    // POINTCUT ---> USUARIO/ESCRITURA
    pointcut successCreateUser() : call(* Bank.createUser(..));
	after() : successCreateUser() {
		String time = timeGet();
		Escritura(time, "**** Se ha creado un usuario ****");
	}
	
	// POINTCUT ---> TRANSACTION/CONSOLA
    pointcut successTransaction() : call(* Bank.moneyMakeTransaction(..));
    after() : successTransaction(){
    	System.out.println("**** Transacción exitosa ****");
		String time = timeGet();
		System.out.println("\nTransacción realizada a las: " + time);
    	
    }
    
    
    // POINTCUT ---> RETIRO/CONSOLA
    pointcut successRetiro() : call(* Bank.moneyWithdrawal(..));
    after() : successRetiro(){
    	System.out.println("**** Retiro exitoso ****");
    	
    }
    
    
    
    public String timeGet() {
    	Date date = new Date();
		String l = "transaction; -> " + date.toString();
		return l;
	}

	public void Escritura(String date, String info) {
		try {
			File f= new File("Log.txt");
		 	f.createNewFile();
		 }  catch (IOException e) {
			System.out.println("Err creando"+e.getMessage());
		 }
		
		//Escribimos el registro de la transacci�n
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
