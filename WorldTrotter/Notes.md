### UITapGestureRecognizer 
- to detect when the user taps the background view

A gesture recognizer is a subclass of UIGestureRecognizer that detects a specific touch sequence and calls an action on its target when that sequence is detected.


### Property observer 
- observe and respond to changes in property values
- willSet=> calls before a value is saved
- didSet => called after a new value is saved

** 
Property observers are not called when the instance is first initialized.
Property observers are not available to computed properties, because you can respond to changes through the property setter.

Reference:
- https://blog.devgenius.io/property-observers-in-swift-fb3ba5b2c4d7
- https://medium.com/the-andela-way/property-observers-didset-and-willset-in-swift-4-c3730f26b1e9

### Delagation 

- A delegate is any object that should be notified when something has happened.
i.e When the user types into a text field, that text field will ask its delegate if it wants to accept
the changes that the user has made. 
- When you agree to be the delegate for an object, you will almost certainly need to conform to a specific protocol

### Protocol

simiar to Interface, it defines a blueprint of methods or properties that can then be used by classes
