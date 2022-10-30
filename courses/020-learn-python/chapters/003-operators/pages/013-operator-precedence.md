One thing we have to keep in mind while doing arithmetic operations in Python is the order of operations, which defines the sequence in which the operation would be evaluated.

In simple terms, if we give an expression such as `3 + 4 / 2` the expression should be evaluated in the following order:

- 4 / 2 = 2
- 3 + (4/2)
- 3 + 2 = 5

This is due to the properties of the mathematical operators, which prioritize the multiplicative and divisive operators over the additive and subtractive operators. Hence the result of the above expression will be `0`.

We can also visualize this operation as a tree.

<Image>ops.png</Image>

The nodes at the bottom are executed first as their operators have higher precendence.

<Editor lang="python">
<code>
print(3 + 4 / 2)
</code>
</Editor>


Following is a table depiction the operator precedence in Python:

| Operators   | Priority    |
| ----------- | ----------- |
| ()          | 1           |
| **          | 2           |
| *, /, //, % | 3           |
| +, -        | 4           |

The Parentheses has the highest precedence within the order of operations in Python, followed by the exponent operator. We can override the default operator precedence in the given operation using parentheses `()`. If we wanted to execute the expression in the order in which its operators appear, we could provide the expression in the following manner:

<Editor lang="python">
<code>
print(((3 + 4) / 2))
</code>
</Editor>

This expression would be evaluated in the following way:

1. (3 + 4) = 7
2. 7 / 2  =  3.5

&nbsp;

As you can see, the result is now 3.5 instead. This is because the `+` operator will now execute before the `/` operator due to the added paratheses, which gives `(3 + 4)` a higher execution priority.

Following is a diagram depicting the operation  as a tree.

<Image>ops2.png</Image>