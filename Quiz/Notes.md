### Outlets and Actions:

There are two kinds of connections that you can make in Interface Builder: outlets and actions. 
- An outlet is a reference to an object. 
- An action is a method that gets triggered by a button or some other view that the user can interact with, like a slider or a picker.

### Model-View-Controller:

-Design pattern in application architecture
-Every instance belongs to either the model, view, or the controller layer

Model Layer
-Knows nothing about the user interface/UI

View (user interface) sends input events to Controller (mediator)

Controller makes a request to Model(deals with data and logic) —--------> sends data back to controller and then View to modify the UI

### VIEW and MODEL NEVER interact with each other
