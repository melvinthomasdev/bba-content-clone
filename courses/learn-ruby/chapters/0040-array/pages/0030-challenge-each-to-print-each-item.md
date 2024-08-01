Use `each` and `do end`
to print each value in **sports_i_like**
in the following way:
`I like [Sport Name]`

<codeblock language="ruby" type="exercise" testMode="fixedInput">
<code>
sports_i_like = ["basketball", "tennis", "hockey"]
# Write your code here
</code>

<solution>
sports_i_like = ["basketball", "tennis", "hockey"]

sports_i_like.each do |sport|
  puts "I like " + sport
end
</solution>
</codeblock>
