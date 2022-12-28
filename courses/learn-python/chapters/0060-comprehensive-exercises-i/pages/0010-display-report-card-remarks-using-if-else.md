Ajay took a Math test.
He scored 28 out of 100.

Write a program that will print Ajay's report card remarks based on the following conditions:

* If the score is 100, then print **Outstanding**.
* If the score is more than 80 and less than 100, then print **Excellent**.
* If the score is more than 60 and less than 81, then print **Good**.
* If the score is 60 or less than 60, then print **Can do better!**.

Use `if`, `elif` and `else` conditions to solve this problem.



<codeblock language="python" type="exercise" testMode="fixedInput">
<code>
score = 28
</code>

<solution>
score = 28

if score == 100:
  print("Outstanding")
elif 80 < score < 100:
  print("Excellent")
elif 60 < score < 81:
  print("Good")
elif score < 61:
  print("Can do better!")
</solution>
</codeblock>