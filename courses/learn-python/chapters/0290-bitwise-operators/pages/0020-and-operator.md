The **AND** operator is represented by an `&` (ampersand) symbol in Python. It compares two bits and returns `1` if and only if both the operands are `1`. If either one of the operands is `0`, then the operator will return a `0`.

<image>and_image.png</image>

We can see what happens when we do `5 & 4` below:

<codeblock language="python" type="lesson">
<code>
print(5, "\t = ", bin(5))
print(4, "\t = ", bin(4))
print(5 & 4, "\t = ", bin(5 & 4))
</code>
</codeblock>

As you can see the answer is 4. The image below explains why this occurred.

<image>and.png</image>

The image above displays the `and` operation between the bits of `5` and `4`. As we can see in the resulting bits in the bottom row, only the third bit from the right is `1.` As per the `and` operation when both operands that are `1`, the result is `1`. The first bit from the right results as `0` as only one of the operands is `1`.

