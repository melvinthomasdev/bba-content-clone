Given below is a list of car owners. The list contains tuples that are in the form of `(owner name, car)`.  Your task is to use the `groupby()` function and print which car is owned by whom. Make sure you sort the list by car name before you group the tuples.


<codeblock language="python" type="exercise" testMode="fixedInput">
<code>
# Group owners by the car they own

import itertools

car_owners = [("Rishi", "XUV"), ("Lizzy", "Scorpio"), ("Boris", "Swift"), ("Theresa", "Civic"), ("Winston", "Civic"), ("Taylor", "Swift"), ("Cameron", "XUV")]

# sort car_owners by car name

# group owners by car using groupby
# grouping = 

for car, owners in grouping:
  print(f"{car} is owned by", ', '.join(map(lambda x: x[0], owners)))
</code>

<solution>
import itertools

car_owners = [("Rishi", "XUV"), ("Lizzy", "Scorpio"), ("Boris", "Swift"), ("Theresa", "Civic"), ("Winston", "Civic"), ("Taylor", "Swift"), ("Cameron", "XUV")]

car_owners.sort(key=lambda x: x[1])
grouping = itertools.groupby(car_owners, lambda x: x[1])

for car, owners in grouping:
  print(f"{car} is owned by", ', '.join(map(lambda x: x[0], owners)))
</solution>
</codeblock>