The function `toSnakeCase` should convert the input string from `PascalCase` to `snake_case`.

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const toSnakeCase = str => {
  // your code here
};
</code>

<solution>
const toSnakeCase = str =>
  str.slice(0, 1).toLowerCase() +
  str
    .split("")
    .slice(1)
    .map(char => char == char.toUpperCase() ? "_" + char.toLowerCase() : char)
    .join("");
</solution>

<testcases>
<caller>
console.log(toSnakeCase(str));
</caller>
<testcase>
<i>
const str = "RubyOnRails";
</i>
</testcase>
<testcase>
<i>
const str = "WeLoveJavascript";
</i>
</testcase>
<testcase>
<i>
const str = "PascalCase";
</i>
</testcase>
<testcase>
<i>
const str = "NBAssociation";
</i>
</testcase>
</testcases>
</codeblock>
