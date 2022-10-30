The time machine is almost ready. One last thing Alexander noticed after using his machine, is that he often wants to quickly travel 1 day ahead into the future, or two days behind. Instead of calculating a new date and entering it into his system, he plans to use `timedelta` to implement this functionality.

Help Alexander travel the days given into the future or past using timedelta. The number of days is available in the `travel_days` variable.


<Editor lang="python" type="exercise">
<code>
# Calculate the delta using travel days and add it to destination_date
# Store the result in new_destination_date

from datetime import datetime, timedelta

destination_date = datetime(year=2022, month=12, day=25)
travel_days = +7

# Uncomment and assign new date to the variable below
# new_destination_date =

print(f"Setting the travel destination date to {new_destination_date:%d %B %Y}.")
</code>

<solution>
from datetime import datetime, timedelta

destination_date = datetime(year=2022, month=12, day=25)
travel_days = +7

travel_delta = timedelta(days=travel_days)
new_destination_date = destination_date + travel_delta

print(f"Setting the travel destination date to {new_destination_date:%d %B %Y}.")
</solution>
</Editor>