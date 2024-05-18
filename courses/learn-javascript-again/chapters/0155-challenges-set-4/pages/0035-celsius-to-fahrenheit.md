The function **celsiusToFahrenheit**
converts Celsius values to Fahrenheit values.

The formula to convert Celsius to Fahrenheit
is **F = (C \* 9/5) + 32**.

For example:

```js
Input: celsius = 60

Output: 140
```

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
function celsiusToFahrenheit(celsius) {
  // write your code here
}
</code>

<solution>
function celsiusToFahrenheit(celsius) {
  const fahrenheit = (celsius * 9/5) + 32;
  return fahrenheit;
}
</solution>

<testcases>
<caller>
console.log(celsiusToFahrenheit(celsius));
</caller>
<testcase>
<i>
const celsius = 0;
</i>
</testcase>
<testcase>
<i>
const celsius = 25;
</i>
</testcase>
<testcase>
<i>
const celsius = 100;
</i>
</testcase>
<testcase>
<i>
const celsius = 37;
</i>
</testcase>
</testcases>
</codeblock>
