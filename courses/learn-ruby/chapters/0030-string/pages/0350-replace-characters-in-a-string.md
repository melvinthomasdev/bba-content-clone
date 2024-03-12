Let's say we have a string `ping`. We want to replace the character `i` with `o`, making the resulting string `pong`.

In Ruby, we can use the `tr` method to do this:

<codeblock language="ruby" type="lesson">
<code>
message = "ping"
acknowledgment_message = message.tr("i", "o")
puts acknowledgment_message
</code>
</codeblock>

In the above example, we are telling Ruby to replace the character `i` with `o` in the string `message`. The `tr` method is used to replace characters in a string. The first argument is the character to be replaced, and the second argument is the character to replace it with.

The `tr` method can also be used to replace multiple characters in a string at once. Look at the following example:


<codeblock language="ruby" type="lesson">
<code>
word = "hello"
new_word = word.tr("el", "ip")
puts new_word
</code>
</codeblock>

In the above example, we are replacing the characters `e` and `l` with `i` and `p` respectively. The `tr` method replaces the first character in the first argument with the first character in the second argument, the second character in the first argument with the second character in the second argument, and so on.


