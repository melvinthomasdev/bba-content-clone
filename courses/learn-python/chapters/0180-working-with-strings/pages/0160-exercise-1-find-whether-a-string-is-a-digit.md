Patil has just started his first day at ABC Labs. As a beginner, he is assigned the task to check if the customer input for age is a valid number. He is given a list containing the age of different customers.

Help Patil write a program to filter and process the correct age into a new list.

**Instructions**

1. Check if the given age is an `int` using `type()`.
2. If it is add it to the new list `verified_age`.
3. If it is not, check whether the age is a string.
4. If it is a string, check if the string is a valid number by using `isdigit()`.
5. If it is a valid number, convert it to a number using `int()` and store it back in the list.
6. If the value is not a string or a valid number, then ignore the value.

<codeblock language="python" type="exercise" testMode="fixedInput">
<code>
# Filter and process all the age values in the age_list. Store the valid values in verified age.
age_list = [23, 45, "53", "45", 67, 22, 34, "23.45", "ab"]
verified_age = []

# Filter here


print(verified_age)
</code>

<solution>
# Filter and process all the age values in the age_list. Store the valid values in verified age.
age_list = [23, 45, "53", "45", 67, 22, 34, "23.45", "ab"]
verified_age = []

for age in age_list:
  if type(age) == int:
    verified_age.append(age)
  elif type(age) == str:
    if age.isdigit():
      verified_age.append(int(age))

print(verified_age)
</solution>
</codeblock>