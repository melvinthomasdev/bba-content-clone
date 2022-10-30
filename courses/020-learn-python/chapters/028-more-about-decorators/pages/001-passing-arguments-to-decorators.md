Decorators also support arguments. While adding a decorator we can pass in arguments to it so that we can alter its function. In the example below, we pass in an integer to `do_n_times` to indicate how many times we want `print_hello` to repeat.

<Editor lang="python">
<code>
def do_n_times(times): # <-- Takes in decorator arguments
  def outer_wrapper(fn): # <-- Takes in function to be decorated
    def inner_wrapper(*args, **kwargs): # <-- Takes in function arguments
      for _ in range(times):
        fn(*args, **kwargs)
    return inner_wrapper
  return outer_wrapper

@do_n_times(times=4) # <-- Passes in decorator arguments
def print_hello(name):
  print(f"Hello {name}")

print_hello("Bob")
</code>
</Editor>

To allow arguments in decorators we need to add another additonal wrapper function which takes in the arguments. The outermost wrapper takes in the decorator arguments, the middle wrapper takes in the function and the innermost layer takes in the function arguments.

