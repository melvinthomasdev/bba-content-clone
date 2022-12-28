We could also pass arguments to generators like normal functions. 

<codeblock language="python" type="lesson">
<code>
names = ["ferrari", "john", "barbie", "cottonwood", "shirley"]
labels = ["car", "boy", "toy", "tree", "girl"]

def combine(data_a, data_b):
  for a, b in zip(data_a, data_b):
    yield f"{a.capitalize()} is a {b}"
    
cogen = combine(names, labels) # pass arguments to combine

for value in cogen: # for loop will iterate until end of data
  print(value)
</code>
</codeblock>