Range supports both double
dots and triple dots.

<codeblock language="ruby" type="lesson">
<code>
puts (1..5).to_a
puts (1...5).to_a
</code>
</codeblock>

When we use double dots,
the range includes the
last value.

When we use triple dots,
the last value is not
included in the range.

Let's see some more examples:

<codeblock language="ruby" type="lesson">
<code>
puts (1..5).include?(5)           #=> true
puts (1...5).include?(5)          #=> false

puts (1..4).to_a == (1...5).to_a  #=> true
puts (1..4) == (1...5)            #=> false
</code>
</codeblock>