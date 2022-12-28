Sometimes we might want to run some code at the beginning and at end of a function. For example, the `time()` function can help us measure the number of elapsed seconds while executing a code block.

<codeblock language="python" type="lesson">
<code>
import time

def hello_world():
  print("Hello World")

start = time.time()
hello_world()
end = time.time()
print(f"Time taken for to execute hello_world is {end - start} seconds")
</code>
</codeblock>

While effective, we would have to wrap any function/code we want to measure with `time.time()` statements. We can avoid such repetition using decorators and implement the same in a much cleaner way.

