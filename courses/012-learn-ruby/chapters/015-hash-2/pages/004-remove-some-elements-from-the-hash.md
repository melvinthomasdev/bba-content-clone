`reject` is the opposite of `select`.
Elements that meet the give condition
get rejected.

Here we have a hash of
people with their house numbers:

|Name   | House number |
|--|--|
|John   | 507   |
|Sally  | 239   |
|Adam   | 786   |
| Nancy | 324   |
| Kelly | 788   |

Our task is to find all the people
who live in a house with a house number
greater than 500.

We can use `reject` to do this job.
Using `reject`, we can get a
smaller part of the original hash.
All the elements that meet the
criteria get rejected.

In this case, the criteria is
that the house number should be
500 or less than 500.

<Editor lang="ruby">
<code>
houses = {
    "John" => 507,
    "Sally" => 239,
    "Adam" => 786,
    "Nancy" => 324,
    "Kelly" => 788
}

houses2 = houses.reject do |key, value|
  value <= 500
end

puts houses2
</code>
</Editor>

It's important to note that
when `reject` is used, then
the `do end` block should
return either `true` or `false`.

If the block returns `true`,
then that key and value pair will
be rejected and if the block
returns `false`, then that key and
value pair will be accepted.