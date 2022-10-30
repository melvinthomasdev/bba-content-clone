Let's see another example:

The order number of a
shipping company starts with
two digits.
We want our regular expression
to check that.

<Editor lang="ruby">
<code>
regex = /\d\d/

word1 = "76PEJRT"  #=> true
puts "word1 is a match!" if word1 =~ regex

word2 = "TGF87SDD" #=> true
puts "word2 is a match!" if word2 =~ regex

word3 = "TGF9J7D"  #=> false
puts "word3 is a match!" if word3 =~ regex

word4 = "UHERJED"  #=> false
puts "word4 is a match!" if word4 =~ regex
</code>
</Editor>

As we can see above `\d\d`
is checking that the
**word** should have at least two digits
next to each other.
As long as the **word**
has two digits or more next to each
other, the regular expression
will pass, otherwise it will fail.