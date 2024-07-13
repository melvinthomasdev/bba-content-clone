Create an object `menu`
with property `burger`
and value **40**.

Add additional properties
given in the table below
to the `menu` object using
**bracket notation**.

| Key           | Value      |
| ------------- | ---------- |
| french-fries  | 30         |
| veg-pizza     | 60         |

Log the value of `menu` to
the console.
```js
Output:
{
  burger: 40,
  french-fries: 30,
  veg-pizza: 60
}
```
<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
// Write code below
</code>
<solution>
// Write code below
const menu = {
  burger: 40
};

menu["french-fries"] = 30;
menu["veg-pizza"] = 60;

console.log(menu);
</solution>
</codeblock>