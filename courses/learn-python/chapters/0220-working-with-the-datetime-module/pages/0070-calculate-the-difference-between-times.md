`datetime` objects can be subtracted from each other to find the difference between times. This operation returns a `timedelta` object which has only the attributes days, seconds, and microseconds.

<codeblock language="python" type="lesson">
<code>
from datetime import datetime

christmas_day = datetime(year=2022, month=12, day=25)
time_left = christmas_day - datetime.now()

print(f"There are {time_left.days} days left for Christmas.")
</code>
</codeblock>