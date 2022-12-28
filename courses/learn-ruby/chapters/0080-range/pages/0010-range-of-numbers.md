Let's say that I want a
range of numbers from 1 to 20.
In Ruby, we can get the range
of numbers by using `(1..20)`.

Just like an array,
a range also supports
`each` and `do end`.

<codeblock language="ruby" type="lesson">
<code>
numbers = (1..20)

numbers.each do |number|
  puts number
end
</code>
</codeblock>