Sometimes in programming,
we need to use
non-printable items.

For example, on laptops,
if you press the wrong button,
then you hear a beep sound.
How do we tell the computer to
play that sound?

Researchers had agreed that `\a`
would be treated as
an alarm or a beep.

Notice that it starts with a `\`.

Because we are running Ruby online,
you won't be able to hear a beep,
but if you run `\a` on your laptop
after installing Ruby,
then you will be able to hear the beep.

These special instructions that
start with a backslash are
called **Escape Sequences**.

Given below is the list of
escape sequences with their
corresponding meaning:

| \` | Single quote |
| \" | Double quote |
| \a | Audible bell |
| \b | Backspace    |
| \f | Form feed    |
| \r | Carriage return |
| \s | A space |
| \t | Horizontal tab |
| \n | New line |

Let's try out the last one.

When we use escape sequence
in single quotes, then Ruby
treats it as a string and
nothing special happens.

<codeblock language="ruby" type="lesson">
<code>
string = 'I am John.\n I am 25 years old'
puts string
</code>
</codeblock>

In the example given above,
nothing special happened
and `\n` is printed as is.

If the string is in double quotes,
then Ruby obeys the rules
of escape sequence.

<codeblock language="ruby" type="lesson">
<code>
string = "I am John.\n I am 25 years old"
puts string
</code>
</codeblock>

In this case,
because of `\n`,
we get a new line.