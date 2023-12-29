The `includes()` method
returns `true`
if the given substring is found in a string
otherwise
it returns `false`.

<codeblock language="javascript" type="lesson">
<code>
const message = "Sam loves mangoes.";

const doesMangoesExist = message.includes("mangoes");
console.log(doesMangoesExist);

const doesApplesExist = message.includes("apples");
console.log(doesApplesExist);
</code>
</codeblock>

We can achieve this using `indexOf()` as well.

<codeblock language="javascript" type="lesson">
<code>
const message = "Sam loves mangoes.";

const doesMangoesExist = message.indexOf("mangoes") > -1;
console.log(doesMangoesExist);

const doesApplesExist = message.indexOf("apples") > -1;
console.log(doesApplesExist);
</code>
</codeblock>

Although we can use `indexOf()` instead of `includes()`,
`indexOf()` is used when we not only have to check
if a substring is found in a string,
but also know the index of the string from which
that substring is found.
`includes()` is used when we only need
to check the presence of a substring.

<codeblock language="javascript" type="lesson">
<code>
const message = "Sam loves mangoes.";

if (message.includes("mangoes")) {
  console.log(`The substring "mangoes" does exist in the "${message}".`);
}

if (message.indexOf("mangoes") > 0) {
  console.log(`The substring "mangoes" is not at the beginning of the string.`);
}
</code>
</codeblock>