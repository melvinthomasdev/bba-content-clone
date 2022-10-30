The last two bitwise operators we need to know about are the left shift and right shift operators. These two operators either move the bits to the left or right based on the value specified by the second operand. The left and right shift operators are represented by the `<<` and `>>` operators respectively.

<Image>lshift.png</Image><Image>rshift.png</Image>

When an integer is shifted to the right or left, its value either doubles or halves. As seen in the example above, `10` becomes `20` after a left shift by `1` place. Similarly, its value reduces to `5` when it is shifted to the right by 1 place. Bitwise operators come in handy when working with exponential operations as they are much more efficient in nature.

Note that `0` is added to the end of the number after a left shift operation to make up for the extra bit. 

<Editor lang="python">
<code>
print(8, "\t =", bin(8))
print(8 << 1, "\t =", bin(8 << 1))
</code>
</Editor><Editor lang="python">
<code>
print(8, "\t =", bin(8))
print(8 >> 2, "\t =", bin(8 >> 2))
</code>
</Editor>