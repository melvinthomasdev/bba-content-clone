Rahul wants to log the errors within the program to a separate file so that he can review them later. He has created the `log_error()` function which takes in the error variable `e` and logs it within the system.

Make changes to the following program, so that Rahul can capture the error details for each error and pass them to `log_error()`.



<codeblock language="python" type="exercise" testMode="fixedInput">
<code>
# Capture the exception detail object and pass it to log_error

def log_error(e):
  print("LOGGER: ", e.__class__.__name__, ": ", e)

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

  # Capture the error object as e
  # pass e to log_error() within the except block
  except Exception as e:
    pass
</code>

<solution>
# Capture the exception detail object and pass it to log_error

def log_error(e):
  print("LOGGER: ", e.__class__.__name__, ": ", e)

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
  except Exception as e:
    log_error(e)
</solution>
</codeblock>