Let's print the sports list in
the reverse order.

<codeblock language="ruby" type="exercise" testMode="fixedInput">
<code>
sports_i_like = ["cricket", "basketball", "baseball", "hockey"]
</code>

<solution>
sports_i_like = ["cricket", "basketball", "baseball", "hockey"]

reversed_array = sports_i_like.reverse

reversed_array.each do |sport|
  puts "I like " + sport
end
</solution>
</codeblock>