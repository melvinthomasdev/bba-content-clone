Mika and Emily have collected and combined the picnic spot suggestions into a unique Set from all the students present. Joshua arrived late to the class and has requested to add his suggestion too.

Given the final set, add Joshua's suggestion to the set, and print the sorted list from the resulting set.

<codeblock language="python" type="exercise" testMode="fixedInput">
<code>
# Add Joshua's suggestion to the final set and print the sorted list from the set.
final_set = {'Sim Park', 'Nature Park', 'Wildlife Safari Zoo', 'Golden Amusement Mall', 'Red Garden'}
joshuas_suggestion = "Willow's Water Park"
</code>

<solution>
# Add Joshua's suggestion to the final set and print the sorted list from the set.
final_set = {'Sim Park', 'Nature Park', 'Wildlife Safari Zoo', 'Golden Amusement Mall', 'Red Garden'}
joshuas_suggestion = "Willow's Water Park"

final_set.add(joshuas_suggestion)
print(sorted(final_set))
</solution>
</codeblock>