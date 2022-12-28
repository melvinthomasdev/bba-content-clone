In our `area()` function we take in our arguments and print the result using the print function within. However, in real-world cases, we might want to receive the calculated result back from the function. We can do that using the return statement.

<codeblock language="python" type="lesson">
<code>
def area(width, length):
  return width * length

result = area(2, 3)
print(f"The area of the rectangle is {result}")
</code>
</codeblock>

Using the return statement we can send the result of the operation back outside the function, where it can be used for further operations.
