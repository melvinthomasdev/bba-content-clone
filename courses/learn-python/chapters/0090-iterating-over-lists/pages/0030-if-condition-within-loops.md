We can add an if condition within the **for loop** to execute statements if they match a particular condition.

<codeblock language="python" type="lesson">
<code>
names = ["Will Granda", "Thomas Cooper", "Charlie Mitchell", "Pepper Cooper", "Samantha Cooper"]
for name in names:
  if name.endswith("Cooper"):
    print(name)
</code>
</codeblock>

The example above checks if a name ends with **Cooper** and prints them to the screen.