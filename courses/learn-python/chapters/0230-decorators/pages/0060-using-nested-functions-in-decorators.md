We can use a Nested function to avoid the decorator from being called implicitly by Python.

<codeblock language="python" type="lesson">
<code>
import time

def measure_time(another_function):
  def wrapper():
    start = time.time()
    result = another_function() # Nested functions have access to variables from parent function
    end = time.time()
    print(f"Time taken for to execute hello_world is {end - start} seconds")
    return result
  return wrapper

@measure_time
def hello_world():
  print("Hello World")

# hello_world() # <-- Uncomment this line
</code>
</codeblock>

As you can see above, the only change that we have made is that we have added a nested function called `wrapper()` and moved the code within it. `measure_time()` returns this `wrapper` function to the caller.

If we run the code snippet now, you will notice `measure_time()` is not being called implicitly. Instead, we will have to call `hello_world()`, which will internally call the code from `wrapper()` within the `measure_time` decorator.

Uncomment the last line to run `hello_world()` and see the results.

This way we can go on to use `hello_world()` as a usual independent function.

