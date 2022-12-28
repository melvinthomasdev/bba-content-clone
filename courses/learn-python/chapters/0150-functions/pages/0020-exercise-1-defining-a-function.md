Cia is building a program to generate a Report Card for students. She has to check if the student has scored greater than or equal to 45 marks. If they have, she has to print **You have passed**. If they have scored fewer marks, she has to print **You have failed**. To simplify the print code, she has decided to add the two print statements in the functions `print_passed` and `print_failed`.

Help Cia build this program by defining two functions that print the text given above. i.e When `print_passed` is called, print **You have passed**. When `print_failed `is called print **You have failed**.

<codeblock language="python" type="exercise" testMode="fixedInput">
<code>
# Define the functions print_passed and print_failed as specified above.
# Call the functions accordingly as per the score.

# define print_passed

# define print_failed

score = 65
if score >= 45:
  # call print_passed

else:
  # call print failed
</code>

<solution>
# Define the functions print_passed and print_failed as specified above.
# Call the functions accordingly as per the score.

# define print_passed
def print_passed():
  print("You have passed")

# define print_failed
def print_failed():
  print("You have failed")

score = 65
if score >= 45:
  # call print_passed
  print_passed()

else:
  # call print failed
  print_failed()
</solution>
</codeblock>