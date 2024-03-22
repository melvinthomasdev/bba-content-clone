Using `reject`, find all names
that DO NOT have more
than 4 letters.

<codeblock language="ruby" type="exercise" testMode="fixedInput">
<code>
names = ["Mary", "Kevin", "John", "Philip"]
</code>

<solution>
names = ["Mary", "Kevin", "John", "Philip"]

shorter_names = names.reject do |item|
  item.length > 4
end

puts shorter_names
</solution>
</codeblock>