Sarah is filtering out the cities in England from a list. Help her pick and print all the city names which end with *England*.

<codeblock language="python" type="exercise" testMode="fixedInput">
<code>
# Use if condition to print all the city names ending with England
cities = ["Dublin, Ireland", "London, England", "Glasgow, Scotland" ,"Liverpool, England", "Bristol, England", "Amsterdam, Netherlands"]
</code>

<solution>
# Use if condition to print all the city names ending with England
cities = ["Dublin, Ireland", "London, England", "Glasgow, Scotland" ,"Liverpool, England", "Bristol, England", "Amsterdam, Netherlands"]

for city in cities:
  if city.endswith("England"):
    print(city)
</solution>
</codeblock>