While measuring the execution time of a large amount of code, `perf_counter()` it might return different results. in such cases what we would like to do is get an average estimate of the execution time. For this, we could use the `timeit` module which is specifically designed to measure the performance of code.

<codeblock language="python" type="lesson">
<code>
import time
from timeit import timeit

def execute_code():
  print("Started running code.")
  print("Waiting for 2 seconds.")
  time.sleep(2)
  print("Finished executing code")

  
execution_time = timeit(execute_code, number=10)
print(f"The time to execute the code 10 times is {execution_time}")

# Get the average
print(f"The average time to execute the code is {execution_time / 10}")
</code>
</codeblock>