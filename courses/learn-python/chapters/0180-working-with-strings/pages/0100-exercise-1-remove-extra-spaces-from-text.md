Some of the names and addresses, Tom receives have spacing issues wherein there are extra spaces at the start and end.

Help Tom fix these formatting issues by removing extra spaces using `.strip()`.


<codeblock language="python" type="exercise" testMode="fixedInput">
<code>
# Remove the extra whitespace from the name and address using strip()
customer = {
  'name': '    Alice Allens  ',
  'address': '   New Jersey, USA\n'
}

print(customer)
</code>

<solution>
# Remove the extra whitespace from the name and address using strip()
customer = {
  'name': '    Alice Allens  ',
  'address': '   New Jersey, USA\n'
}

# Remove whitespace
customer['name'] = customer['name'].strip()
customer['address'] = customer['address'].strip()

print(customer)
</solution>
</codeblock>