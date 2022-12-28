Sometimes we might want to add or subtract a number of days to/from our date. For this, we use the `timedelta()` function.

<codeblock language="python" type="lesson">
<code>
from datetime import timedelta, datetime

print(f"Today: {datetime.now()}")

# Adds two days
add_two_days = timedelta(days=+2)
print(f"Two days later: {datetime.now() + add_two_days}")

# Adds 1 week
add_one_week = timedelta(weeks=+1)
print(f"One week later: {datetime.now() + add_one_week}")

# Subracts 1 day
subtract_one_day = timedelta(days=-1)
print(f"Yesterday: {datetime.now() + subtract_one_day}")
</code>
</codeblock>

The `timedelta` object adds or removes weeks, days, and time. For example, we could also add an hour to our time.

<codeblock language="python" type="lesson">
<code>
from datetime import timedelta, datetime

deadline = datetime.now() + timedelta(hours=+1)
print(f"I will finish the work by {deadline:%I:%M %p}")
</code>
</codeblock>