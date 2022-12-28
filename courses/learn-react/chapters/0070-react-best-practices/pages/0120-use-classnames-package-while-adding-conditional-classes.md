In react, when writing conditional classnames instead of using `conditional`
if-else or ternary operator or switch statement we can use
[classnames](https://www.npmjs.com/package/classnames) package.

Instead of:

```javascript
var buttonClass;
if (this.state.status === "success") {
  buttonClass = "btn btn-success";
} else if (this.state.status === "warning") {
  buttonClass = "btn btn-warning";
} else if (this.state.status === "info") {
  buttonClass = "btn btn-info";
}

return <button className={buttonClass}>{this.state.status}</button>;
```

It can be written as:

```javascript
var buttonClass = classNames(
  "btn",
  { "btn-success": this.state.status === "success" },
  { "btn-warning": this.state.status === "warning" },
  { "btn-info": this.state.status === "info" }
);

return <button className={buttonClass}>{this.state.status}</button>;
```

`classNames` is a function which accepts any number of arguments which are
either string or object or array of strings/objects.

If the argument is a string, the string is included. A string argument is same
as a truthy key-value pair.

```javascript
classNames("active"); // 'active'
// Is short for
classNames({ active: true }); // 'active'
```

If the arguments are an object, only truthy keys are included and falsy keys are
ignored.

```javascript
classNames({
  green: true,
  red: false,
  large: true,
  small: false,
}); // 'green large'
```

If the arguments are an array of strings/objects, arrays are flattened
recursively and only strings and truthy keys are included.

```javascript
var classes = ["active", { green: true, red: false }, "enabled"];

classNames("small", classes); // 'small active green enabled'
```
