The kids have been given
apples.

`Eve`, `Sam`, `Linh`
and `Carlos` have a certain
number of apples.

No two kids will have the
same number of apples.

Find who has the highest number
of apples and log it to the
console.

```js
Output:
`Linh possesses the largest quantity of apples, with a total count of 12.`
```
<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const numberOfApplesEve = 7;
const numberOfApplesSam = 9;
const numberOfApplesLinh = 12;
const numberOfApplesCarlos = 4;

// Write code below this line
</code>

<solution>
const numberOfApplesEve = 7;
const numberOfApplesSam = 9;
const numberOfApplesLinh = 12;
const numberOfApplesCarlos = 4;

// Write code below this line
const maxNumberOfApples = Math.max(numberOfApplesEve, numberOfApplesSam, numberOfApplesLinh, numberOfApplesCarlos);

const kidWithMostApple = {
 name: "",
 count: maxNumberOfApples
 };

if (maxNumberOfApples === numberOfApplesEve) {
  kidWithMostApple.name = "Eve";
}
if (maxNumberOfApples === numberOfApplesSam) {
  kidWithMostApple.name = "Sam";
}
if (maxNumberOfApples === numberOfApplesLinh) {
    kidWithMostApple.name = "Linh";
}
if (maxNumberOfApples === numberOfApplesCarlos) {
  kidWithMostApple.name = "Carlos";
}

console.log(`${kidWithMostApple.name} possesses the largest quantity of apples, with a total count of ${maxNumberOfApples}.`)
</solution>
</codeblock>
