Using `select`, find all names
that have more than 4 letters
and
display them to the console.

<codeblock language="ruby" type="exercise" testMode="fixedInput">
<code>
names = ["Mary", "Kevin", "John", "Philip"]
# Write your code here
</code>

<solution>
names = ["Mary", "Kevin", "John", "Philip"]

longer_names = names.select do |item|
  item.length > 4
end

puts longer_names
</solution>
</codeblock>
