Sometimes a block can throw multiple types of error messages. In such cases, we might want to handle these types of errors, in a different way. Python allows us to explicitly specify the type of exception we wish to capture in the catch block and handle it accordingly. We can also declare multiple catch blocks.

<codeblock language="python" type="lesson">
<code>
countries_and_capitals = {
  "India": "Delhi",
  "United Kingdom": "London",
  "Thailand": "Bangkok",
  "Russia": "Moscow",
}

countries_list = ["India", "Russia", "China", "Thailand"]

for i in range(len(countries_list) + 1):
  try:
    country = countries_list[i]
    print(f"The capital of {country} is {countries_and_capitals[country]}")
  except KeyError:
    print(f"--- Key {countries_list[i]} does not exist ---")
  except IndexError:
    print(f"--- Index {i} is not present in countries_list ---")
</code>
</codeblock>