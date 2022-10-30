Given below is a list of numbers. Your task is to check if a number is even or odd. If it is odd, you should ignore it. If it is even, increment the number by 1 to make it odd.

Can you do this operation in one line using the **OR** (\|) operator?


<Editor lang="python" type="exercise">
<code>
# Modify an even number by adding 1 and making it odd
nums = [45, 21, 34, 64, 4, 97, 24]

for num in nums:
  result = # add operation here
  print(f"{num} is now {result}")
</code>

<solution>
# Modify an even number by adding 1 and making it odd
nums = [45, 21, 34, 64, 4, 97, 24]

for num in nums:
  result = num | 1
  print(f"{num} is now {result}")
</solution>
</Editor>