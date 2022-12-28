Marie would like to go for a movie. Based on the weather she has to decide what she is going to wear.

Use the if, elif and else condition, to check the weather and help Marie decide what to wear.
Following are the conditons:

- raining -> Wear a Raincoat
- sunny -> Wear a Hat
- cold -> Wear a Sweater
- else -> You do not need any additional wear

<codeblock language="python" type="exercise" testMode="fixedInput">
<code>
# Check the `weather` using if/elif/else conditions.
# Print the statements as per the conditions above
weather  = "cold"
</code>

<solution>
weather = "cold"

if weather  == "raining":
  print("Wear a Raincoat")
elif weather  == "sunny":
  print("Wear a Hat")
elif weather  == "cold":
  print("Wear a Sweater")
else:
  print("You do not need any additional wear")
</solution>
</codeblock>