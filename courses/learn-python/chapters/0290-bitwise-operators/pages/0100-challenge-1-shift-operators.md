Given below is a number `n`. Your task is to find the number of 1's in the number `n`. Do this using the `>>` and `&` operators.


<codeblock language="python" type="exercise" testMode="fixedInput">
<code>
# Find the number of 1 bits in n

n = 355
result = 0
print(bin(n))

# Add solution here

print(result)
</code>

<solution>
# Find the number of 1 bits in n

n = 355
result = 0
print(bin(n))

while n:
  result += (n & 1) # get the last bit and add it to result
  n >>= 1 # shift to the right

print(result)
</solution>
</codeblock>