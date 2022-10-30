Look at the following code:

<Editor lang="ruby">
<code>
array = [1,2,3]

a, *b, c = array
# a = 1
# b = [2]
# c = 3
puts a
puts b
puts c
</code>
</Editor>

In the case provided above, even though **b**
is greedy, Ruby first attempts to
assign at least one value to
each of the variables.

In this case, one value is
assigned to **a**, **b** & **c**.
Since nothing else is left,
**b** ends with only 2.
But, since **b** is using
a `*`, that 2 is an array.

Now, let's try the same
thing with more values.

<Editor lang="ruby">
<code>
array = [1,2,3,4,5]

a, *b, c = array
# a = 1
# b = [2,3,4]
# c = 5
puts a
puts b
puts c
</code>
</Editor>

In this example,
Ruby first assigned **1**
to **a** and **2**
to **b**
and
**5** to **c**.

Still, we were
left with **3** & **4**
which got assigned to **b**.