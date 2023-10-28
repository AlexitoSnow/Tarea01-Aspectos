package observerpattern;

import javax.swing.*;
import java.awt.*;

public class Main {

	public static void main(String[] args) {
		JFrame frame = new JFrame("Background Color Changer");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setSize(400, 300);
        frame.setLayout(new FlowLayout());

        JButton redButton = new JButton("Red");
        JButton greenButton = new JButton("Green");
        JButton blueButton = new JButton("Blue");

        redButton.addActionListener(new ColorChanger(Color.RED, frame));
        greenButton.addActionListener(new ColorChanger(Color.GREEN, frame));
        blueButton.addActionListener(new ColorChanger(Color.BLUE, frame));

        frame.add(redButton);
        frame.add(greenButton);
        frame.add(blueButton);

        frame.setVisible(true);

	}

}
