Print the multiplication
table of 6.

The output should look like this:

```
6 * 1 = 6
6 * 2 = 12
6 * 3 = 18
6 * 4 = 24
6 * 5 = 30
6 * 6 = 36
6 * 7 = 42
6 * 8 = 48
6 * 9 = 54
6 * 10 = 60
```

You are allowed to have only one `puts` in the whole program.

<codeblock language="ruby" type="exercise" testMode="fixedInput">
<code>
# Write your code here
</code>

<solution>
number = 6

(1..10).each do |index|
  result = index * number
  first_part = number.to_s + " * " + index.to_s
  second_part = " = " + result.to_s
  puts first_part + second_part
end
</solution>
</codeblock>
