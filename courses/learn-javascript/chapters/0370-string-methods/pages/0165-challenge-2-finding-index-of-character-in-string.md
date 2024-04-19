Use the **indexOf()** method to find
the index of the first occurrence of
the following words in the string
stored in **wiseWords**.

- Find **live** starting from the
  **5th** position and store the result in **indexOfLive**.

- Find **were** starting from the
  **20th** position and store the result in **indexOfWere**.

- Find **forever** starting from the
  **40th** position and store the result in **indexOfForever**.

```js
Output:
61
53
66
```

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const wiseWords = "Live as if you were to die tomorrow. Learn as if you were to live forever.";

const indexOfLive =
const indexOfWere =
const indexOfForever =

console.log(indexOfLive);
console.log(indexOfWere);
console.log(indexOfForever);

</code>

<solution>
const wiseWords = "Live as if you were to die tomorrow. Learn as if you were to live forever.";

const indexOfLive = wiseWords.indexOf("live", 5);
const indexOfWere = wiseWords.indexOf("were", 20);
const indexOfForever = wiseWords.indexOf("forever", 40);

console.log(indexOfLive);
console.log(indexOfWere);
console.log(indexOfForever);

</solution>
</codeblock>
