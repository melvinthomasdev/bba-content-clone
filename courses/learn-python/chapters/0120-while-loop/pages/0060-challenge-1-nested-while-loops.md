Darla has a fish tank. She is trying to find her Goldfish named Nemo.

The fish tank is represented in Python as a Nested List `fish_tank`. `w` represents water and `*` represents Nemo.

Use nested while loops to iterate through the Nested List `fish_tank` and print **Found Nemo at `i,j`** when `*` is found.


<codeblock language="python" type="exercise" testMode="fixedInput">
<code>
# Use nested while loops to iterate through the Nested List `fish_tank`
# Print Found Nemo at `i,j` when `*` is found.
fish_tank = [
  ['w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w'],
  ['w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w'],
  ['w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w'],
  ['w', 'w', 'w', 'w', 'w', '*', 'w', 'w', 'w', 'w'],
  ['w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w']
]
</code>

<solution>
# Use nested while loops to iterate through the Nested List `fish_tank`
# Print Found Nemo at `i,j` when `*` is found.
fish_tank = [
  ['w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w'],
  ['w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w'],
  ['w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w'],
  ['w', 'w', 'w', 'w', 'w', '*', 'w', 'w', 'w', 'w'],
  ['w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w']
]

i = 0
while i < len(fish_tank):
  j = 0
  while j < len(fish_tank[i]):
    if fish_tank[i][j] == "*":
      print(f"Found Nemo at {i},{j}")
    j += 1
  i += 1
</solution>
</codeblock>