Get the value **0** in the **duration**
array using `dig`:

<codeblock language="ruby" type="exercise" testMode="fixedInput">
<code>
duration = [
  [54, [123, 231]], ["high", "low", "mixed"], [[4, 10], [99, 0]]
]

# Write your code below this

puts
</code>

<solution>
duration = [
  [54, [123, 231]], ["high", "low", "mixed"], [[4, 10], [99, 0]]
]

# Write your code below this

puts duration.dig(2, 1, 1)
</solution>
</codeblock>