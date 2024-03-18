Create an object `identity`
using the following properties:

| Key      | Value                 |
|----------|---------------------- |
| name     | Sam Smith             |
| age      | 30                    |
| city     | Pune                  |
| email    | sam.smith@example.com |

Update the property `city` with
the value `Mumbai `.

Use **bracket notation** to update
the object.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
// Write code below
</code>

<solution>
// Write code below
const identity = {
  name: "Sam Smith",
  age: 30,
  city: "Pune",
  email: "sam.smith@example.com"
};

identity["city"] = "Mumbai";

console.log(identity);
</solution>
</codeblock>
