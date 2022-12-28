Here we have a hash of people
with their house numbers:

|Name   | House number |
|--|--|
|John   | 507   |
|Sally  | 239   |
|Adam   | 786   |
| Nancy | 324   |
| Kelly | 788   |

Our task is to find every
person who has a house with
a house number greater than 500.

We can use `select` to do this.
Using `select`, we can get a smaller
part of the original hash.
`select` will only select the elements
for which the condition is true.

In this case, the condition is
that the house number
should be more than 500.

<codeblock language="ruby" type="lesson">
<code>
houses = {
    "John" => 507,
    "Sally" => 239,
    "Adam" => 786,
    "Nancy" => 324,
    "Kelly" => 788
}

houses2 = houses.select do |key, value|
  value > 500
end

puts houses2
</code>
</codeblock>

It's important to note that when `select` is used then
the "do end" block should return either **true** or **false**.
If the block returns **true**, then that key and value pair will
be selected and if the block returns **false**, then that key and
value pair will be rejected.