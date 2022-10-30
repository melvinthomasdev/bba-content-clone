Look at the following example:

<Editor lang="ruby">
<code>
data = {
    players: [
        {
          name: "Oliver",
          wins: 22
        },
        {
          name: "Renu",
          wins: 23
        }
    ]
}
puts data[:players][0][:name]
puts data[:players][1][:name]
</code>
</Editor>

To get the name of the first player,
we can use `data[:players][0][:name]`.
Similarly, we can access the data for
the second player. But if we tried to
get the name of a player whose information
doesn't exist, this will cause an error as
shown below:

<Editor lang="ruby">
<code>
data = {
    players: [
        {
          name: "Oliver",
          wins: 22
        },
        {
          name: "Renu",
          wins: 23
        }
    ]
}
puts data[:players][2][:name]
</code>
</Editor>

Sometimes, we might not know beforehand which
information exists in the data. This is why,
it is important that we have a way to access
the information without resulting in an error.
Ruby gives us `dig` for this purpose. Take a look
at the example given below:

<Editor lang="ruby">
<code>
data = {
    players: [
        {
          name: "Oliver",
          wins: 22
        },
        {
          name: "Renu",
          wins: 23
        }
    ]
}

puts data.dig(:players, 0, :name)
puts data.dig(:players, 1, :name)
puts data.dig(:players, 2, :name)
</code>
</Editor>

As you can see, searching for a
non-existent value does not create
an exception. Instead, it simply
shows a `nil` value.

Also, `dig` is easier to read too!