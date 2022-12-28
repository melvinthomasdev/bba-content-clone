The time module provides a function called `perf_counter()`, which is used to measure the time taken to execute our code.

Using it, we can see how long it takes our code to run, and optimize the code accordingly.

<codeblock language="python" type="lesson">
<code>
import time

def execute_code():
  print("Started running code.")
  print("Waiting for 5 seconds.")
  time.sleep(5)
  print("Finished executing code")


start_time = time.perf_counter()
execute_code()
stop_time = time.perf_counter()

execution_time = (stop_time - start_time)
print(f"The code took {execution_time} seconds to run.")
</code>
</codeblock>