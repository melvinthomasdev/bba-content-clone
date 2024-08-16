Alexander finds his previous start screen which displays the date very unintuitive.  He wants to change the way the date and time are displayed. He has decided to show the text in the current format:

**The current date is dd MMM yyyy and the time is hh:mm AM/PM.**

Example: The current date is 24 Feb 2022 and the time is 09:22 AM**.**

Use formatting codes to implement the same.


<codeblock language="python" type="exercise" testMode="fixedInput"  cache="false">
<code>
# Print the current date and time in the format **The current date is dd MMM yyyy and the time is hh:mm AM/PM.** using format codes

from datetime import datetime
today = datetime.now()

# change the following line to accommodate format codes
print(f"The current date is dd MMM yyyy and the time is hh:mm AM/PM.")
</code>

<solution>
# Print the current date and time in the format **The current date is dd MMM yyyy and the time is hh:mm AM/PM.** using format codes

from datetime import datetime
today = datetime.now()

print(f"The current date is {today:%d %B %Y} and the time is {today:%I:%M %p}.")
</solution>
</codeblock>

These are some of the format codes present in Python:

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
