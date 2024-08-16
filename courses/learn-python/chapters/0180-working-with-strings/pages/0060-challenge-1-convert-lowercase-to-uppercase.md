Tom, who is Sharath's teammate, is in charge of correcting the given customer data and storing it into the system in the right format. Tom has been given a dictionary of a customer with his name and address. The name is supposed to be in Block Letters (Capital Case) and the address in Lower case.

Help Tom, update this change in the dictionary and print the dictionary once done.


<codeblock language="python" type="exercise" testMode="fixedInput">
<code>
# Change the name to capital letters and the address to small letters.
customer = {
  'name': 'Vivek Maurya',
  'address': 'Gandhi Nagar, Shimla'
}

# change here

print(customer)
</code>

<solution>
customer = {
  'name': 'Vivek Maurya',
  'address': 'Gandhi Nagar, Shimla'
}

customer['name'] = customer['name'].upper()
customer['address'] = customer['address'].lower()

print(customer)
</solution>
</codeblock>