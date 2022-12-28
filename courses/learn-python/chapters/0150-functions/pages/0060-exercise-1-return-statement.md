Cia is now printing the entire report card with the details of the Student too. She wants to modify the program so that she just receives the result of the student given the score to the function. She can then use this result within the Report Card.

Help Cia by creating a function that returns the **Passed** if the student scores 45 or more marks, and **Failed** if the student scores less than 45. Use the returned value within the print statements in the report card.


<codeblock language="python" type="exercise" testMode="fixedInput">
<code>
# Define a function get_result which accepts a score argument
# Call print_result with score as an argument
# Evaluate the score and return the text accordingly

name = "Alice"
score = 55
subject = "English"
date = "15/05/2022"

def get_result(score):
  # Return Passed if score is or greater than 45
  # Return Failed otherwise
  ...


print("-------------------------------------------------")
print(f"| Name: {name} \t\t| Date: {date} \t|")
print("-------------------------------------------------")
print(f"| Subject: {subject} \t| Score: {score} \t\t|")
print("-------------------------------------------------")
print(f"| Result: \t\t| {get_result(score)} \t\t|")
print("-------------------------------------------------")
</code>

<solution>
# Define a function get_result which accepts a score argument
# Call print_result with score as an argument
# Evaluate the score and return the text accordingly

name = "Alice"
score = 55
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
print(f"| Subject: {subject} \t| Score: {score} \t\t|")
print("-------------------------------------------------")
print(f"| Result: \t\t| {get_result(score)} \t\t|")
print("-------------------------------------------------")
</solution>
</codeblock>