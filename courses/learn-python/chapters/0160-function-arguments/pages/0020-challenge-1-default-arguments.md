Suraj missed the English test and hence does not have a score. Help Cia handle this case by using a default argument in the `get_result()` function. Set the default argument `score` to 0 when the argument is not provided.

<codeblock language="python" type="exercise" testMode="fixedInput">
<code>
# Set 0 as the default value for the argument score in the get_result function

name = "Suraj"
subject = "English"
date = "15/05/2022"

def get_result(score):
  if score >= 45:
    return "Passed"
  else:
    return "Failed"


print("-------------------------------------------------")
print(f"| Name: {name} \t\t| Date: {date} \t|")
print("-------------------------------------------------")
print(f"| Subject: {subject} \t| Score: --- \t\t|")
print("-------------------------------------------------")
print(f"| Result: \t\t| {get_result()} \t\t|")
print("-------------------------------------------------")
</code>

<solution>
# Set 0 as the default value for the argument score in the get_result function

name = "Suraj"
subject = "English"
date = "15/05/2022"

def get_result(score=0):
  if score >= 45:
    return "Passed"
  else:
    return "Failed"


print("-------------------------------------------------")
print(f"| Name: {name} \t\t| Date: {date} \t|")
print("-------------------------------------------------")
print(f"| Subject: {subject} \t| Score: --- \t\t|")
print("-------------------------------------------------")
print(f"| Result: \t\t| {get_result()} \t\t|")
print("-------------------------------------------------")
</solution>
</codeblock>