In the previous cases, we decorated functions which took in no arguments. Let's modify our functions now so that we can accept arguments.

<codeblock language="python" type="lesson">
<code>
import time

def measure_time(function):
  def wrapper():
    start = time.time()
    result = function() # Nested functions have access to variables from parent function
    end = time.time()
    print(f"Time taken for to execute hello is {end - start} seconds")
    return result
  return wrapper


@measure_time
def hello(name):
  print("Hello", name)

hello("Python")
</code>
</codeblock>

As you can see, we receive an error that says `wrapper() takes 0 positional arguments but 1 was given`. This happens as our decorator does not currently support arguments. We can change this by accepting `name` as a parameter within `wrapper()`.

We could also make the decorator more generic by accepting variable arguments i.e `*args` and `**kwargs`.

<codeblock language="python" type="lesson">
<code>
import time

def measure_time(function):
  def wrapper(*args, **kwargs): # <-- accepts arguments
    start = time.time()
    result = function(*args, **kwargs) # <-- Pass arguments to function i.e hello()
    end = time.time()
    print(f"Time taken for to execute hello is {end - start} seconds")
    return result
  return wrapper

@measure_time
def hello(name):
  print("Hello", name)

hello("Python")
</code>
</codeblock>

Our code here allows `wrapper()` to accept any number of positional and keyword arguments and forward them to the function which is being decorated.

