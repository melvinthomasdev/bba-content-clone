The WWE is scheduling matches among its wrestlers for WrestleMania XXXII. They have made two lists containing the names of wrestlers who are available. Your task is to pair the wrestlers with each other in the same order in which they appear in the list. If a wrestler does not have a partner, you should print **TBD** (To be decided) instead.


<Editor lang="python" type="exercise">
<code>
import itertools

team_1 = ["Kane", "Batista", "Triple H", "Randy Orton"]
team_2 = ["Undertaker", "John Cena", "Stone Cold"]

# Use zip_longest here. Set fillvalue to TBD
# iterator = 

for fighter_1, fighter_2 in iterator:
  print(f"{fighter_1} vs {fighter_2}")
</code>

<solution>
import itertools

team_1 = ["Kane", "Batista", "Triple H", "Randy Orton"]
team_2 = ["Undertaker", "John Cena", "Stone Cold"]

iterator = itertools.zip_longest(team_1, team_2, fillvalue="TBD")

for fighter_1, fighter_2 in iterator:
  print(f"{fighter_1} vs {fighter_2}")
</solution>
</Editor>