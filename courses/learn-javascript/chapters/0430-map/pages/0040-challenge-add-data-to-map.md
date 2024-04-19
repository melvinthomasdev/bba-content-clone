Use the `map.set()` method to
add a property with the key
`{ flavor: "Pista", topping: "Choco Chips" }`
and
the value `200`
in the `iceCream` Map.

```js
Output:
Map {{"flavor":"Pista","topping":"Choco Chips"}: 200, constructor: Object}
```
<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const iceCream = new Map();
console.log(iceCream);
</code>

<solution>
const iceCream = new Map();
iceCream.set({ flavor: "Pista", topping: "Choco Chips" }, 200);
console.log(iceCream);
</solution>
</codeblock>
