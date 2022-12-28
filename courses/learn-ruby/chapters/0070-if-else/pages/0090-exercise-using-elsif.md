Change the code, so that
if the score is more than 40 but less
than 60, print **You got C grade**.



<codeblock language="ruby" type="exercise" testMode="fixedInput">
<code>
score = 58

if score > 80
  puts "You got A grade."
elsif score > 60
  puts "You got B grade"
else
  puts "You did not get A grade. Good luck next time."
end
</code>

<solution>
score = 58

if score > 80
  puts "You got A grade."
elsif score > 60
  puts "You got B grade"
elsif score > 40
  puts "You got C grade"
else
  puts "You did not get a grade. Good luck next time."
end
</solution>
</codeblock>