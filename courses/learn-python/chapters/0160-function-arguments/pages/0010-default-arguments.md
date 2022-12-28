Currently, in our `area()` function we expect only the width and length of a rectangle. What if we could modify our function to also calculate the area of a rhombus? Well, we could add another argument `shape` to our function in the following manner.

<image>rhombus.png</image><codeblock language="python" type="lesson">
<code>
def area(width, length, shape):
  if shape == "rectangle":
    return width * length
  elif shape == "rhombus":
    return width * length / 2

result = area(2, 3, "rectangle")
print(f"The area of the rectangle is {result}")

result = area(6, 8, "rhombus")
print(f"The area of the rhombus is {result}")
</code>
</codeblock>

However, we could also keep our default functionality, wherein we don't pass the shape argument and the calculation is done for rectangle by default.

<codeblock language="python" type="lesson">
<code>
def area(width, length, shape="rectangle"): # default value of shape is set to rectangle
  if shape == "rectangle":
    return width * length
  elif shape == "rhombus":
    return width * length / 2

result = area(2, 3) # calculation is done for rectangle by default
print(f"The area of the rectangle is {result}")

result = area(6, 8, "rhombus")
print(f"The area of the rhombus is {result}")
</code>
</codeblock>

In the snippet above, we have assigned `rectangle` as a default argument to `shape`. Now when we call `area()`, if we don't pass the shape, `rectangle` will be used by default.
