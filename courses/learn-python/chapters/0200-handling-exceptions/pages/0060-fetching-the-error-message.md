Python also provides us with the error details of an exception that occurs within a try-catch block. These details are available within a variable declared within the `except` block.

<codeblock language="python" type="lesson">
<code>
try:
  40 / 0
except ZeroDivisionError as e:
  print(e)
</code>
</codeblock>

In the snippet above, the error details are stored in `e`. Printing `e` shows us the text of the exception error that occurred.

