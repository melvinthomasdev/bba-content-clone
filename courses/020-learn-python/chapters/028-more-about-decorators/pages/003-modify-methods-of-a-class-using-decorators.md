We can also use decorators to modify the methods of a class. As a class can also be passed as an argument to a function, we can access and modify it as required.

<Editor lang="python">
<code>
def print_in_caps(class_): # <-- Decorator receives class as argument
  def temp(self, value): # <-- Define new function which will replace old one
    print(value.upper())
    
  class_.display = temp # <-- overwrite old display function with temp
  return class_
  
@print_in_caps # <-- Add decorator to class
class DisplayManager:
  def display(self, value):
    print(value)
    
d = DisplayManager() # <-- Decorated class
d.display("Hello")
</code>
</Editor>

The above code is equivalent to:

<Editor lang="python">
<code>
def print_in_caps(class_): # <-- Decorator function
  def temp(self, value):
    print(value.upper())
    
  class_.display = temp
  return class_
  
class DisplayManager:
  def display(self, value):
    print(value)
    
ModifiedDisplayManager = print_in_caps(DisplayManager) # <-- Pass class as argument
s = ModifiedDisplayManager() # <-- create object with modified class
s.display("Hello")
</code>
</Editor>