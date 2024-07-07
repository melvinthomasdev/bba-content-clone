Use `new Map()` to create
a `iceCream` map with
the following key-value pairs:

| Key                                           | Value |
| --------------------------------------------- | ----- |
| { flavor: "Chocolate", topping: "Almond" }    | 250   |
| { flavor: "Chocolate", topping: "Raisins" }   | 240   |
| { flavor: "Vanilla", topping: "Choco Chips" } | 180   |

```js
Output:
[
 [{ flavor: "Chocolate", topping: "Almond" }, 250],
 [{ flavor: "Chocolate", topping: "Raisins" }, 240],
 [{ flavor: "Vanilla", topping: "Choco Chips" }, 180],
]
```

<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const iceCream = ;

console.log(iceCream);
</code>

<solution>
const iceCream = new Map([
 [{ flavor: "Chocolate", topping: "Almond" }, 250],
 [{ flavor: "Chocolate", topping: "Raisins" }, 240],
 [{ flavor: "Vanilla", topping: "Choco Chips" }, 180],
]);
console.log(iceCream);
</solution>
</codeblock>
