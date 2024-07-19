If the number is less than or equal to **10**
and the string has a length greater than
or equal to **5**, or if the boolean is **true**,
log `true` to the console, else log `false`.

Use the following to test the code:

```js
number = 10;
string = "hi";
boolean = true;
```

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
// For the below values, the code should print true.
const givenNumber = 10;
const givenString = "hi";
const givenBoolean = true;

// Write code here
</code>
<solution>
// For the below values, the code should print true.
const givenNumber = 10;
const givenString = "hi";
const givenBoolean = true;

// Write code here

if (givenNumber <= 10 && givenString.length >= 5 || givenBoolean) {
console.log(true);
} else {
console.log(false);
};
</solution>
</codeblock>
