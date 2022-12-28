Lambda functions are one-liner functions. They are defined by using `lambda` instead of `def`, and return the result of the one line of code without requiring the `return` statement.

<codeblock language="python" type="lesson">
<code>
square = lambda x: x * x
print(square(3))
print(square(4))
</code>
</codeblock>


The code above defines a Lambda function that takes in an input `x `and returns its square. The lambda is then assigned to variable `square` that can be called in a similar way to a normal function.