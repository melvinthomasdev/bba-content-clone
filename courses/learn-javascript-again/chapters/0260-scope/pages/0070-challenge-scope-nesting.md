Move the `console.log` statements to achieve the following output:

```js
Output:
"Sam's email: sam@example.com"
"Sam's phone: 9876543210"
```

<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const userProfile = () => {
  const user = {
    firstName: "Sam",
    lastName: "Smith",
  };

  const displayContactDetails = () => {
    const contactDetails = {
      email: "sam@example.com",
      phone: "9876543210",
    };
    console.log(`${user.firstName}'s phone: ${contactDetails.phone}`);
  }

  console.log(`${user.firstName}'s email: ${contactDetails.email}`);
  displayContactDetails();
}

userProfile();
</code>

<solution>
const userProfile = () => {
  const user = {
    firstName: "Sam",
    lastName: "Smith",
  };

  const displayContactDetails = () => {
    const contactDetails = {
      email: "sam@example.com",
      phone: "9876543210",
    };
    console.log(`${user.firstName}'s email: ${contactDetails.email}`);
    console.log(`${user.firstName}'s phone: ${contactDetails.phone}`);
  }

  displayContactDetails();
}

userProfile();
</solution>
</codeblock>
