The `groupby()` function does exactly what its name says. Using `groupby()` we can group values of an iterable together based on a certain condition. The one quirk of this function is that it expects the iterable to be in sorted order. Hence we need to sort our lists before we use them.

In the example below we are grouping names based on their first character.

<codeblock language="python" type="lesson">
<code>
import itertools

students = ["John", "Jishnu", "Vishnu", "Kabir", "Vinod", "Shreya", "Vikas", "Rose"]
students.sort() # <-- sort list
groups = itertools.groupby(students, lambda x: x[1])

for group, values in groups:
  print(group, " --- ", list(values))
</code>
</codeblock>