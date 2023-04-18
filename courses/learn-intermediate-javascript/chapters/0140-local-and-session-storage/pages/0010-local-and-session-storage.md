`LocalStorage` and `sessionStorage` are web storage objects which allow us
to store key/value pairs in the browser. Please note both key and value must be strings.

`sessionStorage` gets cleared when webpage session ends, but survives page refresh.

`localStorage` remains saved in the browser, even when the browser is restarted.

Both the storages provide **same** methods:

- **`setItem(key, value)`** sets a new item to the storage object equal to the given `key`-`value` pair.
- **`getItem(key)`** returns the `value` stored in that `key` from the storage object.
- **`removeItem(key)`** removes the `key`-`value` pair for that `key` from the storage object. ‌‌
- **`clear()`** to clear the whole storage object.
- **`length`** to get the number of items present in the storage object.


**localStorage:**

<codeblock language="javascript" type="lesson">
<code>
localStorage.setItem('sport', 'tennis');
console.log(localStorage.getItem('sport'));

console.log(localStorage.length);

localStorage.removeItem('sport');
console.log(localStorage.getItem('sport'));

console.log(localStorage.length);
</code>
</codeblock>

```js
localStorage.clear()
```

**Caution:** Do not run `localStorage.clear()` in the codeblock
or in the **console** of this webpage, this will lead
to clearing all your previous progress in BigBinary Academy,
as we are currently using localStorage to store your progress.


**sessionStorage:**

<codeblock language="javascript" type="lesson">
<code>
sessionStorage.setItem('name', 'kumar');
console.log(sessionStorage.getItem('name'));

console.log(sessionStorage.length);

sessionStorage.removeItem('name');
console.log(sessionStorage.getItem('name'));

sessionStorage.clear();
console.log(sessionStorage.length);
</code>
</codeblock>

      To view the `LocalStorage` and `sessionStorage` in your browser:

   - Chrome and Brave: Go to `Developer tools` > `Application` tab.

   - Firefox and Safari: Go to `Developer tools` > `Storage` tab.
