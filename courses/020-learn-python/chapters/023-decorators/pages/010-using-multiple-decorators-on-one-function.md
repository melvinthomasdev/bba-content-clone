We can easily use multiple decorators on one function itself.

<Editor lang="python">
<code>
import time

def measure_time(function):
  '''Measures time for execution'''
  def wrapper(*args, **kwargs):
    start = time.time()
    result = function(*args, **kwargs)
    end = time.time()
    print(f"Time taken to execute print_name is {end - start} seconds")
    return result
  return wrapper


def do_twice(function):
  '''Executes the function twice'''
  def wrapper(*args, **kwargs):
    for _ in range(2):
      function(*args, **kwargs)
  return wrapper


@measure_time # <-- Decorator 1
@do_twice # <-- Decorator 2
def print_name(name):
  print(f"My name is {name}")


print_name("Eleven")
</code>
</Editor>

Keep in mind the order of decorators matters. In this example, the `measure_time` decorator here measures the time for running the function twice. That is, it includes the `do_twice` decorator's time within it. Try swapping the order of the decorators and see the output.

