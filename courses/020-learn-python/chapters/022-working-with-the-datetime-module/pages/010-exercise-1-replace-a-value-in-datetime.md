Now that the basic UI for his time machine is set up, Alexander wants to add a few additional features to it, to improve its usability. He has considered that a user might enter the wrong day, month, or year. He wants to add functionality wherein the user can edit the particular day/month/year and set it a new value.

Help him add this functionality using `datetime.replace()`.

The value to be changed is given in `updated_year`.


<Editor lang="python" type="exercise">
<code>
# Update the year of independence_day
# Print the text given above once done.

from datetime import datetime

independence_day = datetime(year=1947, month=8, day=15)
updated_year = 1997

# Update independence_day here
# updated_date =
print(f"Setting the travel destination date to {updated_date:%d %B %Y}.")
</code>

<solution>
from datetime import datetime

independence_day = datetime(year=1947, month=8, day=15)
updated_year = 1997

# Update independence_day here
updated_date = independence_day.replace(year=updated_year)
print(f"Setting the travel destination date to {updated_date:%d %B %Y}.")
</solution>
</Editor>