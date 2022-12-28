If we try to append a number to a string and print it, it throws the following error:

<codeblock language="python" type="lesson">
<code>
name = "Akash"
age = 29
print("My name is " + name + ". And my age is " + age)
</code>
</codeblock>

Python does not support the joining of different data types.

In order to join a number value with a string, we must first use the str function to convert the value to a String.

<codeblock language="python" type="lesson">
<code>
name = "Akash"
age = 29
print("My name is " + name + ". And my age is " + str(age))
</code>
</codeblock>

`str()` essentially converts a number to a string. This value can then be joined with another string.