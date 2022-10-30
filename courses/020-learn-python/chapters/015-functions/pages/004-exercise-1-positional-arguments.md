Cia has realized she can improve her program by evaluating the score within a function itself and having it print the result accordingly.

Help her write a function where she can pass the score as an argument to the function `print_result`, and get the text as follows:

* If the score is, or over 45, print **You have passed the test with a score of X**.
* If the score is below 45, print **You have failed the test with a score of X**.

<Editor lang="python" type="exercise">
<code>
# Define a function print_result which accepts a score argument
# Evaluate the score and print the text accordingly
score = 43

# Call print_result with score as an argument
print_result(score)
</code>

<solution>
# Define a function print_result which accepts a score argument
# Evaluate the score and print the text accordingly

score = 43

def print_result(score):
  if score >= 45:
    print(f"You have passed the test with a score of {score}")
  else:
    print(f"You have failed the test with a score of {score}")

# Call print_result with score as an argument
print_result(score)
</solution>
</Editor>