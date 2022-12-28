The `endsWith()` method
returns `true` if
the string ends with
the given **substring**
and
returns `false` otherwise.

<codeblock language="javascript" type="lesson">
<code>
const email = "sam@example.com";
const isMemberEmail = email.endsWith("@example.com");
console.log(isMemberEmail);
</code>
</codeblock>

In the example given above,
`sam@example.com` ends
with the substring `@example.com`,
hence `email.endsWith("@example.com")`
returns `true`.
