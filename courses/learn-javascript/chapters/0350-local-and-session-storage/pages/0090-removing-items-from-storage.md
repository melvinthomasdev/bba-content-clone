The `removeItem(key)` method is used to
remove a key-value pair from the
storage based on the specified key. 

<codeblock language="javascript" type="lesson">
<code>
localStorage.setItem('hobby', 'Writing');
console.log(localStorage.getItem('hobby'));

localStorage.removeItem('hobby');
console.log(localStorage.getItem('hobby'));
</code>
</codeblock>

In the above example, the `removeItem` method is used
to remove the key-value pair associated with the key **hobby**.

Let's look at how we do this in sessionStorage:

<codeblock language="javascript" type="lesson">
<code>
sessionStorage.setItem('session_token', 'a1b2c3d4e5f6');
console.log(sessionStorage.getItem('session_token'));

sessionStorage.removeItem('session_token');
console.log(sessionStorage.getItem('session_token'));
</code>
</codeblock>

In the above example, the `removeItem` method is used
to remove the key-value pair associated with the key
**session_token**.
