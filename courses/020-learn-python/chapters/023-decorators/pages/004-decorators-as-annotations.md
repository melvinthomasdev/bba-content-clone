Python provides a cleaner and shorter way to represent decorators by using the `@` symbol.

<Editor lang="python">
<code>
import time

def measure_time(another_function):
  start = time.time()
  result = another_function()
  end = time.time()
  print(f"Time taken for to execute hello_world is {end - start} seconds")
  return result

@measure_time # <-- wraps hello_world in measure_time decorator
def hello_world():
  print("Hello World")
</code>
</Editor>

As you can see from the example, we can use the `measure_time` decorator on `hello_world()` using the `@` symbol. i.e `@measure_time`.

An issue however, is that Python runs `measure_time(hello_world)` without an explicit call, which is something we might not want.

To overcome this issue, we will use **Nested Functions**.

