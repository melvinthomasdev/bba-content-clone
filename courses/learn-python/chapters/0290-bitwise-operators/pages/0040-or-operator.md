The **OR** operator is represented by a `|` pipe character in Python. The result of an `or` operator is `1` if one of the operands is `1`.

<image>or.png</image>

Let us do an **OR** operation on two numbers to see the result:

<codeblock language="python" type="lesson">
<code>
print(10, "\t = ", bin(10))
print(5, "\t = ", bin(5))
print(10 | 5, "\t = ", bin(10 | 5))
</code>
</codeblock>

As we see here, the result of `10 | 5` is `15`. The image below shows how this took place.

<image>or_operation.png</image>

As we see here, whichever position in the operands has at least a single bit as 1, the result will also contain 1.

