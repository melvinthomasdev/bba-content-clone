Given below is a dictionary containing popular cartoon shows and their premiere year. Create an iterator of this dictionary and iterate through the first 3 values and print them each on different lines.


<Editor lang="python" type="exercise">
<code>
# Create an iterator object from cartoons_premiere and print the first 3 values of different lines

cartoons_premiere = {
  "Tom and Jerry": 1965,
  "Captain Planet": 1990,
  "Pokemon": 1997,
  "Beyblade": 2001,
  "Dexter's Laboratory": 1996
}

# Create iterator

# Print 3 values using next
</code>

<solution>
# Create an iterator object from cartoons_premiere and print the first 3 values of different lines

cartoons_premiere = {
  "Tom and Jerry": 1965,
  "Captain Planet": 1990,
  "Pokemon": 1997,
  "Beyblade": 2001,
  "Dexter's Laboratory": 1996
}

iterator = iter(cartoons_premiere)

print(next(iterator))
print(next(iterator))
print(next(iterator))
</solution>
</Editor>