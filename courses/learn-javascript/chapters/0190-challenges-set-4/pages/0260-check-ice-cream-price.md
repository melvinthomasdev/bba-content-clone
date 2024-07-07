The function `checkIceCreamPrice` returns an appropriate
message based on the following conditions.

| Condition                                             | Message                               |
| ----------------------------------------------------- | ------------------------------------- |
| If the price of ice cream is less than `9`            | "You can afford one more!"            |
| If the price of ice cream is greater than or equal to `9`, but less than `100`           | "Your ice cream is fairly expensive!" |
| If the price of ice cream is `123`                    | "That is a lucky number, but still expensive!" |
| For all other prices                                  | "You bought an unusual dessert!"      |

For example:
```js
Input: price = 12

Output: "Your ice cream is fairly expensive!"
```
<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
function checkIceCreamPrice(price) {
  // write your code here
}
</code>

<solution>
function checkIceCreamPrice(price) {
  if (price < 9) {
    return "You can afford one more!";
  } else if (price >= 9 && price < 100) {
    return "Your ice cream is fairly expensive!";
  } else if (price === 123) {
    return "That is a lucky number, but still expensive!";
  } else {
    return "You bought an unusual dessert!";
  }
}
</solution>

<testcases>
<caller>
console.log(checkIceCreamPrice(price));
</caller>
<testcase>
<i>
const price = 5;
</i>
</testcase>
<testcase>
<i>
const price = 50;
</i>
</testcase>
<testcase>
<i>
const price = 123;
</i>
</testcase>
<testcase>
<i>
const price = 120;
</i>
</testcase>
</testcases>
</codeblock>
