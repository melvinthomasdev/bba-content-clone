A class is a blueprint for an item. For example, if **Dog is a class** then a **Labrador is an object or instance** of that class. We can group together all functions and variables common to dogs within the `Dog` class as such.

<image>class.png</image><codeblock language="python" type="lesson">
<code>
class Dog: # <-- Define Dog class
  def __init__(self, name, breed):
    self.name = name # <-- Dog has a name
    self.breed = breed # <-- Dog belongs to a breed

  def bark(self): # <-- Dog can bark
    print("Woof")

  def wag_tail(self): # <-- Dog can wag tail
    print("Wagging tail..")
</code>
</codeblock>

Now that we have created the class let's see how we can create an **instance** of it.

