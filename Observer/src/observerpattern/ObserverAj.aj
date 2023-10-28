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
}
