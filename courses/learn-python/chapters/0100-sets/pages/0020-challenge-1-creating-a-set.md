Mika and Emily are collecting a list of picnic spots from their classmates, for the next class trip. They are both saving the suggestions in a list of their own. Once done, they have to combine the list and remove any repeated picnic spots from the list.

Combine Mika's and Emily's lists, remove duplicates using the `set( )` function and print the sorted list from the resulting set using `sorted` method.

<codeblock language="python" type="exercise" testMode="fixedInput">
<code>
# Merge emilys_list into mikas_list and convert the combined list into a set
# Print the sorted list from the set.
mikas_list = [
  "Sim Park",
  "Golden Amusement Mall",
  "Red Garden"
]

emilys_list = [
  "Sim Park",
  "Wildlife Safari Zoo",
  "Red Garden"
]
</code>

<solution>
# Merge emilys_list into mikas_list and convert the combined list into a set
# Print the sorted list from the set.
mikas_list = [
  "Sim Park",
  "Golden Amusement Mall",
  "Red Garden"
]

emilys_list = [
  "Sim Park",
  "Wildlife Safari Zoo",
  "Red Garden"
]

combined_list = mikas_list + emilys_list

print(sorted(set(combined_list)))
</solution>
</codeblock>