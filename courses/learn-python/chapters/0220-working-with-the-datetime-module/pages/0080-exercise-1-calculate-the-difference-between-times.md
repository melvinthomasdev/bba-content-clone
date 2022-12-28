Now that Alexander has built the UI to take in an input date, he would like to calculate the number of days he has to travel back in time to get to  the day that the user has given.

Help him do this by checking the difference between the current date and the destination date.



<codeblock language="python" type="exercise" testMode="fixedInput">
<code>
# Calculate the day difference to find out the number of days the user has to travel back in time

from datetime import datetime

independence_day = datetime(year=1947, month=12, day=25)
current_date = datetime.now()

# Calculate the difference
# delta =

# Update X with the number of days in the following print statement
print(f"Travelling X days back in the past.")
</code>

<solution>
# Calculate the day difference to find out the number of days the user has to travel back in time

from datetime import datetime

independence_day = datetime(year=1947, month=12, day=25)
current_date = datetime.now()

# Calculate the difference
delta = current_date - independence_day

# Update X with the number of days in the following print statement
print(f"Travelling {delta.days} days back in the past.")
</solution>
</codeblock>