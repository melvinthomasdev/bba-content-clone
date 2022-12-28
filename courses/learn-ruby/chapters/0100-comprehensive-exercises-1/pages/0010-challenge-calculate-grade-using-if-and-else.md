John took a Math test.
He got a score of 28 out
of 100.

Write a program that
will print John's grade
based on the following
conditions:

* If the score is 100, then print **You got A+ grade**.
* If the score is more than 80 and less than 100, then print **You got A grade**.
* If the score is more than 60 and less than 81, then print **You got B grade**.
* If the score is 60 or less than 60, then print **You got C grade**.

Use `if` and `else`
conditions to solve
this problem.



<codeblock language="ruby" type="exercise" testMode="fixedInput">
<code>
score = 28
</code>

<solution>
score = 28

if score == 100
  puts "You got A+ grade"

elsif score > 80 and score < 100
  puts "You got A grade"

elsif score > 60 and score < 81
  puts "You got B grade"

elsif score < 61
  puts "You got C grade"
end
</solution>
</codeblock>