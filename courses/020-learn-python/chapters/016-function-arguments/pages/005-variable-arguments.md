Variable arguments allow us to take in different number of arguments to a function. Variable arguments can be created by adding a `*` to a variable name. For example `*args` in the example below is a variable argument. It will be a tuple containing all the positional arguments given to the function.

<Editor lang="python">
<code>
def area(*args, shape="rectangle"): # args is a variable argument
  print(args)

area(6, 5, shape='rectangle')
</code>
</Editor>