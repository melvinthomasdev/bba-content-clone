Decorators are basically functions. They help us run code before and after other functions. Ideally, you can think of them as wrappers for other functions.

Decorator functions take in a function as an input and run it between some other code. Let's see this in practice using the previous `time()` example.

<Editor lang="python">
<code>
import time

def hello_world():
  print("Hello World")

def measure_time(another_function): # <-- Decorator function
  start = time.time()
  result = another_function() # <-- Original function called
  end = time.time()
  print(f"Time taken for to execute hello_world is {end - start} seconds")
  return result # <-- Result of original function returned

measure_time(hello_world)
</code>
</Editor>

As you can see here, the `measure_time` function is a decorator, which takes in a function as an argument and measures its execution time in seconds using `time.time()`. `hello_world()` is untouched and still runs the same way.

We can now pass in any function to `measure_time()` and get its execution time.
