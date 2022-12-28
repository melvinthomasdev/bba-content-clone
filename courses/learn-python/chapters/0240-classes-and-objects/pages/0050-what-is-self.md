The `self` variable within our class represents the instance of the class. For example, if we created a Labrador instance of the Dog class and called `labrador.bark()`, the `self` variable in `bark()` would refer to that `labrador` object. Using `self` we can assign attributes to the class. e.g `name, breed`. We can also change the attribute values.

<codeblock language="python" type="lesson">
<code>
class Dog:
  def __init__(self, name): # <-- __init__ accepts name
    self.name = name # <-- name is assigned to self.name

  def print_name(self):
    print(f"Doggo name is {self.name}") # <-- self.name is printed

  def change_name(self, new_name):
    self.name = new_name


chester = Dog("Chester") # <-- new dog object is created with name
chester.print_name()


chester.change_name("Tio") # <-- another new dog object is created with name
chester.print_name()
</code>
</codeblock>

The **self** parameter is passed to the methods implicitly by Python when we call a method. Hence when we call `change_name()` we dont have to pass an added variable for `self`.

