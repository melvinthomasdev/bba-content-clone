Iterators are objects that allow us to compute and fetch one value at a time from a sequence. They help us save memory and computation by not calculating the results for the entire sequence, but only for the next one.

We can convert any sequence such as list, tuple, dict, and set into an iterative object using `iter()`. To fetch the next value we can use the `next()` function as shown below.

<codeblock language="python" type="lesson">
<code>
cartoons = ["Tom", "Jerry", "Micky", "Minnie", "Popeye", "Olive"]

iterator = iter(cartoons) # <-- get an iterator object

print(next(iterator))
print(next(iterator))
print(next(iterator))
</code>
</codeblock>