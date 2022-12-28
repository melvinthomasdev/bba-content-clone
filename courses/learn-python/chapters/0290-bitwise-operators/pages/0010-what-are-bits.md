Unlike other operators, to understand Bitwise operators, we need to understand bit-level operations. All data within a system is represented by bits. A bit is a unit of the binary number system, which comprises only two numbers 1 and 0.

A collection of bits make up Integers, Floats, Strings, and other Datatypes. For example, the following are samples of how natural numbers are represented in bits:

<image>bitwise.png</image>

To understand why the binary number `00000101` is mapped to `5`, we can view the following diagram.

<image>bit_mapping.png</image>

As you can see in the diagram above, the powers of 2 are mapped to each bit from right to left in ascending order. In the slots where the value is 1, the power values are summed up to fetch the resulting number. In the case above, the slots with the power of 4 and 1, have the values 1, which when added up deliver the result of 5 in the decimal numbering system.

We can you the `bin()` function in Python to quickly view the binary representation of a number. The `0b` in this output denotes that the number is in the binary system.

<codeblock language="python" type="lesson">
<code>
print(bin(5))
print(bin(0))
print(bin(15))
</code>
</codeblock>

Now that we have a basic understanding of how data is stored in bits, we can explore some of the basic bitwise operations.

