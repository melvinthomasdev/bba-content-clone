The `__repr__` method within a class decides how the class instance is displayed as a string. Modifying it can change the output format of a class instance when printed.

Given below is a `__newrepr__` function and a Person class. Modify `new_format` decorator to replace the `__repr__` function with `__newrepr__`. Use the decorator on the person class and print the result.


<codeblock language="python" type="exercise" testMode="fixedInput">
<code>
# Replace __repr__ with __newrepr__ uing a decorator

def __newrepr__(self): # new function
  return f"{self.__class__.__name__} [Name -> {self.name}]"

def new_format(class_): # decorator
  # make your changes here

  return class_


# Add decorator
class Person:
  def __init__(self, name):
    self.name = name

p = Person("Vineeth")
print(p)
</code>

<solution>
def __newrepr__(self):
  return f"{self.__class__.__name__} [Name -> {self.name}]"

def new_format(class_):
  class_.__repr__ = __newrepr__
  return class_


@new_format
class Person:
  def __init__(self, name):
    self.name = name

p = Person("Vineeth")
print(p)
</solution>
</codeblock>