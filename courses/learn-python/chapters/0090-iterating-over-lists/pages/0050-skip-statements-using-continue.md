The `continue` keywords allows us to skip executing the current iteration of the loop and move to the next one.

For example the snippet below prints "I am a `fruit`" for every fruit in the list except for the fruits which have the word `apple` in them.

<codeblock language="python" type="lesson">
<code>
fruits = ["Banana", "Kiwi", "Pineapple", "Strawberry"]
for fruit in fruits:
  if "apple" in fruit:
    continue

  print(f"I am {fruit}")
</code>
</codeblock>