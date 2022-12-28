Python supports multiple formatting options to show the date and time in a human-readable format.

<codeblock language="python" type="lesson">
<code>
from datetime import datetime
today = datetime.now()

print(f"It is {today:%A}, the {today:%d} of {today:%B} {today:%Y}")
</code>
</codeblock>

The characters preceded with a `%` are called format codes and translate to a value in Python. The `%A` here translates to the name of the current weekday. `%d` translates to the current date of the month, while `%B` and and `%Y` translates to the month name and current year.

<codeblock language="python" type="lesson">
<code>
from datetime import datetime
today = datetime.now()

print(f"It is day {today:%w} of the week.")
</code>
</codeblock><codeblock language="python" type="lesson">
<code>
from datetime import datetime
today = datetime.now()

print(f"It is {today:%a %d, %Y}")
</code>
</codeblock>

These are some of the format codes present in Python.

| Code | Description            | Example  |
|------|------------------------|----------|
| %d   | day of the month       | 08       |
| %m   | month of the year      | 12       |
| %y   | year in two digits     | 93       |
| %Y   | year in four digits    | 1993     |
| %a   | abv. name of the day   | Sun      |
| %A   | full name of the day   | Sunday   |
| %b   | abv. name of the month | Dec      |
| %B   | full name of the month | December |
| %H   | hour in 24h format     | 14       |
| %I   | hour in 12h format     | 02       |
| %M   | minute of the hour     | 30       |
| %S   | second of the minute   | 40       |
| %p   | AM/PM                  | PM       |

