The `compress()` method helps us pick out elements from an iterable based on the values of another iterable. 

For example, say we have a list of students `["John", "Vishnu", "Kabir"]` and a  list of results containing a boolean indicating if the student has passed the test `[True, False, True]`. Now, using `compress()` we can select all the students from the student list who have passed i.e where the boolean is `True`.

<Editor lang="python">
<code>
import itertools

students = ["John", "Vishnu", "Kabir", "Shreya", "Rose"]
results = [True, False, True, True, False]

filtered = itertools.compress(students, results)
print(list(filtered))
</code>
</Editor>