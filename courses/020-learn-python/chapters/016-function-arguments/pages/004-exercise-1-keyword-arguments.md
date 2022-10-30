Cia has wrapped the report card formatting code within a function `generate_report_card` so that she can generate a report card dynamically based on the student data given to it. She passed on this function to her colleagues so that they can feed in the student data i.e.  subject, score, name of the student, and date of the test, and generate the report card. However, few of them found it difficult to use as they didn't know in which order to pass these arguments.

In order to make the arguments for the function clear, Cia has decided to make these arguments into keyword arguments instead, so that the order won't matter. Help Cia by converting the arguments of `generate_report_card` to keyword arguments. Call the function once done.

<Editor lang="python" type="exercise">
<code>
# Convert the argument of generate_report_card to keyword arguments

name = "Alice"
score = 55
subject = "English"
date = "15/05/2022"

def get_result(score=0):
  if score >= 45:
    return "Passed"
  else:
    return "Failed"

def generate_report_card(name, date, subject, score=0):
  print("-------------------------------------------------")
  print(f"| Name: {name} \t\t| Date: {date} \t|")
  print("-------------------------------------------------")
  print(f"| Subject: {subject} \t| Score: {score} \t\t|")
  print("-------------------------------------------------")
  print(f"| Result: \t\t| {get_result(score)} \t\t|")
  print("-------------------------------------------------")


generate_report_card(name=name, date=date, subject=subject, score=score)
</code>

<solution>
# Convert the argument of generate_report_card to keyword arguments

name = "Alice"
score = 55
subject = "English"
date = "15/05/2022"

def get_result(score=0):
  if score >= 45:
    return "Passed"
  else:
    return "Failed"

def generate_report_card(*, name, date, subject, score=0):
  print("-------------------------------------------------")
  print(f"| Name: {name} \t\t| Date: {date} \t|")
  print("-------------------------------------------------")
  print(f"| Subject: {subject} \t| Score: {score} \t\t|")
  print("-------------------------------------------------")
  print(f"| Result: \t\t| {get_result(score)} \t\t|")
  print("-------------------------------------------------")


generate_report_card(name=name, date=date, subject=subject, score=score)
</solution>
</Editor>