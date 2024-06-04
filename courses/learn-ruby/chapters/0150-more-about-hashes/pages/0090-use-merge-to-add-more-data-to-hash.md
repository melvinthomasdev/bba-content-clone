We can use `merge` to merge the contents of two hashes.
It returns a new hash. The original two hashes remain the same.

<codeblock language="ruby" type="lesson">
<code>
hash =  { USA: "Washington D.C.",
          England: "London",
          France: "Paris" }

hash2 = hash.merge({ Italy: "Rome"})

puts hash

puts hash2
</code>
</codeblock>

We can also use `merge!` to merge two hashes.
The difference is that in this case the original hash itself is altered.
<codeblock language="ruby" type="lesson">
<code>
hash =  { USA: "Washington D.C.",
          England: "London",
          France: "Paris" }

hash.merge!({ Italy: "Rome"})

puts hash
</code>
</codeblock>
