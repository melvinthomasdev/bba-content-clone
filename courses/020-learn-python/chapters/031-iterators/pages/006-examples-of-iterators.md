Many functions within Python 3 return an `Iterator` instead of a list by default. This is in order to help conserve memory and avoid unnecessary computation.

For example the `map()`, `filter()` and `range()` functions should ideally return a sequence. Instead the return value is an iterable. To consume its values we have to pass it to the `list()` function or iterate over it.

This comes in handy if the input list if large. For example, processing a list with 1 million values in a single go might not be the most efficient approach. Iterators fix this issue by processing values when needed.

<Editor lang="python">
<code>
print(range(5)) # result is an iterator

print(list(range(5))) # convert iterator to a list
</code>
</Editor><Editor lang="python">
<code>
inputs = [56,23,67,23,75,23]
result = map(lambda x: x // 2, inputs)

print(result) # <-- returns an iterator

for r in result: # <-- iterates through the results
  print(r, end="\t")
</code>
</Editor>

Note you can pass the filter iterator to map iterator without converting the values to a list. Most Python functions support an iterable as an input.

<Editor lang="python">
<code>
nums = range(10)
odd_numbers = filter(lambda x: x & 1, nums)
print(list(odd_numbers))
</code>
</Editor>