You are building a program for a hospital that automatically takes in the patient details. i.e Name, Age, Gender, Issue. Based on these details you are to print a form which will be submitted to the doctors.

You are already given a basic template below. Convert the strings into an f-string and add the details provided to print the strings with the details.

<Editor lang="python" type="exercise">
<code>
# Add the details mentioned below to the print statements given below.
# i.e Name:   Bob
# Use F-strings

name = "Bob"
age = 24
gender = "Male"
issue = "Severe chest pain"

print("-------- ABC HOSPITTAL -----------")
print("Name:\t\t")
print("Age:\t\t")
print("Gender:\t\t")
print("Issue:\t\t")
</code>

<solution>
name = "Bob"
age = 24
gender = "Male"
issue = "Severe chest pain"

print("-------- ABC HOSPITTAL -----------")
print(f"Name:\t\t {name}")
print(f"Age:\t\t {age}")
print(f"Gender:\t\t {gender}")
print(f"Issue:\t\t {issue}")
</solution>
</Editor>