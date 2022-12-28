To make our arguments to be specified more clearly we can also use variable keyword arguments. Variable keyword arguments are prepended with `**`. For example, `**kwargs` in the example below is a dictionary containing a variable number of keyword arguments.


<codeblock language="python" type="lesson">
<code>
def area(*, shape="rectangle", **kwargs):  # kwargs is a variable keyword argument
  print(kwargs)

area(height=6, width=8, breadth=4, shape='cuboid')
</code>
</codeblock>