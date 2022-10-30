We can pass a
**key** to a hash
and
we can ask the hash
to return the **value**
for the given key.

Here, we have a hash
where we have the country
name as the key
and
the capital of the country
as the value:

|Key    |Value          |
|--|--|
|USA    |Washington D.C.|
|England|London         |
|France |Paris          |

Let's ask the hash to
print the name of the capital
city for USA.

<Editor lang="ruby">
<code>
hash =  { "USA" => "Washington D.C.",
          "England" => "London",
          "France" => "Paris" }

puts hash["USA"]
</code>
</Editor>

Next, let's do
the same thing, but
change the key.

We want to know what's
the capital city of
the country "France":

<Editor lang="ruby">
<code>
hash =  { "USA" => "Washington D.C.",
          "England" => "London",
          "France" => "Paris" }

puts hash["France"]
</code>
</Editor>