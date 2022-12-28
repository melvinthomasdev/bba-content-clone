Mika and Emily are collecting a list of picnic spots from their classmates, for the next class trip. They are both saving the suggestions in a set of their own.

Given their two sets, combine them both  using `union()` and print the sorted list from resulting set.

<codeblock language="python" type="exercise" testMode="fixedInput">
<code>
# Merge emilys_list into mikas_list and convert the combined list into a set
# Print the sorted list from the set
mikas_set = {
  "Sim Park",
  "Golden Amusement Mall",
  "Red Garden"
}

emilys_set = {
  "Nature Park",
  "Wildlife Safari Zoo"
}
</code>

<solution>
# Merge emilys_list into mikas_list and convert the combined list into a set
# Print the sorted list from the set
mikas_set = {
  "Sim Park",
  "Golden Amusement Mall",
  "Red Garden"
}

emilys_set = {
  "Nature Park",
  "Wildlife Safari Zoo"
}

print(sorted(mikas_set.union(emilys_set)))
</solution>
</codeblock>