Complete the JavaScript function to convert a JavaScript object into a query string format.

For example:

```text
Input:
obj = {
  name: 'Edwin',
  age: 10,
};

Output: name=Edwin&age=10
```

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const objectToQueryString = obj => {
  // write your code here
}
</code>

<solution>
  const objectToQueryString = obj => Object.keys(obj).map(key => `${key}=${obj[key]}`).join('&');
</solution>

<testcases>
<caller>
console.log(objectToQueryString(obj));
</caller>
<testcase>
<i>
const obj = {
  name: 'John Doe',
  age: 30,
  city: 'New York'
};
</i>
</testcase>
<testcase>
<i>
const obj = {
  fruit: 'Apple',
  color: 'Red',
  price: 1.5
};
</i>
</testcase>
</testcases>
</codeblock>
