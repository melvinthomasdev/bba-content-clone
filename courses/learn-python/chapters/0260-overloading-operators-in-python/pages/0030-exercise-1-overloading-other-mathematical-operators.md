Champu is designing an egg crate for his poultry service website.

The Egg crate holds 30 eggs ( 5 x 6 ).  He wants to now provide the functionality for the user to add and remove eggs from the crate using the **+** and **-** operators. Help him do the same using operator overloading.

* `egg_crate + Egg()` should increase the `no_of_eggs` in Egg Crate by 1.
* `egg_crate - Egg()` should reduce the `no_of_eggs` in Egg Crate by 1.

<codeblock language="python" type="exercise" testMode="fixedInput">
<code>
# Support the operators + and - for adding and remote eggs from the crate

class Egg:
  pass

class EggCrate:
  def __init__(self):
    self.no_of_eggs = 0

  # code to increase number of eggs using +

  # code to decrease number of eggs using -

  def __repr__(self):
    """Do not touch this code"""
    no_of_rows = self.no_of_eggs // 5
    last_row_no = self.no_of_eggs % 5
    full_row = "|".join(["⚪"] * 5)
    empty_row = "|".join(["⏺"] * 5)

    rows = "\n".join([full_row] * no_of_rows)

    if last_row_no > 0:
      last_row = "|".join(["⏺" if i > last_row_no else "⚪" for i in range(1, 6)])
      rows = "\n".join((rows, last_row))
      no_of_rows += 1

    empty_rows_no = 6 - no_of_rows
    emp_row_str = "\n".join(([empty_row] * empty_rows_no))
    return "\n".join((rows, emp_row_str))

crate = EggCrate()

for _ in range(16):
  crate + Egg()

crate - Egg()
crate - Egg()

print(crate)
</code>

<solution>
class Egg:
  pass

class EggCrate:
  def __init__(self):
    self.no_of_eggs = 0

  def __add__(self, item):
    self.no_of_eggs += 1

  def __sub__(self, item):
    self.no_of_eggs -= 1

  def __repr__(self):
    """Do not touch this code"""
    no_of_rows = self.no_of_eggs // 5
    last_row_no = self.no_of_eggs % 5
    full_row = "|".join(["⚪"] * 5)
    empty_row = "|".join(["⏺"] * 5)

    rows = "\n".join([full_row] * no_of_rows)

    if last_row_no > 0:
      last_row = "|".join(["⏺" if i > last_row_no else "⚪" for i in range(1, 6)])
      rows = "\n".join((rows, last_row))
      no_of_rows += 1

    empty_rows_no = 6 - no_of_rows
    emp_row_str = "\n".join(([empty_row] * empty_rows_no))
    return "\n".join((rows, emp_row_str))

crate = EggCrate()

for _ in range(16):
  crate + Egg()

crate - Egg()
crate - Egg()

print(crate)
</solution>
</codeblock>