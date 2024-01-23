The function `getFullName`
should return a string.
The returned string
must join the `firstName`
and the `lastName`
separated by a space.

1. If the `firstName` is not present,
return the `lastName` as the full name.

2. If the `lastName` is not present,
return the `firstName` as the full name.

3. If both `firstName` and `lastName` are not present,
return `" "` as the full name.

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const getFullName = person => {
  // write your code here
}
</code>

<solution>
const getFullName = person => {
  const { firstName, lastName } = person;

  if (!firstName && !lastName)
    return " ";

  if (firstName && lastName)
    return `${firstName} ${lastName}`;

  return `${firstName || lastName}`;
}
</solution>

<testcases>
<caller>
console.log(getFullName(person));
</caller>
<testcase>
<i>
const person = {
  firstName: 'Sherlock',
  lastName: 'Holmes'
};
</i>
</testcase>
<testcase>
<i>
const person = {
  firstName: 'Sherlock'
};
</i>
</testcase>
<testcase>
<i>
const person = {
  lastName: 'Holmes'
};
</i>
</testcase>
<testcase>
<i>
const person = {
  middleName: 'Scott'
};
</i>
</testcase>
</testcases>
</codeblock>