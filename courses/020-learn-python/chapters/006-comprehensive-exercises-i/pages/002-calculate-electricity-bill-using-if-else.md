Vivian's home electricity bill is calculated based on the below criteria.

| Unit Range  | Price per unit    |
| ----------- | ----------------- |
| 000 - 100   | ₹1.5              |
| 101 - 200   | ₹2.5              |
| 201 - 300   | ₹4.0              |
| 301 - 350   | ₹5.0              |
| Above 350   | ₹1500 fixed charge |

Vivian checked his electricity meter which showed a total of **241 units** consumption.

Write a program that will calculate and print the amount that Vivian has to pay.




<Editor lang="python" type="challenge">
<code>
units = 241
</code>

<solution>
units = 241
amount = 0.0

if 0 <= units <= 100:
  amount = units * 1.5
elif 101 <= units <= 200:
  amount = units * 2.5
elif 201 <= units <= 300:
  amount = units * 4.0
elif 300 <= units <= 350:
  amount = units * 5.0
elif units > 350:
  amount = 3500

print(amount)
</solution>
</Editor>