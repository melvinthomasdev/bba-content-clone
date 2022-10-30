In some cases we may need to execute a statement only when a given condition is **NOT** true.
We can use the `not` keyword in our `if` statement to invert the result of our condition.
This will execute the statements only when the result evaluates to `False`.

<Editor lang="python">
<code>
signal = "red"

if not signal == "green":
  print("Stop")
</code>
</Editor>