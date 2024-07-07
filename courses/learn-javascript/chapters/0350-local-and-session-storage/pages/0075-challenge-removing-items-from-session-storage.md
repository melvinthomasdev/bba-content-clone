Remove the **user_role** item from `sessionStorage`
and log its value to the console.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
sessionStorage.setItem('user_role', 'admin');

// Write your code here
</code>

<solution>
sessionStorage.setItem('user_role', 'admin');

// Write your code here
sessionStorage.removeItem('user_role');
console.log(sessionStorage.getItem('user_role'));
</solution>
</codeblock>
