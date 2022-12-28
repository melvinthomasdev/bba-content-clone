Cia wants to use a Lambda function to check if a student has passed or failed. If a student has scored a percentage of 45 or more, they have passed, else they have failed. Help Cia write a lambda function for the same. Use map to iterate through the marks and return "Passed"/"Failed", based on the percentage.

<codeblock language="python" type="exercise" testMode="fixedInput">
<code>
# Convert student marks to percent.
# There are 6 subjects of 100 marks each
# To get the percent we divide the marks scored by 6

marks_scored = [502, 482, 398, 403, 356]
</code>

<solution>
# Convert student marks to percent.
# There are 6 subjects of 100 marks each
# To get the percent we divide the marks scored by 6

marks_scored = [502, 482, 398, 403, 356]
percentages_scored = list(map(lambda x: "Passed" if x / 6 >= 45 else "Failed", marks_scored))
print(percentages_scored)
</solution>
</codeblock>