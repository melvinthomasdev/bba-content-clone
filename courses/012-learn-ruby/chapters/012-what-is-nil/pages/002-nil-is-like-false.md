We have seen that the `if`
condition works on `true`
and
`false` values.

<Editor lang="ruby">
<code>
age = 23
can_vote = age > 18
puts can_vote

age = 13
can_vote = age > 18
puts can_vote
</code>
</Editor>

In Ruby, `nil` is
like `false`.

<Editor lang="ruby">
<code>
can_vote = nil

if can_vote
  puts "You can vote"
else
  puts "you cannot vote"
end
</code>
</Editor>

In the example given above, `can_vote`
has `nil` value. This is why, Ruby
executed the `else` part of
the code.

Ruby treats both `false` and `nil`
similar to false and we call it `falsy`.

Opposite of `falsy` is `truthy`.

Ruby treats everything else as `truthy`.
It means any string or any number is `truthy`.

<Editor lang="ruby">
<code>
s = "Hello world"

if s
  puts "condition is true"
else
  puts "condition is false"
end
</code>
</Editor>

As we can see above,
Ruby treated `s` as `truthy`.

In summary, `false`
and
`nil` are `falsy`.

Everything else is `truthy`.