Keyword arguments (also known as named arguments) are arguments that need to be named specifically while calling the function. They don't require to be in any order like positional arguments.

We can define keyword arguments by adding a **\*** as the first argument to a function.  In the snippet below, we define two keyword arguments width and length,  for the `area()` function.

<codeblock language="python" type="lesson">
<code>
def area(*, width, length):
  return width * length

result = area(length=10, width=6)
print(f"The area of the rectangle is {result}")
</code>
</codeblock>


Calling the function without keyword arguments will result in an error.

<codeblock language="python" type="lesson">
<code>
def area(*, width, length):
  return width * length

result = area(2, 3) # Will throw an error
</code>
</codeblock>