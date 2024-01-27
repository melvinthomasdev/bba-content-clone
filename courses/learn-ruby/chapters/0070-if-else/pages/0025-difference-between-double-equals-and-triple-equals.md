The "==" operator is used
to check if two values
are equal.
It compares the values without
considering their data types.

Few examples:
<codeblock language="ruby" type="lesson">
<code>
puts "hello" == "hi"
puts "4" == 4
puts 2 == 2
puts "Morning" == "Morning"
</code>
</codeblock>

On the other hand, the "==="
operator is primarily used in
**case statements** to perform
pattern matching.

It behaves differently based
on the class of the object
being compared.

Let's see a couple of examples:

<codeblock language="ruby" type="lesson">
<code>
puts (1..5) === 3
puts /tar/ === "Guitar"
puts Integer === 4
</code>
</codeblock>

In the first example, the "==="
operator is used with a range
object `(1..5)` and checks if
the value 3 falls within that 
range. Since it does, Boolean 
`true` is returned.

In the second example, the "==="
operator is used with a regular
expression `/tar/` to match it
against the string "Guitar".
Since the string contains the
pattern defined by the regular
expression, it returns
Boolean `true`.

In the third example, we are checking
if the value **4** is a part of `Integers`.

This operator is used a lot
in case statements.
For example:

<codeblock language="ruby" type="lesson">
<code>
text = "Hello!"

case text
when /ell/
  puts "Text contains patterns matching 'ell'."
when /ol/
  puts "Text contains patterns matching 'ol'."
else
  puts "Text doesn't match the specified patterns."
end
</code>
</codeblock>
