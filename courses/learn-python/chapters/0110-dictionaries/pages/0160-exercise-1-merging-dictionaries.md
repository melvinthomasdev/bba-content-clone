Mika and Emily are collecting a list of picnic spots from their classmates, for the next class trip. They are both saving the suggestions in a dictionary with the key as the name of the person suggesting the spot and the value as the spot to visit.

You are given both their dictionaries as `mikas_list` and `emilys_list`. Merge `emilys_list` into `mikas_list` before submitting it to the class teacher. Print the merged result.

<codeblock language="python" type="exercise" testMode="fixedInput">
<code>
# Merge emilys_list into mikas_list and print mikas_list
mikas_list = {
  "Bob": "Sim Park",
  "Neha": "Golden Amusement Mall",
  "Charlie": "Red Garden"
}

emilys_list = {
  "Frank": "Nature Park",
  "Susy": "Wildlife Safari Zoo"
}
</code>

<solution>
# Merge emilys_list into mikas_list and print mikas_list
mikas_list = {
  "Bob": "Sim Park",
  "Neha": "Golden Amusement Mall",
  "Charlie": "Red Garden"
}

emilys_list = {
  "Frank": "Nature Park",
  "Susy": "Wildlife Safari Zoo"
}

mikas_list.update(emilys_list)
print(mikas_list)
</solution>
</codeblock>