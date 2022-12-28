In the previous section we hardcoded the width and length of the rectangle to be 5 and 6 respectively. Due to this every time we called `area()` we received the same result. In this section, let's make the `area()` function dynamic so that it can accept the width and length from us and print the result based on the inputs.

<codeblock language="python" type="lesson">
<code>
def area(width, length):
  print(f"The area of the rectangle with width={width} and length={length} is {width * length}")

area(2, 3)
</code>
</codeblock>

Within the snippet above, we moved the width and length from the function body to the `()` brackets at the function definition. Adding variables names within these brackets will allow the `area()` function to accept two inputs which will be stored in `width` and `length`. These are called positional arguments in Python.

As you can see, when calling the function, we pass in 2 and 3 as arguments to the function which the print statement then uses to give us the correct result.