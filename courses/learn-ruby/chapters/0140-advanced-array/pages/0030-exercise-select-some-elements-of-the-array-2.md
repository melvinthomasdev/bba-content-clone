Using `select`, find all names
that have more than 4 letters.

<codeblock language="ruby" type="exercise" testMode="fixedInput">
<code>
names = ["Mary", "Kevin", "John", "Philip"]
</code>

<solution>
names = ["Mary", "Kevin", "John", "Philip"]

longer_names = names.select do |item|
  item.length > 4
end

puts longer_names
</solution>
</codeblock>