Python also provides us with the error details of an exception that occurs within a try-catch block. These details are available within a variable declared within the `except` block.

<Editor lang="python">
<code>
try:
  40 / 0
except ZeroDivisionError as e:
  print(e)
</code>
</Editor>

In the snippet above, the error details are stored in `e`. Printing `e` shows us the text of the exception error that occurred.

