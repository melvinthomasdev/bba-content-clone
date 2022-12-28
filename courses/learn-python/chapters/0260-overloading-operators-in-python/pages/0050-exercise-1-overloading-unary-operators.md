Champu wants to also add functionality to clear the Egg crate. He has decided to to use the ~ operator for the same.

Implement this functionality for Champu's Egg crate. Empty the egg crate (set `no_of_eggs` to 0) when the ~ operator is called on it.


<codeblock language="python" type="exercise" testMode="fixedInput">
<code>
# Support ~ operator to empty the crate

class Egg:
  pass

class EggCrate:
  def __init__(self, no_of_eggs):
    self.no_of_eggs = no_of_eggs

  # Add code to empty the crate using ~ operator

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


crate = EggCrate(10)
~crate
print(crate)
</code>

<solution>
class Egg:
  pass

class EggCrate:
  def __init__(self, no_of_eggs):
    self.no_of_eggs = no_of_eggs

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

  def __invert__(self):
    self.no_of_eggs = 0

crate = EggCrate(10)
~crate
print(crate)
</solution>
</codeblock>