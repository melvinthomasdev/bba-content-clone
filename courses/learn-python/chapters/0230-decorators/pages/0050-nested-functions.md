A nested function is a function defined within another function.

<codeblock language="python" type="lesson">
<code>
def format_name(first_name, middle_name, last_name):

  def shorten_name(first_name, middle_name, last_name): # <-- Inner Nested Function
    return f"{first_name[0]}. {middle_name[0]}. {last_name}"

  return shorten_name(first_name, middle_name, last_name)

print(format_name("Rajkumar", "Jaiprakash", "Vinajan"))
</code>
</codeblock>