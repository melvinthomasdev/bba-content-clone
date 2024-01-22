We can use the spread operator
to insert the key-value pairs of an object
into another object.

<codeblock language="javascript" type="lesson">
<code>
const cat = {
  numberOfLegs: 4,
  canFly: false,
};
const dog = { ...cat };

console.log(dog);
</code>
</codeblock>

In the example given above,
we are using the spread operator
to insert the key-value pairs from `cat`
into `dog`.

In addition,
we can also add other key-value pairs to an object,
along with the spread operator,
as shown in the example below.

<codeblock language="javascript" type="lesson">
<code>
const cat = {
  numberOfLegs: 4,
  canFly: false,
};
const dog = {
  ...cat,
  height: 30,
};

console.log(dog);
</code>
</codeblock>

It is also possible to insert key-value pairs
from multiple objects at once,
using the spread operator.

<codeblock language="javascript" type="lesson">
<code>
const basicInfo = {
  name: "Oliver Smith",
  email: "oliver@example.com",
};
const workInfo = {
  yearsOfExperience: 4,
  isGraduate: true,
};
const userDetails = { ...basicInfo, ...workInfo };

console.log(userDetails);
</code>
</codeblock>