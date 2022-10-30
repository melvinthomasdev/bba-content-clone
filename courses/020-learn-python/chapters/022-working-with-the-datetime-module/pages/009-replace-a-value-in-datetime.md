To replace any value like a year, month, date, hour, etc within the date or time in the `datetime` object we can use the `replace()` method.

<Editor lang="python">
<code>
from datetime import datetime

christmas_day = datetime(year=2022, month=12, day=25)

# can use year, month, day, hour, minute, microsecond
last_christmas = christmas_day.replace(year=2021)

time_since = datetime.now() - last_christmas

print(f"It has been {time_since.days} days since the last Christmas")
</code>
</Editor>