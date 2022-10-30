The `zip_longest()` function in `itertools`, extends the `zip()` functions functionality.

Consider two lists A and B which are not equal in length. A has a length of 4 while B has a length of 6.

Given `zip(A, B)`, the `zip()` function ends after the 4th iteration as A has only 4 values.  The `zip_longest()` function on the other hand continues the iteration until B ends. It fills the empty values missing from A with a fill value.

<Editor lang="python">
<code>
import itertools

A = ["Aaron", "Clive", "Thomas", "Victor"]
B = ["Sharon", "Rossette", "Emily", "Alice", "Karen", "Shirley"]

# Zip Output
print("Using zip():")
for boy, girl in zip(A, B): # <-- ends after the 4th iteration
  print(f"{boy} is paired with {girl}")



print("\n")
print("Using zip_longest():")

iterator = itertools.zip_longest(A, B, fillvalue="Nobody") # <-- Set fillvalue for missing values

for boy, girl in iterator: # <-- ends after the 6th iteration
  print(f"{boy} is paired with {girl}")
</code>
</Editor>