Use the `padStart` method to
add padding to the string `Hello World!`.

Make the length of the returned string **20**.

Use `@` for padding.

<Editor lang="javascript" type="exercise">
<code>
let greetings = "Hello World!";

console.log(greetings);
</code>

<solution>
let greetings = "Hello World!".padStart(20, "@");
console.log(greetings);
</solution>
</Editor>