A named tuple is a variant of a tuple whose values can be accessed by a given attribute instead of indices. For example, the following is a tuple with a person's details.

<codeblock language="python" type="lesson">
<code>
person = ("Jonathan", 34, "Goa, India")
print(f"{person[0]} is {person[1]} years old coming from {person[2]}.")
</code>
</codeblock>

Instead of using indices in `print()`, we could make the code a bit clear with a Named Tuple.

<codeblock language="python" type="lesson">
<code>
from collections import namedtuple

Person = namedtuple('Person', ['name', 'age', 'place'])
person = Person("Jonathan", 34, "Goa, India")

print(f"{person.name} is {person.age} years old coming from {person.place}.")
</code>
</codeblock>