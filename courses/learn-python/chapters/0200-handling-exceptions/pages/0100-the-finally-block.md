The finally block in a try-except statement, contains code that will be run irrespective of if there was an error or not i.e It will always be run.


This is an example with an error:

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
  country = countries_list[4]
  capital = countries_and_capitals[country]
  print(f"The capital of {country} is {capital}")
except KeyError:
  print("Key was not found in dictionary")
except IndexError:
  print("Index does not exist in List")
else:
  print("No Error Occurred")
finally:
  print("Runs irrespective of occurrence of error.")
</code>
</codeblock>

This is an example with no error occurring:

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
else:
  print("No Error Occurred")
finally:
  print("Runs irrespective of occurrence of error.")
</code>
</codeblock>
