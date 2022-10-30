Generators are extremely useful when we would like to iterate through large or infinite data. The next item is not fetched/calculated until it is explicitly asked for. For example, we could create a generator to generate the next number in the Fibonacci series the following way:

<Editor lang="python">
<code>
def fibonacci():
  # yield 0 and 1 directly
  first = 0
  yield first
  second = 1
  yield second

  while True: # Loop infintely
    third = first + second # <-- Calculate the next number in the series
    yield third # <-- Yield the next number in the series
    first = second
    second = third

fib_gen = fibonacci()
for _ in range(10): # Loops for 10 iterations
  print(next(fib_gen), end="\t") # <-- Can generate the next number infintely
</code>
</Editor>

Using such a generator we don't have to calculate and return the entire series of numbers from the function. We can generate the next number in the Fibonacci series on the go. The next number will be generated only when we call `next()`.

