The `starmap()` is similar to the `map()` function where we can iteratively pass values from a list as an argument to a function. The difference between them is that `starmap()` supports passing multiple arguments to a function.

We can use `starmap()` in cases where we want to call a function iteratively for every set of arguments in a list. `starmap()` passes each argument set to the function and returns the results as an iterable.

<codeblock language="python" type="lesson">
<code>
import itertools

def get_cuboid_area(height, breadth, width): # <-- receives 3 arguments from tuple below
  return height * breadth * width

# arguments set
args = [
  (3,4,5),
  [453,23,24]
]

results =itertools.starmap(get_cuboid_area, args) # <-- call get_cuboid_area for every tuple in args

for arg, result in zip(args, results):
  print(f"The area of {arg} is {result}")
</code>
</codeblock>