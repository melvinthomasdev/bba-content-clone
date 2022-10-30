We can also use a class as a decorator in Python. The function will be received as an argument to `__init__` and the function arguments will be passed to `__call__`.

In the example below we define `StoreResults` which stores the results of every call to `add()`.

<Editor lang="python">
<code>
class StoreResults:
  def __init__(self, function): # <-- accepts function as an argument
    self.function = function
    self.results = [] # <-- list to store result of the function call

  def __call__(self, *args, **kwargs): # <-- accepts function arguments
    res = self.function(*args) # <-- calls function
    self.results.append(res) # <-- stores result in self.results before returning
    return res

@StoreResults
def add(a, b):
  '''Adds two numbers'''
  return a + b

# Do a couple of calculations
print(add(3, 4))
print(add(2, 3))
print(add(4, 6))

print(add.results) # <-- access the stored results
print(add) # <-- add is now an object of StoreResults
</code>
</Editor>

Note that when we use a class decorator, the function we are decorating becomes an object of the class and can access all its methods and attributes of it. Hence, we can access the `results` list by using `add.results` as seen above.

