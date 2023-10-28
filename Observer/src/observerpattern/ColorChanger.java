package observerpattern;

import java.awt.Color;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JFrame;


public class ColorChanger implements ActionListener {

	private Color color;
    private JFrame frame;

    public ColorChanger(Color color, JFrame frame) {
        this.color = color;
        this.frame = frame;
    }

	@Override
	public void actionPerformed(ActionEvent e) {
		frame.getContentPane().setBackground(color);
		
	}
	
	@Override
	public String toString() {
		return "Color: rgb(%s,%s,%s)".formatted(color.getRed(),color.getGreen(),color.getBlue());
	}
	
	public String getColor() {
		if (color.equals(Color.RED)) {
	        return "Red";
	    } else if (color.equals(Color.GREEN)) {
	        return "Green";
	    } else {
	        return "Blue";
	    }
		
	}


}
