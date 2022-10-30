Given below is a list of numbers. All numbers except one, have a duplicate in the list. There is only one unique number. Can you find the number using the XOR operator?


<Editor lang="python" type="exercise">
<code>
# Find the unique number from the list

nums = [34, 3, 64, 33, 22, 574, 74, 6, 3, 2, 574, 43, 33, 789, 6, 64, 43, 22, 789, 34, 2]
result = 0
for num in nums:
  # add solution here

print(result)
</code>

<solution>
# Find the unique number from the list

nums = [34, 3, 64, 33, 22, 574, 74, 6, 3, 2, 574, 43, 33, 789, 6, 64, 43, 22, 789, 34, 2]
result = 0
for num in nums:
  result ^= num

print(result)
</solution>
</Editor>