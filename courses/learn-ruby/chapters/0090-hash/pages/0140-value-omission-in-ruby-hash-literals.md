In **Ruby**, if the value of
a key inside a hash is not
specified, it will be assigned
a default value of `nil`.

From **Ruby** version 3.1,
we have an option to omit
the value in a hash,
provided that we have a
variable in scope with the
same name as the key.

The value stored in the
variable will be assigned
to the key inside the hash.

Let us take a look at
a few examples:

```ruby
dog = "Pluto"
cat = "Tom"

mammals = { dog: dog, cat: cat}
# Shorthand
animals = { dog:, cat:}

puts animals
puts mammals
```

As we can see from the above code,
both `mammals` and `animals` hash
have the same values.

When using the shorthand, 
make sure never to add variables as
a string. Doing this will throw
an error.

Let us look at another example:
```ruby
fish = "Clown-fish"
bird = "Seagull"

life = {"fish":, "bird":}
```
