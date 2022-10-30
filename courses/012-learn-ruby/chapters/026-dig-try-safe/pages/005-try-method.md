In the following example,
we want to be sure that
we'll get a value and not
an error. To do this, we have
to code like this:

<Editor lang="ruby">
<code>
data = {
  oliver: {
    team: "Fighters",
    wins: 22
  },
  renu: {
    team: "Believers",
    wins: 23
  }
}

if data && data[:oliver] && data[:oliver][:wins]
  puts data[:oliver][:wins]
end
</code>
</Editor>

As you can see, this is a tiring approach.

In **Ruby on Rails**, we can do something like this:

```ruby
if data.try(:oliver).try(:wins)
  puts data.oliver.wins
end
```

There is a stricter version of `try`,
called `try!`.

The difference is that
`try` will give us `nil` if we try to
access a property that doesn't exist on **data**.
Whereas, `try!` will result in an error.

```ruby
if data.try!(:oliver).try!(:wins)
  puts data.oliver.wins
end
```