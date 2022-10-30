Rahul is adding a new feature to his game, where he lets the user change his wand in the game. The wand types are stored in `wands` list and are selected when the user enters a digit. He has added a try-except block around the code to handle the errors, however, he feels the error message is too generic. He wants to print **Spell does not exist** if the spell key does not exist in the dictionary, or **Wand does not exist** if the wand index is not within the list.

Help Rahul implement the same by detecting the type of exception thrown. Print the error message accordingly. Note that when a key is not found within the dictionary, Python throws a **KeyError**. And when an index is not present in an array, we get an **IndexError**.



<Editor lang="python" type="exercise">
<code>
# Add a try-catch block and handle the KeyError and IndexError exceptions

spells = {
  "X": "Expelliarmus",
  "Y": "Wingardium Leviosa",
  "O": "Avada Kedavra",
  "A": "Lumos",
}

wands = ["Elm Wand", "Unicorn Hair Wand", "Elder Wand"]

keys_pressed = ["X", "Y", "3", "O", "A", "K", "H", "1", "6", "2"]

for key in keys_pressed:
  try:
    if key.isdigit():
      print(f"Changing wand to: {wands[int(key)]}")
    else:
      print(f"Casting Spell: {spells[key]}")
  except: # Make your changes here
    print("This key is invalid")
</code>

<solution>
# Add a try-catch block and handle the KeyError and IndexError exceptions

spells = {
  "X": "Expelliarmus",
  "Y": "Wingardium Leviosa",
  "O": "Avada Kedavra",
  "A": "Lumos",
}

wands = ["Elm Wand", "Unicorn Hair Wand", "Elder Wand"]

keys_pressed = ["X", "Y", "3", "O", "A", "K", "H", "1", "6", "2"]

for key in keys_pressed:
  try:
    if key.isdigit():
      print(f"Changing wand to: {wands[int(key)]}")
    else:
      print(f"Casting Spell: {spells[key]}")
  except KeyError:
    print("Spell does not exist")
  except IndexError:
    print("Wand does not exist")
</solution>
</Editor>