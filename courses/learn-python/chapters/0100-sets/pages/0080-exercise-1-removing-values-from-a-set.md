Mika and Emily are filtering the list of picnic spots they have collected. They have realized that `Sim Park` is too far to visit.

Remove `Sim Park` from the set below and print the sorted list from the `final_set`.

<codeblock language="python" type="exercise" testMode="fixedInput">
<code>
# Remove Sim Park from the final_set and print the sorted list from the final_set
final_set = {'Sim Park', 'Nature Park', 'Wildlife Safari Zoo', 'Golden Amusement Mall', 'Red Garden'}
</code>

<solution>
# Remove Sim Park from the final_set and print the sorted list from the final_set
final_set = {'Sim Park', 'Nature Park', 'Wildlife Safari Zoo', 'Golden Amusement Mall', 'Red Garden'}
final_set.remove("Sim Park")

print(sorted(final_set))
</solution>
</codeblock>