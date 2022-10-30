The spellcasting and wand-changing codes are almost ready. Rahul just wants to add some minor perks to it now. Once a spell is cast or the wand changed, Rahul wants to print **MOVE COMPLETED** to the screen.

Help him make the change in the following code by adding an else block to the try-except statement.



<Editor lang="python" type="exercise">
<code>
# Add an else block to the try-except block
# print MOVE COMPLETED within it

spells = {
  "X": "Expelliarmus",
  "Y": "Wingardium Leviosa",
  "O": "Avada Kedavra",
  "A": "Lumos",
}

wands = ["Elm Wand", "Unicorn Hair Wand", "Elder Wand"]

keys_pressed = ["X", "K", "6", "2"]

for key in keys_pressed:
  try:
    if key.isdigit():
      print(f"Changing wand to: {wands[int(key)]}....")
    else:
      print(f"Casting Spell: {spells[key]}....")
  except KeyError:
    print("Spell does not exist.")
  except IndexError:
    print("Wand does not exist.")
  # Add an else block here
</code>

<solution>
# Add an else block to the try-except block
# print MOVE COMPLETED within it

spells = {
  "X": "Expelliarmus",
  "Y": "Wingardium Leviosa",
  "O": "Avada Kedavra",
  "A": "Lumos",
}

wands = ["Elm Wand", "Unicorn Hair Wand", "Elder Wand"]

keys_pressed = ["X", "K", "6", "2"]

for key in keys_pressed:
  try:
    if key.isdigit():
      print(f"Changing wand to: {wands[int(key)]}....")
    else:
      print(f"Casting Spell: {spells[key]}....")
  except KeyError:
    print("Spell does not exist.")
  except IndexError:
    print("Wand does not exist.")
  else:
    print("MOVE COMPLETED")
</solution>
</Editor>