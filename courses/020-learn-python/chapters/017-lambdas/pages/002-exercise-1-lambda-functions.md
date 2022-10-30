Cia wants to use a Lambda function to check if a student has passed or failed. If a student has scored 45 or more marks, they have passed, else they have failed. Help Cia write a lambda function for the same.

Return **Passed** if score is above or equal to 45. Else return **Failed**.

<Editor lang="python" type="exercise">
<code>
# Write a lambda function to check if a student has passed or failed
score = 56

# Assign the function to check_result
# check_result =

print(check_result(score))
</code>

<solution>
# Write a lambda function to check if a student has passed or failed

score = 56

# Assign the function to check_result
check_result = lambda x: "Passed" if x >= 45 else "Failed"
print(check_result(score))
</solution>
</Editor>