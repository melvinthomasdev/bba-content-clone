Range has a method `include?`
which can be used to
find if a value is in a given
range.

Let's find out if
45 lies within the range
**30 to 50**:

<Editor lang="ruby">
<code>
range = (30..50)
puts range.include? 45
</code>
</Editor>

Now, let's check
if 80 lies within
the range **20 to 40**.

<Editor lang="ruby">
<code>
range = (20..40)
puts range.include? 80
</code>
</Editor>