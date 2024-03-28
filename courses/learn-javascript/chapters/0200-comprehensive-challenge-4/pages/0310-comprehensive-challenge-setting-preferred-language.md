The **getUserPreferredLanguage** function accepts a user object as input.
If a preferred language is specified in the user object,
it returns their language preference.
If no preferred language is specified,
it defaults to the **defaultLanguage**.

For example, with the user object `{ name: "John", preferredLanguage: "German" }`,
the function returns, **John's preferred language is German**.

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
function getUserPreferredLanguage(user) {
  const defaultLanguage = "English";
  // write your code here
}
</code>

<solution>
function getUserPreferredLanguage(user) {
  const defaultLanguage = "English";
  const language = user.preferredLanguage ?? defaultLanguage;
  return `${user.name}'s preferred language is ${language}`;
}
</solution>

<testcases>
<caller>
console.log(getUserPreferredLanguage(user));
</caller>
<testcase>
<i>
const user = {
  name: "Sam",
  preferredLanguage: "French"
};
</i>
</testcase>
<testcase>
<i>
const user = {
  name: "Eve"
};
</i>
</testcase>
<testcase>
<i>
const user = {
  name: "Renu",
  preferredLanguage: "Hindi"
};
</i>
</testcase>
<testcase>
<i>
const user = {
  name: "Lao",
  preferredLanguage: "Chinese"
};
</i>
</testcase>
</testcases>
</codeblock>
