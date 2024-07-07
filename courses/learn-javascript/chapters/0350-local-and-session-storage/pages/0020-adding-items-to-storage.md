The `setItem(key, value)` method
is used to add a **key-value** pair
to the storage.
Both key and value **must be strings**.

<codeblock language="javascript" type="lesson">
<code>
localStorage.setItem('sport', 'tennis');

sessionStorage.setItem('activity', 'hiking');
</code>
</codeblock>

In the example above, the `localStorage.setItem`
function is used to store the value **tennis**
with the key **sport** in the `localStorage`.
Similarly, the value **hiking** with
the key **activity** is stored in the `sessionStorage`.


<codeblock language="javascript" type="lesson">
<code>
localStorage.setItem('sport', 'cricket');

sessionStorage.setItem('activity', 'swimming');
</code>
</codeblock>

If an item with the same key already exists,
the `setItem` method will update it with the new value.
So, the value for the key **sport** will be updated to
**cricket** and the value for the key **activity**
will be updated to **swimming**.
