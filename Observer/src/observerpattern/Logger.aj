package observerpattern;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

public aspect Logger {
	
	File file = new File("Cambios.txt");
	Calendar cal;
	
	pointcut registrarCambio(ColorChanger colorChanger):
		execution(void ColorChanger.actionPerformed(..)) && target(colorChanger);
	
	before(ColorChanger colorChanger) : registrarCambio(colorChanger) {
		try {
			if (!file.exists()) 
				file.createNewFile();
		} catch (IOException e) {}
	}

    after(ColorChanger colorChanger) : registrarCambio(colorChanger) {
    	this.cal = Calendar.getInstance();
        
        try (PrintWriter pw = new PrintWriter(new FileOutputStream(file, true))) {
        	pw.println("Color actualizado a ["+colorChanger.getColor()+"]    Fecha: ["+cal.getTime() + "]");
        	
        } catch (IOException e) {}
    }
}
