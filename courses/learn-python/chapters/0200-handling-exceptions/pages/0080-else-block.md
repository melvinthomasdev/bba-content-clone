The Else block in a try/except statement is executed when none of the except blocks are executed i.e no error is thrown.

<codeblock language="python" type="lesson">
<code>
countries_and_capitals = {
  "India": "Delhi",
  "United Kingdom": "London",
  "Thailand": "Bangkok",
  "Russia": "Moscow",
}

countries_list = ["India", "Russia", "China", "Thailand"]

try:
  country = countries_list[0]
  capital = countries_and_capitals[country]
  print(f"The capital of {country} is {capital}")
except KeyError:
  print("Key was not found in dictionary")
except IndexError:
  print("Index does not exist in List")
else: # <--- Else Block
  print("No Error Occurred")
</code>
</codeblock>

You could change the index from 0 to 10 on line 11 and see the output.
