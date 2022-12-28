Now that the start screen of his time machine shows the current date and time in an intuitive way, Alexander wants to take in the date and time that the user wants to travel to and process the same.

Help him create a `datetime` object with the given date and time so that he can use the same within the time machine. Print the text **Setting the travel destination date to dd MMM yyyy**.

Example: Setting the travel destination date to 15 August 1947.


<codeblock language="python" type="exercise" testMode="fixedInput">
<code>
# Create datetime object using the following details
# Print the text given above with the datetime object
from datetime import datetime

date = 15
month = 8
year = 1947

# Initialize the date on the next line
destination =
print(f"Setting the travel destination date to {destination:%d %B %Y}.")
</code>

<solution>
from datetime import datetime

date = 15
month = 8
year = 1947

destination = datetime(year=year, month=month, day=date)
print(f"Setting the travel destination date to {destination:%d %B %Y}.")
</solution>
</codeblock>