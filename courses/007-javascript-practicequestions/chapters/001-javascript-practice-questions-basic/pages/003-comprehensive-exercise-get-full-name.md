Declare a function `getFullName`
to return a string.
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

<Editor lang="javascript" type="exercise" testMode="multipleInput">
<code>
const getFullName = function(person) {
  // write your code here
}
</code>

<solution>
const getFullName = function(person) {
  const { firstName, lastName } = person;
  let fullName = "";
  if(firstName)
    fullName += firstName;
  if(firstName && lastName)
    fullName += " ";
  if(lastName)
    fullName += lastName;
  return fullName;
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
</Editor>