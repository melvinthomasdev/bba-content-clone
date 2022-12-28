Functions within a class are called the **methods** of that class. We have defined three methods within our Dog class. The `__init__`, `bark` and `wag_tail` method. Let's dig a bit into the **\__init__** method here.

**The `__init__` method is automatically called by Python internally when we create an instance/object of the class.** We can use it to set attributes within the object when it is created.

In our example, we pass in the `name`, and `breed` of the dog when creating the instance. The `name` and `breed` are then asigned as attributes of the class.

<codeblock language="python" type="lesson">
<code>
class Dog:
  def __init__(self, name, breed):
    print("This code is running within the constructor")
    self.name = name
    self.breed = breed

print("Intializing constructor")
chester = Dog(name="Chester", breed="dalmatian")
print(f"The dog name is {chester.name}")
print(f"The dog name is {chester.breed}")
</code>
</codeblock>

We can run any code within the `__init__` method, however, we cannot return a value from it. Try this out by adding a return statement at the end of `__init__`.

