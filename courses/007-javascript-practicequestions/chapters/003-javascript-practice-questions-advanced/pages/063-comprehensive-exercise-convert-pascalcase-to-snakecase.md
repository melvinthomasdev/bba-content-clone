The function `toSnakeCase` should convert the input string from `PascalCase` to `snake_case`.

<Editor lang="javascript" type="exercise" testMode="multipleInput">
<code>
const toSnakeCase = (str) => {
  // your code here
};
</code>

<solution>
const toSnakeCase = (str) => {
  return (
    str.slice(0, 1).toLowerCase() +
    str
      .split("")
      .slice(1)
      .map((char) => {
        if (char == char.toUpperCase()) return "_" + char.toLowerCase();
        else return char;
      })
      .join("")
  );
};
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
</Editor>