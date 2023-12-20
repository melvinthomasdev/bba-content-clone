The `getItem(key)` method is used to
retrieve the value associated with
a specific key from the storage. 

<codeblock language="javascript" type="lesson">
<code>
localStorage.setItem('username', 'Eve Smith');

console.log(localStorage.getItem('username'));
</code>
</codeblock>

In the above example, the `getItem` method is used
to retrieve the value associated with the **username** key.

Let's look at how we do this in sessionStorage:

<codeblock language="javascript" type="lesson">
<code>
sessionStorage.setItem('session_active', 'true');

console.log(sessionStorage.getItem('session_active'));
</code>
</codeblock>

In the above example, the `getItem` method is used
to retrieve the value associated with the **session_active** key.
