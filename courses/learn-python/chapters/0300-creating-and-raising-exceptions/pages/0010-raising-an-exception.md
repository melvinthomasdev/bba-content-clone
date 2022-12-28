There will be instances where we would like to throw an error in our program. For example, if the user has not entered his name in a form, or has specified an incorrect age such as `999`. In such instances, we would want to have an exception raised, to notify the user that the program cannot proceed further due to invalid inputs.

To throw such errors, we can use the `raise` keyword.

<codeblock language="python" type="lesson">
<code>
age = 999

if not 1 <= age <= 100:
  raise Exception("Invalid age value provided.") # <-- Exception is raised
</code>
</codeblock>