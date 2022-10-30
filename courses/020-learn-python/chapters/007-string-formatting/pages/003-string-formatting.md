Another way we can join different data types with strings is using the `format()` method.

<Editor lang="python">
<code>
name = "Akash"
age = 29
print("My name is {}. And my age is {}".format(name, age))
</code>
</Editor>

`.format()` replaces the `{}` in the string with the values provided to it. To be more specific with the values we can also name them as shown below.

<Editor lang="python">
<code>
name = "Akash"
age = 29
print("My name is {name}. And my age is {age}".format(name=name, age=age))
</code>
</Editor>