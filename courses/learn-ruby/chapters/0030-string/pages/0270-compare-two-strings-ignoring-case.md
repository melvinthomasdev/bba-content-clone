Ruby provides the `casecmp` method to 
compare two strings without considering 
their case.

If `string1` and `string2` are the two 
strings you want to compare, the result
will be an integer that indicates the 
relationship between the two strings.

- If the result is 0, it indicates that both strings are equal, disregarding case.
- If the result is a positive number, it signifies that `string1` comes after `string2` in a dictionary order when ignoring case.
- If the result is a negative number, it means `string1` precedes `string2` in a dictionary order while ignoring case.
- If the result is `nil` it means that the two are incomparable.

<codeblock language="ruby" type="lesson">
<code>
string1 = "hello"
string2 = "HELLO"

result = string1.casecmp(string2)
puts result
</code>
</codeblock>