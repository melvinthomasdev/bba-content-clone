Use the **lastIndexOf()** method to find
the index of the last occurrence of the
following words in the string stored in **story**.

- Find **twist** and store the result in the variable **lastIndexOfTwist**.

- Find **characters** and store the result in the variable **lastIndexOfCharacters**.

- Find **intrigue** and store the result in the variable **lastIndexOfIntrigue**.

```js
Output:
40
137
123
```
<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const story = "As the story unfolded, twist emerged, a twist that deepened the intrigue. As the characters navigated the intricate web of intrigue, new characters emerged."

const lastIndexOfTwist =
const lastIndexOfCharacters =
const lastIndexOfIntrigue =

console.log(lastIndexOfTwist);
console.log(lastIndexOfCharacters);
console.log(lastIndexOfIntrigue);
</code>

<solution>
const story = "As the story unfolded, twist emerged, a twist that deepened the intrigue. As the characters navigated the intricate web of intrigue, new characters emerged."

const lastIndexOfTwist = story.lastIndexOf("twist");
const lastIndexOfCharacters = story.lastIndexOf("characters");
const lastIndexOfIntrigue = story.lastIndexOf("intrigue");

console.log(lastIndexOfTwist);
console.log(lastIndexOfCharacters);
console.log(lastIndexOfIntrigue);
</solution>
</codeblock>
