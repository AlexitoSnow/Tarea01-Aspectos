package observerpattern;

import java.awt.event.ActionListener;

public aspect ObserverAj {
	
	pointcut subscribe(ActionListener action):
		call(void addActionListener(ActionListener)) && args (action);
	after(ActionListener action) : subscribe(action) {
		System.out.println("Action \"" + action.toString() + "\" subscribed.");
	}
	
	pointcut unsubscribe(ActionListener action):
		call(void removeActionListener(ActionListener)) && args (action);
	after(ActionListener action) : unsubscribe(action) {
		System.out.println("Action \"" + action.toString() + "\" unsubscribed.");
	}
	
	pointcut notify(ColorChanger colorChanger) :
        execution(void ColorChanger.actionPerformed(..)) && target(colorChanger);

    after(ColorChanger colorChanger) : notify(colorChanger) {
        System.out.println("Background color change --> " + colorChanger.getColor());
    }
	
	  
}
