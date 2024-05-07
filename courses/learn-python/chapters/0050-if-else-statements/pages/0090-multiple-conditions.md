Python allows us to join multiple conditions for one if/elif statement.

For example, we can check if the `sky` is "cloudy" and if the `weather` is "humid" to determine if it will rain.

Python provides two inbuilt keywords to help us join multiple conditions together.

## and

The `and` keyword is used to ensure that both conditions should pass for the print statement to execute. If even one of the condition fails, the print statement is skipped.

<codeblock language="python" type="lesson">
<code>
sky = "cloudy"
weather = "humid"

if sky == "cloudy" and weather == "humid":
  print("It will rain today")
</code>
</codeblock>

## or

The `or` keyword is used to ensure that any one of the conditions should pass for the print statement to execute. If both conditions fail, the print statement is skipped.

<codeblock language="python" type="lesson">
<code>
sky = "sunny"
weather = "humid"

if sky == "cloudy" or weather == "humid":
  print("It might rain today")
</code>
</codeblock>