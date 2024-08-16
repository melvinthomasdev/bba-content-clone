Kripa has invited a list of people for an event. She has handed over the list to the security personnel, Sushant, to make sure that only those that are invited are present.

Help Sushant ensure that the attendees are the ones who were invited by cross verifying the attendees list with the invitees list. Use the `.issubset()` to check the same. Print **All attendees are verified** if all the attendees were invited else print **Some attendees were not invited** if attendees are not present in invitees list.

<codeblock language="python" type="exercise" testMode="fixedInput">
<code>
# Check if all attendees are present in invitees set
invitees = {"Renu", "Sam", "Eve", "Carlos"}
attendees = {"Renu", "Sam", "Eve",  "Linh", "Lao"}
</code>

<solution>
# Check if all attendees are present in invitees set

invitees = {"Renu", "Sam", "Eve", "Carlos"}
attendees = {"Renu", "Sam", "Eve",  "Linh", "Lao"}
if attendees.issubset(invitees):
  print("All attendees are verified")
else:
  print("Some attendees were not invited")
</solution>
</codeblock>
