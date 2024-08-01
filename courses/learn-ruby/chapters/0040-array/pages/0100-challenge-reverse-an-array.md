Let's print the sports list in
the reverse order. Each sport should be
printed on a new line, preceded by the
phrase "I like ".

<codeblock language="ruby" type="exercise" testMode="fixedInput">
<code>
sports_i_like = ["cricket", "basketball", "baseball", "hockey"]
# Write your code here
</code>

<solution>
sports_i_like = ["cricket", "basketball", "baseball", "hockey"]

reversed_array = sports_i_like.reverse

reversed_array.each do |sport|
  puts "I like " + sport
end
</solution>
</codeblock>
