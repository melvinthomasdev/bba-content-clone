5 of your friends are playing the Passing the Baton game. They will be running for 10 rounds. After the 5th round, the last player will pass the baton again to the first player and they will cycle through until the 10th round.

Your job is to keep track of when a player has passed the baton. In the code below create an iterator that will cycle through the players and print when they have picked up the baton.


<codeblock language="python" type="exercise" testMode="fixedInput">
<code>
# Create an iterator that cycles through the players

players = ["Keith", "Shane", "Aaron", "Denver", "Dylan"]
rounds = 10

# Create an iterator of players here
# iterator = 

for _ in range(rounds):
  player = next(iterator)
  print(f"{player} has picked up the baton")
</code>

<solution>
import itertools

players = ["Keith", "Shane", "Aaron", "Denver", "Dylan"]
rounds = 10

iterator = itertools.cycle(players)

for _ in range(rounds):
  player = next(iterator)
  print(f"{player} has picked up the baton")
</solution>
</codeblock>