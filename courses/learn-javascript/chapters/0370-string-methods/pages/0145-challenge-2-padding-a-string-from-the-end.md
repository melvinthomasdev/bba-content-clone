Use the **padEnd** method to pad the
following numbers with asterisks `*`
to meet specific length requirements.

- Ensure the **phoneNumber** is exactly 10 digits long.

- Ensure the **zipCode** is exactly 7 digits long.

- Ensure the **socialSecurityNumber** is exactly 16 digits long.

Store the values in the variables **paddedPhoneNumber**,
**paddedZipCode**, and **paddedSocialSecurityNumber** respectively.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const phoneNumber = "98725";
const zipCode = "770";
const socialSecurityNumber = "967045";

const paddedPhoneNumber =
const paddedZipCode =
const paddedSocialSecurityNumber =

console.log(paddedPhoneNumber);
console.log(paddedZipCode);
console.log(paddedSocialSecurityNumber);
</code>

<solution>
const phoneNumber = "98725";
const zipCode = "770";
const socialSecurityNumber = "967045";

const paddedPhoneNumber = phoneNumber.padEnd(10, "*");
const paddedZipCode = zipCode.padEnd(7, "*");
const paddedSocialSecurityNumber = socialSecurityNumber.padEnd(16, "*");

console.log(paddedPhoneNumber);
console.log(paddedZipCode);
console.log(paddedSocialSecurityNumber);
</solution>
</codeblock>
