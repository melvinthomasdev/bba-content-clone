We can add variables that are common across all instances of the class. There are called class attributes.

<Editor lang="python">
<code>
class Dog:
  NO_OF_OBJECTS = 0 # <-- This is a class attribute

  def __init__(self, name):
    self.name = name
    Dog.NO_OF_OBJECTS += 1

dog1 = Dog("Ringo")
dog2 = Dog("Tyson")
dog3 = Dog("Popsy")

print(Dog.NO_OF_OBJECTS) # Prints the number of objects created
</code>
</Editor>