The `for` loop given below
prints the numbers from `1` to `30`.
Use the `continue` statement
in the `for` loop to print
only the numbers
that are divisible by `3`.

```js
Output:
0
3
6
9
12
15
18
21
24
27
30
```

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
for (let iteration = 0; iteration <= 30; iteration++) {
  console.log(iteration);
}
</code>

<solution>
for (let iteration = 0; iteration <= 30; iteration++) {
  if (iteration % 3 !== 0) {
    continue;
  }
  console.log(iteration);
}
</solution>
</codeblock>
