Susy wants to store the list of planets and their radii in a nice readable format within Python. She has decided to go with using a Named tuple. Help Susy parse the CSV data of planets from `csv_data` and create a named tuple of Planet with it. Add this tuple to `planet_list` and print it.

The attributes of the Planet tuple will be `name` and `radius`.


<Editor lang="python" type="exercise">
<code>
# Create a list of named tuples of planets with the given csv data
csv_data = "Jupiter, 69911\nSaturn, 58232 km\nUranus, 25362 km\nNeptune, 24622 km\nEarth, 6371 km\nVenus, 6052 km\nMars, 3390 km\nMercury, 2440 km"

# Instantiate named tuple of planet with name and radius
# Planet = 
planet_list = []

for line in csv_data.split('\n'):
  name, radius = line.split(', ')
  # Create instance of planet tuple
#   planet_tuple = 
  planet_list.append(planet_tuple)
  
for planet in planet_list:
  print(f"The radius of {planet.name} is {planet.radius}")
</code>

<solution>
from collections import namedtuple

csv_data = "Jupiter, 69911\nSaturn, 58232 km\nUranus, 25362 km\nNeptune, 24622 km\nEarth, 6371 km\nVenus, 6052 km\nMars, 3390 km\nMercury, 2440 km"

Planet = namedtuple('Planet', ['name', 'radius'])
planet_list = []

for line in csv_data.split('\n'):
  name, radius = line.split(', ')
  planet_tuple = Planet(name, radius)
  planet_list.append(planet_tuple)
  
for planet in planet_list:
  print(f"The radius of {planet.name} is {planet.radius}")
</solution>
</Editor>