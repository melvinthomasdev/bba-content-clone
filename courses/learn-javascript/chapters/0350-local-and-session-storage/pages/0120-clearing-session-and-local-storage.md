The `clear()` method in `localStorage` and `sessionStorage`
is used to remove all key-value pairs stored
in the web storage for that specific domain.

```js
localStorage.clear()
sessionStorage.clear()
```

<codeblock language="javascript" type="lesson">
<code>
sessionStorage.setItem('username', 'Renu Sen');
sessionStorage.setItem('userRole', 'admin');
sessionStorage.setItem('theme', 'light');

console.log(sessionStorage.getItem('username'));
console.log(sessionStorage.getItem('userRole'));
console.log(sessionStorage.getItem('theme'));

sessionStorage.clear();

console.log("After clear")

console.log(sessionStorage.getItem('username'));
console.log(sessionStorage.getItem('userRole'));
console.log(sessionStorage.getItem('theme'));
</code>
</codeblock>

In the above example, the `sessionStorage.clear()`
method is used to remove all previously stored key-value pairs.

Let's understand the impact of using `clear()` in localStorage:

```js
localStorage.setItem('sport', 'tennis');
localStorage.setItem('username', 'Eve Smith');

localStorage.clear();
```

We have intentionally put the above code block in a snippet so that you do not accidentally run it.

Please exercise **caution** and refrain from running
`localStorage.clear()` in the code block
or in the **console** of this webpage.
Doing so will result in clearing all your previous
progress in BigBinary Academy,
as we currently use localStorage to store your progress.

<image alt="Clearing Local Storage">local-storage-clear.png</image>
