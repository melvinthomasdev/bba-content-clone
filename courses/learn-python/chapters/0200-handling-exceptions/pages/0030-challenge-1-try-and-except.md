Rahul is building a Harry Potter game. In the game, the user plays the character of Harry Potter. Within the game, Harry can cast spells on another character. These spells can be activated by pressing certain keys on the keyboard.

Given below is a list of keys the user is pressing. If the key is invalid and does not relate to an existing spell, an error is thrown. Implement the try-except exception block to handle these errors. Print **This key is invalid** when an exception is caught.



<codeblock language="python" type="exercise" testMode="fixedInput">
<code>
# Add a try-except block to handle invalid keys

spells = {
  "X": "Expelliarmus",
  "Y": "Wingardium Leviosa",
  "O": "Avada Kedavra",
  "A": "Lumos",
}

keys_pressed = ["X", "Y", "O", "A", "Ctrl", "Alt", "X"]

for key in keys_pressed:
  # Add try-except block here
  print(f"Casting Spell: {spells[key]}")
</code>

<solution>
# Add a try-except block to handle invalid keys

spells = {
  "X": "Expelliarmus",
  "Y": "Wingardium Leviosa",
  "O": "Avada Kedavra",
  "A": "Lumos",
}

keys_pressed = ["X", "Y", "O", "A", "Ctrl", "Alt", "X"]

for key in keys_pressed:
  try:
      print(f"Casting Spell: {spells[key]}")
  except:
    print("This key is invalid")
</solution>
</codeblock>