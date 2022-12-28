Mike and James are picking players for their football team. From a set of 10 players, Mike has already picked 4 players.

Find the remaining 6 players that are left, so that James can pick from them. Use `.difference()` to find the same. Print the sorted list from the remaining players.


<codeblock language="python" type="exercise" testMode="fixedInput">
<code>
# Find the difference between all_players and mikes_team and print the sorted list from the result
all_players = {"Joey", "Chandler", "Ross", "Sheldon", "Leonard", "Howard", "Raj", "Ted", "Marshall", "Barney"}

mikes_team = {"Joey", "Ross", "Leonard", "Barney"}
</code>

<solution>
# Find the difference between all_players and mikes_team and print the sorted list from the result
all_players = {"Joey", "Chandler", "Ross", "Sheldon", "Leonard", "Howard", "Raj", "Ted", "Marshall", "Barney"}

mikes_team = {"Joey", "Ross", "Leonard", "Barney"}

print(sorted(all_players.difference(mikes_team)))
</solution>
</codeblock>