Let's make our `area()` function completely dynamic now. It should take in arguments dynamically for any mentioned shape and provide the result. Some things we need to keep a note of are:

* The formula for the area for a rectangle requires 2 arguments: width, length
* The formula for the area of a circle requires only one argument: radius
* The formula for the area for a cuboid requires 3 arguments: height, width, breadth

<image>cuboid.png</image><codeblock language="python" type="lesson">
<code>
def area(*args, shape="rectangle"):

  if shape == "rectangle":
    width = args[0]
    length = args[1]
    return width * length

  elif shape == "circle":
    radius = args[0]
    return 3.14 * radius ** 2

  elif shape == "cuboid":
    height = args[0]
    width = args[1]
    breadth = args[2]
    return height * width * breadth

# Get area of a Circle
print(f"The area of a circle with radius 5 is {area(5, shape='circle')}")

# Get area of a Rectangle
print(f"The area of a rectangle with width 6 and length 5 is {area(6, 5, shape='rectangle')}")

# Get area of a Cuboid
print(f"The area of a cuboid with height 6 and width 8 and breadth 4 is {area(6, 8, 4, shape='cuboid')}")
</code>
</codeblock>


If we want to use variable keyword arguments instead, we could do the following.

<codeblock language="python" type="lesson">
<code>
def area(*, shape="rectangle", **kwargs):

  if shape == "rectangle":
    width = kwargs['width']
    length = kwargs['length']
    return width * length

  elif shape == "circle":
    radius = kwargs['radius']
    return 3.14 * radius ** 2

  elif shape == "cuboid":
    height = kwargs['height']
    width = kwargs['width']
    breadth = kwargs['breadth']
    return height * width * breadth

# Get area of a Circle
print(f"The area of a circle with radius 5 is {area(radius=5, shape='circle')}")

# Get area of a Rectangle
print(f"The area of a rectangle with width 6 and length 5 is {area(width=6, length=5, shape='rectangle')}")

# Get area of a Cuboid
print(f"The area of a cuboid with height 6 and width 8 and breadth 4 is {area(height=6, width=8, breadth=4, shape='cuboid')}")
</code>
</codeblock>