The yield keyword is similar to the return keyword wherein it returns a value from the function. The difference between them is that the return keyword exits the function, while the yield, pauses the function.

A function with a yield statement can be called a Generator. Generators  are paused when the `yield` keyword is used. To resume these functions we call them using `next()`.

<codeblock language="python" type="lesson">
<code>
def items():
  yield "fries" # <-- pauses after this line

  yield "biryani" # <-- pauses after this line

  yield "ice cream" # <-- pauses after this line

waiter = items() # Initialize the generator

print(next(waiter)) # <-- gets the first value i.e fries
print(next(waiter)) # <-- gets the second value i.e biryani
print(next(waiter)) # <-- gets the third value i.e ice cream
</code>
</codeblock>