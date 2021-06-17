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
	
	// POINTCUT ---> RETIRO/ESCRITURA
    pointcut successRetiro() : call(* Bank.moneyWithdrawal(..));
	after() : successRetiro() {
		String time = timeGet();
		Escritura(time, "**** Se ha hecho un retiro****");
	}
	
	// POINTCUT ---> RETIRO/CONSOLA
    after() : successRetiro(){
    	String time = timeGet();
    	System.out.println(time+"  **** Retiro exitoso ****");
    	
    }
    
	// POINTCUT ---> TRANSACTION/CONSOLA
    pointcut successTransaction() : call(* Bank.moneyMakeTransaction(..));
    after() : successTransaction(){
    	String time = timeGet();
    	System.out.println(time+"  **** Transacción exitosa ****");  	
    }
    
    // POINTCUT ---> TRANSACTION/ESCRITURA
	after() : successTransaction() {
		String time = timeGet();
		Escritura(time, "**** Se ha hecho una transacción****");
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
		
		//Escribimos el registro de la transacciï¿½n
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
