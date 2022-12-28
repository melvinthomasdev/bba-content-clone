We have an array full of strings.
Create another array with the
reverse of each of these strings.

<codeblock language="ruby" type="exercise" testMode="fixedInput">
<code>
names = ["john", "mary", "michael"]
reversed_names = []

# write your code here

puts reversed_names
</code>

<solution>
names = ["john", "mary", "michael"]
reversed_names = []

names.each do |name|
  reversed_names.push(name.reverse)
end

puts reversed_names
</solution>
</codeblock>