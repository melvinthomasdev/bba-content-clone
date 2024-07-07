In JavaScript, we can convert
values of any data type to boolean.
We can use `Boolean()` to convert
any value to a boolean value.

<codeblock language="javascript" type="lesson">
<code>
const name = "Sam Smith";
console.log(Boolean(name));

const age = 32;
console.log(Boolean(age));

const experience = 0;
console.log(Boolean(experience));
</code>
</codeblock>

Values such as the number `0`,
`false`, `null`, `undefined`, `NaN`,
and
the empty string `""`,
will get converted to `false`.
These values are called
**falsy** values.

<codeblock language="javascript" type="lesson">
<code>
console.log(Boolean(0));
console.log(Boolean(false));
console.log(Boolean(null));
console.log(Boolean(undefined));
console.log(Boolean(NaN));
</code>
</codeblock>

All the values
we have mentioned above,
except the **falsy** values,
are **truthy** values.

<codeblock language="javascript" type="lesson">
<code>
console.log(Boolean(12));
console.log(Boolean(true));
console.log(Boolean("Banana"));
console.log(Boolean(["Apple", "Mango"]));
console.log(Boolean({ name: "Sam Smith" }));
</code>
</codeblock>