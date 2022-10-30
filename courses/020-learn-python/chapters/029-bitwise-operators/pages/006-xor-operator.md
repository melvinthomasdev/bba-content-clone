The **XOR** operator is represented by the `^` (hat) character in Python. The XOR operator outputs a 1 only if both the input bits are different. If both input bits are the same, the result is 0.

<Image>xor.png</Image>

Below is an **XOR** operation between `10` and `12`.  The result of the operation is `6`.

<Editor lang="python">
<code>
print(10, "\t = ", bin(10))
print(12, "\t = ", bin(12))
print(10 ^ 12, "\t = ", bin(10 ^ 12))
</code>
</Editor>

The figure below shows how this takes place. As seen, the second last, and third last positions have different bits. Hence the resulting bits have those positions set to `1`. The last and fourth last position have the same bits set, which result in the positions being set to `0`.

<Image>xor_op.png</Image>

If the two numbers are the same, **XOR** will cancel out all the bits with each other and the result will be 0.

