We have an array full of strings.
Create another array with
the uppercase version of these strings.

<Editor lang="ruby" type="exercise" caseSensitiveOutput="true">
<code>
names = ["john", "mary", "michael"]
upcased_names = []

# write your code here

puts upcased_names
</code>

<solution>
names = ["john", "mary", "michael"]
upcased_names = []

names.each do |name|
  upcased_names.push(name.upcase)
end

puts upcased_names
</solution>
</Editor>