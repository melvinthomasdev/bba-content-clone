Given below is a list of numbers. Can you write a program to find out which numbers are even and which are off using the **AND** ( `&` ) operator?


<codeblock language="python" type="exercise" testMode="fixedInput">
<code>
# Find if a number is even or odd using & operator
nums = [45, 21, 34, 64, 4, 97, 24]

for num in nums:
  if : # <-- add condition here
    print(f"{num} is odd")
  else:
    print(f"{num} is even")
</code>

<solution>
# Find if a number is even or odd using & operator
nums = [45, 21, 34, 64, 4, 97, 24]

for num in nums:
  if num & 1: # <-- add condition here
    print(f"{num} is odd")
  else:
    print(f"{num} is even")
</solution>
</codeblock>