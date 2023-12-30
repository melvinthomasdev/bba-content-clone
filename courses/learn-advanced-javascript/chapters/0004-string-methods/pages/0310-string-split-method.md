The `split()` method is used to split a string
into an array of substrings based on a specified
separator.

```js
string.split(separator, limit)
```

It takes two arguments:

- **separator**: This specifies the character that is used
to determine where the string should be split.
This is an optional argument.

- **limit**: This specifies the maximum number of splits
that can be performed. This is also an optional argument.
If the limit is not specified or is 0, the entire string will be split.

<codeblock language="javascript" type="lesson">
<code>
const sentence = "The quick brown fox jumps over the lazy dog.";
const words = sentence.split(" ");
console.log(words);
</code>
</codeblock>

In the above example, to split the `sentence`into individual
`words` we used the space character as the separator and with
no specified limit value.


<codeblock language="javascript" type="lesson">
<code>
const fruits = "banana, apple, orange, watermelon, strawberry, papaya";
const fruitsArray = fruits.split(",", 3);
console.log(fruitsArray);
</code>
</codeblock>

In the example given above, `fruits.split(",")` splits the `fruits`
string into an array of substrings using the comma character as the
separator and the limit is set to 3. Thus, resulting in an array
consisting of first three fruits.


<codeblock language="javascript" type="lesson">
<code>
const sentence = "I love to eat pizza";
const sentenceArray = sentence.split();
console.log(sentenceArray);
</code>
</codeblock>

In the above example, without any separator the `split()` method will
not split the `sentence` into individual words. Thus, the entire `sentence`
becomes a single element of the resulting array.
