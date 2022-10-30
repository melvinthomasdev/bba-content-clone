Given below is a `register()` function which is meant to register people on a website. It takes in two parameters: first name and last name of a person. As a developer, you want a way to log all the names passed to this function without modifying the code within it. 

Do the same using a class decorator called `Record` (defined below). Store all the given names within the `inputs` list and print it at the end. 


<Editor lang="python" type="exercise">
<code>
# create a class decorator to store the inputs (first_name, last_name) of the function

class Record:
  # Modify __init__ method to accept the function
  def __init__(self):
    self.inputs = []
    
  # Create __call__ and append the args to a inputs list
  # Pass args to the function and return the result after
  
@Record
def register(first_name, last_name):
  print(f"{first_name} {last_name} has been successfully registered.")
  
register("Virk", "Magsun")
register("John", "White")
register("Stacy", "Taylor")

print(register.inputs) # <-- Print the inputs
</code>

<solution>
# create a class decorator to store the inputs (first_name, last_name) of the function

class Record:
  def __init__(self, fn):
    self.fn = fn
    self.inputs = []
    
  def __call__(self, *args):
    self.inputs.append(args)
    return self.fn(*args)
  
@Record
def register(first_name, last_name):
  print(f"{first_name} {last_name} has been successfully registered.")
  
register("Virk", "Magsun")
register("John", "White")
register("Stacy", "Taylor")

print(register.inputs)
</solution>
</Editor>