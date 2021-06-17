import java.util.Date;
import java.io.FileWriter;


public aspect logger {
	
	// POINTCUT 1
	pointcut successTransaction() : call(* moneyMake*(..));
	after() : successTransaction() {
		Date date = new Date();
		String l = "transaction; -> " 
		+ date.getHours() + "h:"
		+ date.getMinutes() + "m:"
		+ date.getSeconds() + "s"
		+ " - " + date.toString();
		System.out.println("\n Transacción realizada con éxito a las: " + l);
		FileWriter fich = null;
		try {
			fich = new FileWriter("logT.txt", true);
			fich.write(l + "\n");
			fich.close();
		} catch (Exception ex) {
			System.out.println("Excepción, error, HELPPPP! \n" + ex.getMessage());
		}
		
	}
	
	// POINTCUT 2
	pointcut successWithdraw() : call(* moneyWith*(..));
	after() : successWithdraw() {
		Date date = new Date();
		String l = "withdrawal; -> " 
		+ date.getHours() + "h:"
		+ date.getMinutes() + "m:"
		+ date.getSeconds() + "s"
		+ " - " + date.toString();
		System.out.println("\n Withdraw realizada con éxito a las: " +l);
		FileWriter fich = null;
		try {
    		fich = new FileWriter("logW.txt",true);
    		fich.write(l + "\n");
    		fich.close();
    	} catch (Exception ex) {
    		System.out.println("Help! :'v " + ex.getMessage());
    	}
	}
	/*
	public aspect Log {

	    File file = new File("log.txt");
	    Calendar cal = Calendar.getInstance();
	    //Aspecto: Deben hacer los puntos de cortes (pointcut) para crear un log con los tipos de transacciones realizadas.
	    pointcut success() : call(* create*(..) );
	    after() : success() {
	    	System.out.println("**** User created ****");
	    }
	}


	public aspect Logger {

	    pointcut success() : call(* create*(..) );
	    after() : success() {
	    //Aspecto ejemplo: solo muestra este mensaje despu�s de haber creado un usuario 
	    	System.out.println("**** User created ****");
	    }
	    
	}

	*/
}
