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

Use `if` and **range** conditions to solve this problem.

<codeblock language="ruby" type="exercise" testMode="fixedInput">
<code>
score = 28
</code>

<solution>
score = 28

if score == 100
  puts "You got A+ grade."
end

if (81...100).include? score
  puts "You got A grade"
end

if (61...81).include? score
  puts "You got B grade"
end

if (0...61).include? score
  puts "You got C grade"
end
</solution>
</codeblock>