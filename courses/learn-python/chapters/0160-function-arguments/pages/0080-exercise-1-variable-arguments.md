Some of the students have an optional number additional subjects which they can take. Therefore while calculating the student percentage, Cia has to accommodate a variable number of subjects.

Help Cia calculate the same by accepting a variable number of arguments in `calculate_percentage`. Note that each subject is given as a keyword argument and is worth 100 marks. The formula for fetching the percentage of a student is `sum of subjects /  number of subjects`.

<codeblock language="python" type="exercise" testMode="fixedInput">
<code>
# Accept scores as variable keyword arguments and calculate the percentage

def calculate_percentage(scores):
  # accept variable number of arguments
  # calculate and return percentage
  pass

percentage = calculate_percentage(hindi=45, english=76, marathi=66, maths=87, science=78)
print(f"The percentage is {percentage}%")
</code>

<solution>
# Accept scores as variable keyword arguments and calculate the percentage

def calculate_percentage(**scores):
  return sum(scores.values()) / len(scores)

percentage = calculate_percentage(hindi=45, english=76, marathi=66, maths=87, science=78)
print(f"The percentage is {percentage}%")
</solution>
</codeblock>