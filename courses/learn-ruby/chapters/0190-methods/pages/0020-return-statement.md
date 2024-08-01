In Ruby, methods automatically return the value of the last evaluated expression, so an explicit `return` statement is often unnecessary. However, you can use `return` if you want to exit the method early or return a specific value.

## Implicit Return

Here's an example where Ruby implicitly returns the last evaluated expression:

<codeblock language="ruby" type="lesson">
<code>
def add(a, b)
  a + b
end

puts add(2, 3)

</code>
</codeblock>

In this case, `a + b` is the last line in the method, so its value 5 is returned automatically.

## Explicit Return

You can use `return` to exit a method early or to make the return value clearer:

<codeblock language="ruby" type="lesson">
<code>
def add(a, b)
  return a + b
end

puts add(2, 3)

</code>
</codeblock>

## Early Return

If you need to exit a method early, you can use `return` with or without a value:

<codeblock language="ruby" type="lesson">
<code>
def divide(a, b)
  return "Cannot divide by zero" if b == 0
  a / b
end

puts divide(10, 2)
puts divide(10, 0)

</code>
</codeblock>
