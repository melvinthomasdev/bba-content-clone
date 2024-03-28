Remove the item **fruit** from localStorage and
console log its value.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
localStorage.setItem('fruit', 'Mango');

// Write your code here
</code>

<solution>
localStorage.setItem('fruit', 'Mango');

// Write your code here
localStorage.removeItem('fruit');
console.log(localStorage.getItem('fruit'));
</solution>
</codeblock>
