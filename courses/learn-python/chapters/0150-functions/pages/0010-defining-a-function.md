A Function in Python lets us group code together so that we can reuse it in different places. We have already used in-built functions `len()` and `type()` in our previous chapters. Let's create our own function which will calculate the area of a rectangle.

<image>rectangle.png</image><codeblock language="python" type="lesson">
<code>
def area():
  width = 5
  length = 6
  print(f"The area of the rectangle with width={width} and length={length} is {width * length}")

area()
</code>
</codeblock>


We have declared a function` area()` above which calculates the area of a rectangle. A function is declared using the `def` keyword followed by the function name and `():`. The next lines contain the statements that will run when this function is called.

To call this function we do `area()`.