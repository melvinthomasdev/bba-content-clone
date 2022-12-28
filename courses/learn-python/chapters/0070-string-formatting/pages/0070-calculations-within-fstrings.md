We can also do operations within an F-string. Any Python statement can be evaluated within the `{}` in an F-string. The result of this operation/statement is printed within the F-String.

<codeblock language="python" type="lesson">
<code>
name = "tom"
age = 32
print(f"My name is {name.capitalize()}. I was born in {2022-age}")
</code>
</codeblock>

The `capitalize()` method here capitalizes the first letter of the string. ie. `tom` becomes `Tom.`

