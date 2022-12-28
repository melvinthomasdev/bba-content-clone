Sometimes, we need multiple condition blocks to handle different cases. For example, identifying an animal based on the sounds they make.

- bark -> It's a Dog
- meow -> It's a Cat
- moo -> It's a Cow
- else -> Animal sound was not identified

<a/>

We can have such multiple conditions using the elif keyword.

<codeblock language="python" type="lesson">
<code>
sound = "moo"

if sound == "bark":
  print("Its a Dog")
elif sound == "meow":
  print("Its a Cat")
elif sound == "moo":
  print("Its a Cow")
else:
  print("Animal sound was not identified.")
</code>
</codeblock>

Python will go through each of these conditions, until one of them matches. If none of the if and elif conditions match, the else block will be executed.