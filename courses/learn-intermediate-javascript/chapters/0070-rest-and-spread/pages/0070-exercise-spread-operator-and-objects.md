Create a new object `organization` that contains:

- key-value pairs from `basicInfo`.

- key-value pairs from `contactInfo`.

- add another property `email: "hello@bigbinary.com"`

<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const basicInfo = {
  name: "BigBinary",
  startYear: "2011",
}

const contactInfo = {
  website: "https://www.bigbinary.com/",
  location: "Miami, USA",
}

const organization = ;

console.log(organization);
</code>

<solution>
const basicInfo = {
  name: "BigBinary",
  startYear: "2011",
}

const contactInfo = {
  website: "https://www.bigbinary.com/",
  location: "Miami, USA",
}

const organization = {
  ...basicInfo,
  ...contactInfo,
  email: "hello@bigbinary.com",
};

console.log(organization);
</solution>
</codeblock>