Look at the following example:

<codeblock language="ruby" type="lesson">
<code>
data = [
  12, ["top", "bottom"], [1, [100, 101]]
]
puts data[1][0]
puts data[2][1][0]
</code>
</codeblock>

To get the number **101**,
we can use `data[2][1][1]`.
But if we tried to
get to a nested array which doesn't exist
and then asked for a value in it,
this will cause an error.

<codeblock language="ruby" type="lesson">
<code>
data = [
  12, ["top", "bottom"], [1, [100, 101]]
]
puts data[2][1][1]
</code>
</codeblock>

In the above example,

- `data[2][1][1]` gives us the value **101**.

- Now, change `data[2][1][1]` to `data[2][1][2]`. This gives us
a `nil` value because the array referenced here, `[100, 101]`, has
no third element.

- Finally, change the puts statement inside the code editor
above to say `puts data[2][2][1]`. This throws an exception,
because when we say `data[2][2]`, we are trying
to access a value that doesn't exist. Ruby gives
us the `nil` value for this. But we go ahead, and
try to access a value on this `nil` value thinking
this is an array. This causes an error.

To prevent this error,
we can use `dig`. Take a look
at the example given below:

<codeblock language="ruby" type="lesson">
<code>
data = [
  12, ["top", "bottom"], [1, [100, 101]]
]

puts data.dig(0)
puts data.dig(1, 0)
puts data.dig(2, 1, 0)
puts data.dig(3, 1, 0)
</code>
</codeblock>

As you can see, searching for a
value on a non-existent array does not create
an exception. Instead, it simply
shows a `nil` value.

Also, `dig` is easier to read too!
