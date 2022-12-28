We can also place a while loop within another while loop. This is also known as nesting a while loop.
The program below multiplies every number of `numbers_list_1` with `numbers_list_2` using nested while loops.

<codeblock language="python" type="lesson">
<code>
numbers_list_1 = [15, 16, 17]
numbers_list_2 = [1, 2, 3, 4, 5]

i = 0

while i < len(numbers_list_1): # outer loop
  j = 0

  while j < len(numbers_list_2): # inner nested loop
    num_1, num_2 = numbers_list_1[i], numbers_list_2[j]
    print(f"The product of {num_1} * {num_2} is {num_1 * num_2}")
    j += 1

  print("-------------------------------")

  i += 1
</code>
</codeblock>