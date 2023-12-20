Use `sessionStorage` to store the
value **en-US** for the key **language**,
and then log to the console by retrieving it's value from
`sessionStorage` using the key **language**.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
sessionStorage.setItem('language', 'en-US');

// Write your code here
</code>

<solution>
sessionStorage.setItem('language', 'en-US');

// Write your code here
console.log(sessionStorage.getItem('language'))
</solution>
</codeblock>
