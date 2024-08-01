If we look closely then we will find that both in procedural style and in the
Object Oriented style we have the same number of methods and methods have almost
the same name.

However one major difference is how we deal with the data. The way we manage
data or state in the procedural style is very different from the way we manage
data or state in the object oriented style.

In the Object Oriented style the data or state resides in the instance of the
class. In the case of procedural style the data or the state is at the global
level and that's why we do not need to pass the `age` to any method.

Having your data or state globally available means that we have less control
over how that data is accessed. Any code can change any data because the data is
globally available.

That's not the case in the Object Oriented style of programming.

In this case the age of the person is tucked in the class `Person`. If anyone
wants to know the age of the person then that item needs to have access to the
instance `person` and then that item need to ask the person what't the age. If a
class does not want to reveal its state then that class and keep its data
private also.

This means that in the Object Oriented style classes have a control over what
data to reveal to the outside world and what data not to reveal. This is a great
thing because it allows a class to reveal only the important thing that external
world needs to know and rest of the things can be private to the class.

In the software engineering world methods are also called "behaviors" and data
is also called "state". That's why whe you read about Object Oriented then you
will hear a lot about "data" and "behavior".

For example take a look at
[this stackoverflow answer](https://stackoverflow.com/questions/60116769/what-is-the-difference-between-object-oriented-programming-and-procedural-program)
about the difference between procedural style of programming and Object Oriented
style of programming. This answer talks about **state** and **behavior**.
