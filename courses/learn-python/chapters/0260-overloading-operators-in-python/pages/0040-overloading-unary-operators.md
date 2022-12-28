We can also overload unary operators. Unary operators are operators which require only a single operand. For example the inversion operator ~.

<codeblock language="python" type="lesson">
<code>
class LightBulb:
  def __init__(self):
    self.switch = 'OFF'

  def __invert__(self): # <-- This operator takes no arguments
    if self.switch == 'ON':
      self.switch = 'OFF'
    elif self.switch == 'OFF':
      self.switch = 'ON'

  def __repr__(self):
    return f"LightBulb: {self.switch}"

bulb = LightBulb()
print(bulb)

print("\n Switching on Bulb \n")

~bulb # <-- Invert bulb
print(bulb)

print("\n Switching off Bulb \n")

~bulb # <-- Invert bulb
print(bulb)
</code>
</codeblock>