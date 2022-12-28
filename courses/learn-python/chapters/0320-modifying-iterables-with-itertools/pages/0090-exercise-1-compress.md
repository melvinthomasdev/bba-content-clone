Given below is a list of materials and their respective average years to decompose. We want to pick out all the materials that take longer than 100 years to decompose.

Use the `map()` method to create a boolean list where `True == x > 100`.  Use this boolean list to pick out all the materials from `materials` which take longer to decompose.


<codeblock language="python" type="exercise" testMode="fixedInput">
<code>
# print all items which take longer then 100 years to decompose

import itertools

materials = ["wood", "plastic", "glass", "metal", "paper", "cloth"]
avg_years_to_decompose = [15, 500, 4000, 250, 1, 25]

# use get to calculate a boolean list representing x > 100
# filtered = 

# get all items which are True based on the boolean list
# iterator = 

print("These items take more than 100 years to decompose: ", ', '.join(iterator))
</code>

<solution>
import itertools

materials = ["wood", "plastic", "glass", "metal", "paper", "cloth"]
avg_years_to_decompose = [15, 500, 4000, 250, 1, 25]

# use get to calculate a boolean list representing x > 100
filtered = map(lambda x: x > 100, avg_years_to_decompose)

# get all items which are True based on the boolean list
iterator = itertools.compress(materials, filtered)

print("These items take more than 100 years to decompose: ", ', '.join(iterator))
</solution>
</codeblock>