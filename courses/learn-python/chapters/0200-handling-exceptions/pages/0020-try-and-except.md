There are tons of errors that might occur while running our program. This can be due to an invalid input given by the user, a network or device issue, or our program trying to access data that is not available.

When an exception occurs, our program will automatically shut down and close. Such scenarios are highly undesirable in the real world, where people depend on software for their day-to-day activities.

To avoid such unforeseen errors shutting down our program, we can use the Try/Except blocks. The try/except block captures our error and lets us process it the way we like.

<codeblock language="python" type="lesson">
<code>
countries_and_capitals = {
  "India": "Delhi",
  "United Kingdom": "London",
  "Thailand": "Bangkok",
  "Russia": "Moscow",
}

countries_list = ["India", "Russia", "China", "Thailand"]

for country in countries_list:
  try:
    print(f"The capital of {country} is {countries_and_capitals[country]}")
  except:
    print(f"--- Key {country} does not exist ---")
</code>
</codeblock>

As we can see in the snippet above, we capture the error when the country is **China** by using a try block. We then print `Key {country} does not exist`, once the error is suppressed, and move on to the next country.

