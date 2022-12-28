Python provides specialized modules for working with dates and times. One of the most popular modules for the same is the `datetime` module. 

With the `datetime` module we can get the current date and time on our system.

<codeblock language="python" type="lesson">
<code>
from datetime import datetime
print(datetime.now())
</code>
</codeblock>

We can also fetch details like the year, month and day from `datetime.now()`.

<codeblock language="python" type="lesson">
<code>
from datetime import datetime
today = datetime.now()

print(f"The day today is {today.day}")
print(f"The month is {today.month}")
print(f"The year is {today.year}")

# We can also do the same for hour, minutes and seconds
print(f"The hour is {today.hour}")
print(f"The minute is {today.minute}")
print(f"The second is {today.second}")
</code>
</codeblock>