In the example given below,
both the variables
`hello` and `name`
contain different string values:

<codeblock language="ruby" type="lesson">
<code>
hello = "Hello World"
name = "John Smith"
</code>
</codeblock>

In the case given below, we
have three strings with
the same value.

<codeblock language="ruby" type="lesson">
<code>
hello1 = "Hello"
hello2 = "Hello"
hello3 = "Hello"
</code>
</codeblock>

Even though the value is
same, for Ruby, these are
three different strings.

So, Ruby creates room to
have all the three strings
and
all strings take memory.

Memory is an expensive thing
when we are running programs.
We want to take as little memory
as possible.
That's where symbol comes in picture.

<codeblock language="ruby" type="lesson">
<code>
hello1 = :hello
hello2 = :hello
hello3 = :hello
</code>
</codeblock>

In this case, we
created three symbols.
However, the value is same
for all the three symbols,
so Ruby will
treat them as a single symbol.
This will take a lot less memory.

We can check if all the symbols
refer to the same thing or not
by asking each string
and each symbol what is their `object_id`.

Ruby assigns a unique
number to each item.

If the two items are in fact
the same item,
then they will have the
same `object_id`.

```text
puts "hello".object_id
puts "hello".object_id
puts "hello".object_id

puts :hello.object_id
puts :hello.object_id
puts :hello.object_id
```

```
47169019301560
47169019301420
47169019301360
1764508
1764508
1764508
```

Even though the string values
are the same, the `object_id`
value is different for strings.
This means all the strings are
stored as different units.

On the other hand,
the `object_id` value for each
symbol is the same. It means all
these symbols are the same.