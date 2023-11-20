Consider below details of a `person`. Remove `isActive`, `balance` and `picture` from it.

<codeblock language="javascript" type="exercise" testMode="fixedInput" packages="ramda">
<code>

const person = {
    "index": 0,
    "guid": "a184e55d-c402-484b-8422-068eea08cc0b",
    "isActive": false,
    "balance": "$2,660.25",
    "picture": "http://placehold.it/32x32",
    "age": 28,
    "eyeColor": "brown",
    "name": "Jenny Velasquez",
    "gender": "female",
    "company": "LUNCHPAD",
    "email": "jennyvelasquez@lunchpad.com",
    "phone": "+1 (899) 555-2563",
}

const newPerson = //Complete this

console.log(newPerson);

</code>
<solution>

const person = {
    "index": 0,
    "guid": "a184e55d-c402-484b-8422-068eea08cc0b",
    "isActive": false,
    "balance": "$2,660.25",
    "picture": "http://placehold.it/32x32",
    "age": 28,
    "eyeColor": "brown",
    "name": "Jenny Velasquez",
    "gender": "female",
    "company": "LUNCHPAD",
    "email": "jennyvelasquez@lunchpad.com",
    "phone": "+1 (899) 555-2563",
}

const newPerson = R.omit(['isAcitve','balance','picture'], person);
console.log(newPerson);

</solution>
</codeblock>
