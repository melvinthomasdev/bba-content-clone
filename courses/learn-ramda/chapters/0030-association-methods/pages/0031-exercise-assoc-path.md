Use the `assocPath` function to change the `email` of the customer to `oliver@neworg.com`.

<codeblock language="javascript" type="exercise" testMode="fixedInput" packages="ramda">
<code>
const order = {
  id: 1,
  name: "ORD1",
  quantity: 10,
  customer: {
    name: "John",
    address: {
      city: "Miami",
      pin: 111111,
    },
    contact: {
      email: "oliver@example.com",
      phone: 9532277305,
    }
  }
};

console.log(R.assocPath()); //Complete the assocPath function.
</code>

<solution>
const order = {
  id: 1,
  name: "ORD1",
  quantity: 10,
  customer: {
    name: "John",
    address: {
      city: "Miami",
      pin: 111111,
    },
    contact: {
      email: "oliver@example.com",
      phone: 9532277305,
    }
  }
};

console.log(R.assocPath(["customer", "contact", "email"], "oliver@neworg.com", order));
</solution>
</codeblock>
