In USA, the phone numbers follow
a pattern. The pattern is like this:

```
xxx-xxx-xxxxx
```

When we ask the user to enter their
phone number, they can enter their
phone number in any of the following ways:

* 789-3459876
* 7893459876
* 786 345 9876
* 789.345.9876

</a>

The user will think that all of these
are correct ways to share the phone number.
But we want the phone number to match
a particular format.

Regular expressions can help
enforce that particular pattern.
If the user's pattern does not match
our format, then using regular expressions,
we can reject that data.

A regular expression starts with
`/` and ends with `/`.
The following is a regular expression:

```
/\d/
```

Here `\d` has a special meaning.
It stands for any digit.
Let's try to make use of it and the
meaning will become much clearer.

Let's say that we want to check
if a number is at least a three digit
number or not.
This is what we can do:

<Editor lang="ruby">
<code>
regex = /\d\d\d/
word = "123"

puts "three digit word" if word =~ regex
</code>
</Editor>

Ruby allows us to use `=~`
to check if a regular
expression is matching
with the word or not.

Let's see one more example.
This time, we want to see
if the zipcode **76981**
is made up of at least five digits or not.

<Editor lang="ruby">
<code>
regex = /\d\d\d\d\d/
word = "76981"

puts "five digit word" if word =~ regex
</code>
</Editor>