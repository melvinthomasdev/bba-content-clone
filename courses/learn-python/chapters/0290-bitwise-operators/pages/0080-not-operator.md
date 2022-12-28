The **NOT** operation is simple and easy to grasp. The purpose of the NOT operator is to just invert the existing bits. i.e if the input is 0 the output is 1 and vice versa. The NOT operator is represented by the `~`(tilde) sign in Python.

The NOT operator is a unary operator in Python, which means, that it only takes in one operand as the input. In the example image below, the bits of 10 are inverted using the NOT operator. 0's are switched to 1 and 1's are switched to 0's.

<image>not.png</image>

The NOT operator in Python has a peculiar result that differs from the one shown above. As we can see in the operation below, the number 10 is represented by `1010`. However after we add a `~` to it, we receive `-1011` and not our expected `101`. This is because of the way Python displays negative integers.

<codeblock language="python" type="lesson">
<code>
print(10, "\t = ", bin(10))
print(~10, "\t = ", bin(~10))
</code>
</codeblock>

You can view the correct result using something called a bit mask.  We will go into depth on it in later chapters. But for now, we will just apply it to the result using `& 0xf`. This should print out the correct result as shown below.

<codeblock language="python" type="lesson">
<code>
print(bin(~10 & 0xf))
</code>
</codeblock>