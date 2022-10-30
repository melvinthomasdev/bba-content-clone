Your boss has assigned you a task to convert a set of dates to a human-readable text format that anyone can easily understand. You have written a function `date_to_text()` to do the same. 

You now want to pass all the dates from the list `dates`, to this function and get the results. Use the `starmap()` method to do the same and print the results on the screen.


<Editor lang="python" type="exercise">
<code>
# Convert all dates to text format

import itertools
from datetime import datetime

dates = [(12, 3, 2015), (3, 4, 2020), (4, 6, 2012), (8, 12, 1993), (26, 11, 1989)]

def date_to_text(day, month, year):
  date = datetime(year, month, day)
  return f"{date:%A, %B %d, %Y}"

# Pass every date to date_to_text using starmap
# iterator = 

print(list(iterator))
</code>

<solution>
import itertools
from datetime import datetime

dates = [(12, 3, 2015), (3, 4, 2020), (4, 6, 2012), (8, 12, 1993), (26, 11, 1989)]

def date_to_text(day, month, year):
  date = datetime(year, month, day)
  return f"{date:%A, %B %d, %Y}"


iterator = itertools.starmap(date_to_text, dates)
print(list(iterator))
</solution>
</Editor>