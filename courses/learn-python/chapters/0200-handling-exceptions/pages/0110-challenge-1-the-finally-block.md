The last change Rahul wants to do in his code is to log the keys which have been processed by the program, irrespective of errors. He has created a `log_completed()` function for the same which will log the key pressed by the user.

Help him change the program, adding a `finally` block and calling `log_completed()`  within it. Pass the key to `log_completed()` .



<codeblock language="python" type="exercise" testMode="fixedInput">
<code>
# Add an finally block to the try-except block
# call log_completed() within it and pass the key to it

def log_completed(key):
  print(f"--> Logging key {key}")

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
    print("MOVE COMPLETED.")
  # Add finally block here
</code>

<solution>
# Add an finally block to the try-except block
# call log_completed() within it and pass the key to it

def log_completed(key):
  print(f"--> Logging key {key}")

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
    print("MOVE COMPLETED.")
  finally:
    log_completed(key)
</solution>
</codeblock>